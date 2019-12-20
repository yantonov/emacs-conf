;; moe-theme
;; (load-theme 'moe-dark t)

;; noctilux
;; (load-theme 'noctilux t)

;; monokai-theme
;; (load-theme 'monokai t)

;; tango dark
;; (load-theme 'tangotango t)

;; dracula dark
;; (load-theme 'dracula t)

(add-hook 'yantonov/after-make-window-system-frame-hooks
      '(lambda ()
         (load-theme 'adwaita t)))
(add-hook 'yantonov/after-make-console-frame-hooks
      '(lambda ()
         (load-theme 'zenburn t)))

(provide 'emacs-rc-color-theme)
