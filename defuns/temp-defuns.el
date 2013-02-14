(setq random-tempfile-default-directory "~/")

(defun create-temp-buffer ()
  "Create an empty buffer with current datetime name."
  (interactive)
  (switch-to-buffer (concat "*temp-"
                            (concat (format-time-string "%Y-%m-%d__%H-%M-%S"
                                                        (current-time))
                                    "*")))
  )

(defun create-temp-file ()
  "Create temporary txt file with current datetime name."
  (interactive)
  (find-file (concat random-tempfile-default-directory
                     (concat "temp-"
                             (format-time-string "%Y-%m-%d__%H-%M-%S"
                                                 (current-time))) ".txt")))
