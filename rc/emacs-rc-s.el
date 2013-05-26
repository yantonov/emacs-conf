(require 's)

(defun indent-buffer ()
  (interactive)
  (indent-region (point-min) (point-max)))

(provide 'emacs-rc-s)
