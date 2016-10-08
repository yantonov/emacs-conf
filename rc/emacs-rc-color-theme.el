(require 'color-theme)

;; solarized theme
;; (load-theme 'solarized-dark t)

;; solarized light theme
;; (load-theme 'solarized-light t)

;; zen-and-art theme
;; (load-file (concat yantonov/emacs-color-themes-home "/zen-and-art/zen-and-art.el"))
;; (color-theme-zen-and-art)

;; darcula
;; (require 'darcula-theme)
;; (set-frame-font "Inconsolata-14") ;; your preferred main font face here

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
             (load-theme 'tangotango t)))
(add-hook 'yantonov/after-make-console-frame-hooks
          '(lambda ()
             (load-theme 'zenburn t)))

(provide 'emacs-rc-color-theme)
