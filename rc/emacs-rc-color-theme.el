;; moe-theme
;; (load-theme 'moe-dark t)

;; monokai-theme
;; (load-theme 'monokai t)

;; tango dark
;; (load-theme 'tangotango t)

;; adwaita
;; (load-theme 'adwaita t)

;; vscode dark plus
;; (load-theme 'vscode-dark-plus t)

(add-hook 'yantonov/after-make-window-system-frame-hooks
      '(lambda ()
         (load-theme 'tangotango t)))
(add-hook 'yantonov/after-make-console-frame-hooks
      '(lambda ()
         (load-theme 'zenburn t)))

(provide 'emacs-rc-color-theme)
