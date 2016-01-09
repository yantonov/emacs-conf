(use-package clojure-mode
  :defer t
  :init
  (progn
    (add-to-list 'auto-mode-alist '("\\.boot\\'" . clojure-mode))
    (add-to-list 'magic-mode-alist '(".* boot" . clojure-mode)))
  :config
  (progn
    (require 'paredit)
    (require 'rainbow-delimiters)
    (require 'projectile)
    (require 'company)
    (require 'clj-refactor)

    (defun yantonov/clojure-mode-hook ()
      (local-set-key [return] 'newline-and-indent)
      (local-set-key (kbd "C-/") #'comment-or-uncomment-sexp)
      (local-set-key (kbd "C-?") #'comment-or-uncomment-sexp)
      (rainbow-delimiters-mode-enable)
      (turn-on-eldoc-mode)
      (projectile-mode)
      (company-mode)
      (subword-mode)
      (paredit-mode)
      ;; cljr-refactor settings
      (clj-refactor-mode 1)
      (yas-minor-mode 1) ; for adding require/use/import statements
      ;; This choice of keybinding leaves cider-macroexpand-1 unbound
      (cljr-add-keybindings-with-prefix "C-c C-m"))

    (add-hook 'clojure-mode-hook 'yantonov/clojure-mode-hook)

    (define-clojure-indent
      ;; Compojure
      (ANY 2)
      (DELETE 2)
      (GET 2)
      (HEAD 2)
      (POST 2)
      (PUT 2)
      (context 2)
      (defroutes 'defun)
      ;; Cucumber
      (After 1)
      (Before 1)
      (Given 2)
      (Then 2)
      (When 2)
      ;; Schema
      (s/defrecord 2)
      ;; test.check
      (for-all 'defun))))

(provide 'emacs-rc-clojure-mode)
