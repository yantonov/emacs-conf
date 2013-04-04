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
        (w32-shell-execute "open" (replace-regexp-in-string "/" "\\" d t t)))
       ))))
