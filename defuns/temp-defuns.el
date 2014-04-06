(setq random-tempfile-default-directory "~/")

(defun yantonov/create-temp-buffer ()
  "Create an empty buffer with current datetime name."
  (interactive)
  (switch-to-buffer (concat "*temp-"
                            (concat (format-time-string "%Y-%m-%d__%H-%M-%S"
                                                        (current-time))
                                    "*"))))

(defun yantonov/create-temp-file ()
  "Create temporary txt file with current datetime name."
  (interactive)
  (find-file (concat random-tempfile-default-directory
                     (concat "temp-"
                             (format-time-string "%Y-%m-%d__%H-%M-%S"
                                                 (current-time))) ".txt")))

(defun yantonov/move-region-to-trash (start end)
  "Move selected text to associated trash buffer"
  (interactive "r")
  (if (use-region-p)
      (let ((buffer-file-name (if buffer-file-truename buffer-file-truename "scratch")))
        (let (
              (trash-file (concat (file-name-sans-extension (buffer-file-name)) palimpsest-trash-file-suffix  "." (file-name-extension (buffer-file-name))))
              (trash-buffer (concat (file-name-sans-extension (buffer-name)) palimpsest-trash-file-suffix "." (file-name-extension (buffer-file-name))))
              (oldbuf (current-buffer)))
          (save-excursion
            (if (file-exists-p trash-file) (find-file trash-file))
            (set-buffer (get-buffer-create trash-buffer))
            (set-visited-file-name trash-file)
            (goto-char (point-min))
            (insert-buffer-substring oldbuf start end)
            (newline)
            (save-buffer)
            (write-file buffer-file-truename))
          (kill-region start end)
          (switch-to-buffer oldbuf)
          (message (concat "Temporary file :" trash-file " saved."))))
    (message "No region selected")))

(provide 'temp-defuns)
