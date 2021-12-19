;; (load-theme 'moe-dark t)

;; (load-theme 'monokai t)

;; (load-theme 'tangotango t)

;; vscode dark plus
;; (load-theme 'vscode-dark-plus t)

;; desktop
(add-hook 'yantonov/after-make-window-system-frame-hooks
          '(lambda ()
             (load-theme 'vscode-dark-plus t)))

;; remote terminal
(add-hook 'yantonov/after-make-console-frame-hooks
          '(lambda ()
             (load-theme 'zenburn t)))

(provide 'emacs-rc-color-theme)
