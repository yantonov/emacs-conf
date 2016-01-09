(use-package clojure-mode
  :defer t
  :init
  (progn
    (add-to-list 'auto-mode-alist '("\\.boot\\'" . clojure-mode))
    (add-to-list 'magic-mode-alist '(".* boot" . clojure-mode)))
  :config
  (progn

    (defun yantonov/clojure-mode-hook ()
      (paredit-mode +1)
      (local-set-key [return] 'newline-and-indent)
      (local-set-key (kbd "C-/") #'comment-or-uncomment-sexp)
      (local-set-key (kbd "C-?") #'comment-or-uncomment-sexp)
      (rainbow-delimiters-mode-enable)
      (turn-on-eldoc-mode)
      (projectile-mode)
      (company-mode)
      (subword-mode))

    (progn
      (require 'paredit)
      (require 'rainbow-delimiters)
      (require 'projectile)
      (require 'company)
      ;; (require 'clj-refactor)
      )
    (add-hook 'clojure-mode-hook 'yantonov/clojure-mode-hook)))

(provide 'emacs-rc-clojure-mode)
