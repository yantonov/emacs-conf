(require 'color-theme)

;; solarized them
;; (load-theme 'solarized-dark t)

;; zen-and-art theme
;; (load-file (concat emacs-color-themes-home "/zen-and-art/zen-and-art.el"))
;; (color-theme-zen-and-art)

;; moe-theme
;; (load-theme 'moe-dark t)

;; noctilux
;; (load-theme 'noctilux t)

;; monokai-theme
;; (load-theme 'monokai t)

(add-hook 'yantonov/after-make-window-system-frame-hooks
          '(lambda ()
             (load-theme 'noctilux t)))
(add-hook 'yantonov/after-make-console-frame-hooks
          '(lambda ()
             (load-theme 'zenburn t)))

(provide 'emacs-rc-color-theme)
