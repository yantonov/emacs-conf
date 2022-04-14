;; (load-theme 'dracula t)

;; (load-theme 'moe-dark t)

;; (load-theme 'monokai t)

;; (load-theme 'tangotango t)

;; (load-theme 'vscode-dark-plus t)

;; (load-theme 'zenburn t)

;; desktop
(add-hook 'yantonov/after-make-window-system-frame-hooks
          '(lambda ()
             (load-theme 'moe-dark t)))

;; remote terminal
(add-hook 'yantonov/after-make-console-frame-hooks
          '(lambda ()
             (load-theme 'zenburn t)))

(provide 'emacs-rc-color-theme)
