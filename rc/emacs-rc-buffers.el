;; Buffer-related defuns

(defun indent-buffer ()
  (interactive)
  (indent-region (point-min) (point-max)))