;; Buffer-related defuns
(require 's)

(defun indent-buffer ()
  (interactive)
  (indent-region (point-min) (point-max)))