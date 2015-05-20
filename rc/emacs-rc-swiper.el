(require 'swiper)

;; projectile integration
;; (setq projectile-completion-system 'ivy)

(defun yantonov/ivy-mode-hook()
  (define-key ivy-minibuffer-map (kbd "TAB") 'ivy-alt-done)
  )

(add-hook 'ivy-mode-hook 'yantonov/ivy-mode-hook)

(ivy-mode 1)

(provide 'emacs-rc-swiper)
