(use-package clojure-mode
  :defer t
  :init
  (progn
    (add-to-list 'auto-mode-alist '("\\.boot\\'" . clojure-mode))
    (add-to-list 'magic-mode-alist '(".* boot" . clojure-mode)))
  :config
  (progn
    (require 'projectile)
    (require 'company)

    (defun yantonov/clojure-mode-hook ()
      (let ((m clojure-mode-map))
        (define-key m [return] 'newline-and-indent)
        (define-key m (kbd "C-/") #'comment-or-uncomment-sexp)
        (define-key m (kbd "C-?") #'comment-or-uncomment-sexp)
        (define-key m (kbd "<tab>") #'hs-toggle-hiding))
      (projectile-mode)
      (company-mode)
      (smartparens-mode)

      ;; for adding require/use/import statements
      (yas-minor-mode 1)

      ;; hightlight-parentheses
      (show-paren-mode)

      ;; auto collapse namespaces and folds
      (hs-minor-mode 1))

    (add-hook 'clojure-mode-hook 'yantonov/clojure-mode-hook)))

(provide 'emacs-rc-clojure-mode)
