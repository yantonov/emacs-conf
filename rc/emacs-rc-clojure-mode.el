(use-package clojure-mode
  :defer t
  :init
  (progn
    (add-to-list 'auto-mode-alist '("\\.boot\\'" . clojure-mode))
    (add-to-list 'magic-mode-alist '(".* boot" . clojure-mode)))
  :config
  (progn
    (require 'rainbow-delimiters)
    (require 'projectile)
    (require 'company)
    ;(require 'clj-refactor)

    (defun yantonov/clojure-mode-hook ()
      (let ((m clojure-mode-map))
        (define-key m [return] 'newline-and-indent)
        (define-key m (kbd "C-/") #'comment-or-uncomment-sexp)
        (define-key m (kbd "C-?") #'comment-or-uncomment-sexp)
        (define-key m (kbd "<tab>") #'hs-toggle-hiding))
      (rainbow-delimiters-mode-enable)
      (projectile-mode)
      (company-mode)
      (smartparens-mode)
      ;; cljr-refactor settings
      ;(clj-refactor-mode 1)
      (yas-minor-mode 1) ; for adding require/use/import statements
      ;; This choice of keybinding leaves cider-macroexpand-1 unbound
      ;(cljr-add-keybindings-with-prefix "C-c m")
      ;; hightlight-parentheses
      (show-paren-mode)
      ;; auto collapse namespaces and folds
      (hs-minor-mode 1))

    (add-hook 'clojure-mode-hook 'yantonov/clojure-mode-hook)))

(provide 'emacs-rc-clojure-mode)
