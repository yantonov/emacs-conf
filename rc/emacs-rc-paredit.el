(use-package paredit
  :ensure t
  :commands paredit-mode
  :defines paredit-mode-map
  :bind (:map paredit-mode-map
              ;; ("C-<left>" . nil)
              ;; ("C-<right>" . nil)
              ("C-<up>" . backward-up-list)
              ("C-<down>" . down-list)
              ("C-<left>" . backward-sexp)
              ("C-<right>" . forward-sexp)
              ("C-M-," . paredit-forward-barf-sexp)
              ("C-M-." . paredit-forward-slurp-sexp))
  :init
  (add-hook 'clojure-mode-hook 'paredit-mode)
  (add-hook 'emacs-lisp-mode-hook 'paredit-mode))

(provide 'emacs-rc-paredit)
