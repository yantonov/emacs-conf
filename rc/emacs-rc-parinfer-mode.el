(use-package parinfer
  :ensure t
  :init
  (progn
    (defun yantonov/enable-parinfer-mode ()
      (parinfer-mode)
      (parinfer-toggle-mode))
    ;; (add-hook 'clojure-mode-hook #'yantonov/enable-parinfer-mode)
    ;; (add-hook 'emacs-lisp-mode-hook #'yantonov/enable-parinfer-mode)
    ))

(provide 'emacs-rc-parinfer-mode)
