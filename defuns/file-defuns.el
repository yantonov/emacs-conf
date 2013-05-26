(defun rename-current-buffer-file ()
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

(defun delete-current-buffer-file ()
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

(defun open-with ()
  "Opens file with external app"
  (interactive)
  (when buffer-file-name
    (cond
     ((string-equal system-type "gnu/linux")
      (let ((process-connection-type nil))
        (start-process ""
                       nil
                       (read-shell-command "Open current file with: ")
                       buffer-file-name))
      )
     ((string-equal system-type "darwin")
      (shell-command (format "open \"%s\"" buffer-file-name))  )
     ((string-equal system-type "windows-nt")
      (w32-shell-execute "open" (replace-regexp-in-string "/" "\\" buffer-file-name t t)))
     )))

(defun open-in-desktop ()
  "Opens directory contained current file (buffer)."
  (interactive)
  (when buffer-file-name
    (let ((d (file-name-directory buffer-file-name)))
      (cond
       ((string-equal system-type "gnu/linux")
        (let ((process-connection-type nil))
          (start-process ""
                         nil
                         "xdg-open"
                         d)))
       ((string-equal system-type "darwin")
        (shell-command (format "open \"%s\"" d))  )
       ((string-equal system-type "windows-nt")
        (w32-shell-execute "open" (replace-regexp-in-string "/" "\\" d t t)))))))

(defun shell-execute-buffer-file ()
  "Executes shell command for current buffer file. Shall command exaple: bash %"
  (interactive)
  (let ((file-buffer (or (buffer-file-name) ""))
        (command (read-shell-command "Shell command: " nil nil nil)))
    (shell-command (replace-regexp-in-string "%" file-buffer command))))

(defun sudo-edit (&optional arg)
  "Edit currently visited file as root.

With a prefix ARG prompt for a file to visit.
Will also prompt for a file to visit if current
buffer is not visiting a file."
  (interactive "P")
  (if (or arg (not buffer-file-name))
      (find-file (concat "/sudo:root@localhost:"
                         (ido-read-file-name "Find file(as root): ")))
    (find-alternate-file (concat "/sudo:root@localhost:" buffer-file-name))))

(defun open-at-point ()
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
