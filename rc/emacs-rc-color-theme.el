;; solarized theme
;; (load-theme 'solarized-dark t)

;; solarized light theme
;; (load-theme 'solarized-light t)

;; zen-and-art theme
;; (load-theme 'zen-and-art t)

;; darcula
;; (load-theme 'darcula t)

;; moe-theme
;; (load-theme 'moe-dark t)

;; noctilux
;; (load-theme 'noctilux t)

;; monokai-theme
;; (load-theme 'monokai t)

;; tango dark
;; (load-theme 'tangotango t)

(add-hook 'yantonov/after-make-window-system-frame-hooks
      '(lambda ()
         (load-theme 'adwaita t)))
(add-hook 'yantonov/after-make-console-frame-hooks
      '(lambda ()
         (load-theme 'zenburn t)))

(provide 'emacs-rc-color-theme)
