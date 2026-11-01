;; (load-theme 'dracula t)

;; (load-theme 'moe-dark t)

;; (load-theme 'gruber-darker t)

;; (load-theme 'monokai t)

;; (load-theme 'tangotango t)

;; (load-theme 'vscode-dark-plus t)

;; (load-theme 'zenburn t)

;; available in color-themes/custom, not installed by a script:
;; (load-theme 'bubbleberry t)

;; old color-theme.el style, need color-theme.el to load:
;; (color-theme-gentooish)
;; (color-theme-less)
;; (color-theme-subdued)

;; desktop
(add-hook 'yantonov/after-make-window-system-frame-hooks
          '(lambda ()
             (load-theme 'moe-dark t)))

;; remote terminal
(add-hook 'yantonov/after-make-console-frame-hooks
          '(lambda ()
             (load-theme 'zenburn t)))

(provide 'emacs-rc-color-theme)
