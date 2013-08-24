(require 'rainbow-mode)

(defun my-css-mode-hook ()
  (rainbow-mode t))

(add-hook 'css-mode-hook 'my-css-mode-hook)

(provide 'emacs-rc-css-mode)
