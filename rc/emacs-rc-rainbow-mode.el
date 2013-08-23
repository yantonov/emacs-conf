(require 'rainbow-mode)

(add-hook 'html-mode-hook
          (lambda () (rainbow-mode t)))

(add-hook 'css-mode-hook
          (lambda () (rainbow-mode t)))

(provide 'emacs-rc-rainbow-mode)

