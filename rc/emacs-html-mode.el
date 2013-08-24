(require 'rainbow-mode)

(defun my-html-mode-hook ()
  (rainbow-mode t))

(add-hook 'html-mode-hook 'my-html-mode-hook)

(provide 'emacs-rc-html-mode)
