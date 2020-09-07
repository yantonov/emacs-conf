;; -*- lexical-binding: t -*-

(require 'os-defuns)

(defun yantonov/file-expand-wildcards-single-or-nil (file)
  "Try to expand file using wildcards.
If single file found returns it, otherwise returns nil"
  (let ((expanded (file-expand-wildcards file)))
    (if (= 1 (length expanded))
        (car expanded)
      nil)))

(defmacro yantonov/find-system-type-specific-file (var-name wildcardlist)
  "Find single matched file for corresponding system type
Where var-name - variable to set,
wildcardlist list of os specific patterns '\(\(os1-predicate pattern1, os2-predicate pattern2\)\)"
  (let ((x (mapcar (lambda (handle)
                     (let ((os-predicate (car handle))
                           (pattern (car (cdr handle))))
                       (list (list os-predicate)
                             (list 'setq var-name (list 'yantonov/file-expand-wildcards-single-or-nil pattern)))))
                   (car (cdr wildcardlist)))))
    `(if (not ,var-name)
         (cond ,@x ))))

(defun yantonov/rename-current-buffer-file ()
  "Renames current buffer and file it is visiting."
  (interactive)
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not (and filename (file-exists-p filename)))
        (error "Buffer '%s' is not visiting a file!" name)
      (let ((new-name (read-file-name "New name: " filename)))
        (if (get-buffer new-name)
            (error "A buffer named '%s' already exists!" new-name)
          (rename-file filename new-name 1)
          (rename-buffer new-name)
          (set-visited-file-name new-name)
          (set-buffer-modified-p nil)
          (message "File '%s' successfully renamed to '%s'"
                   name (file-name-nondirectory new-name)))))))

(defun yantonov/delete-current-buffer-file ()
  "Removes file connected to current buffer and kills buffer."
  (interactive)
  (let ((filename (buffer-file-name))
        (buffer (current-buffer))
        (name (buffer-name)))
    (if (not (and filename (file-exists-p filename)))
        (ido-kill-buffer)
      (when (yes-or-no-p "Are you sure you want to remove this file? ")
        (delete-file filename)
        (kill-buffer buffer)
        (message "File '%s' successfully removed" filename)))))

(defun yantonov/open-with ()
  "Opens file with external app"
  (interactive)
  (when buffer-file-name
    (cond
     ((yantonov/linuxp)
      (let ((process-connection-type nil))
        (start-process ""
                       nil
                       (read-shell-command "Open current file with: ")
                       buffer-file-name))
      )
     ((yantonov/macp)
      (shell-command (format "open \"%s\"" buffer-file-name))  )
     ((yantonov/windowsp)
      (w32-shell-execute "open" (replace-regexp-in-string "/" "\\" buffer-file-name t t)))
     )))

(defun yantonov/open-in-desktop ()
  "Opens directory contained current file (buffer)."
  (interactive)
  (when buffer-file-name
    (let ((d (file-name-directory buffer-file-name)))
      (cond
       ((yantonov/linuxp)
        (let ((process-connection-type nil))
          (start-process ""
                         nil
                         "xdg-open"
                         d)))
       ((yantonov/macp)
        (shell-command (format "open \"%s\"" d))  )
       ((yantonov/windowsp)
        (w32-shell-execute "open" (replace-regexp-in-string "/" "\\" d t t)))))))

(defun yantonov/shell-execute-buffer-file ()
  "Executes shell command for current buffer file. Shall command exaple: bash %"
  (interactive)
  (let ((file-buffer (or (buffer-file-name) ""))
        (command (read-shell-command "Shell command: " nil nil nil)))
    (shell-command (replace-regexp-in-string "%" file-buffer command))))

(defun yantonov/sudo-edit (&optional arg)
  "Edit currently visited file as root.

With a prefix ARG prompt for a file to visit.
Will also prompt for a file to visit if current
buffer is not visiting a file."
  (interactive "P")
  (if (or arg (not buffer-file-name))
      (find-file (concat "/sudo:root@localhost:"
                         (ido-read-file-name "Find file(as root): ")))
    (find-alternate-file (concat "/sudo:root@localhost:" buffer-file-name))))

(defun yantonov/open-at-point ()
  "Open the file path under cursor.
If there is text selection, uses the text selection for path.
If the path is starts with “http://”, open the URL in browser.
Input path can be {relative, full path, URL}.
This command is similar to `find-file-at-point' but without prompting for confirmation.
"
  (interactive)
  (let ( (path (thing-at-point 'filename)))
    (if (string-match-p "\\`https*://" path)
        (progn (browse-url path))
      (progn ; not starting “http://”
        (if (file-exists-p path)
            (find-file path)
          (if (file-exists-p (concat path ".el"))
              (find-file (concat path ".el"))
            (progn
              (when (y-or-n-p (format "file doesn't exist: 「%s」. Create?" path) )
                (find-file path )))))))))

(provide 'file-defuns)
