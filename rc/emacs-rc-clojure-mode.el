(use-package clojure-mode
  :defer t
  :init
  (progn
    (add-to-list 'auto-mode-alist '("\\.boot\\'" . clojure-mode))
    (add-to-list 'magic-mode-alist '(".* boot" . clojure-mode)))
  :config
  (progn
    (require 'emacs-rc-smartparens)
    (require 'rainbow-delimiters)
    (require 'projectile)
    (require 'company)
    (require 'clj-refactor)
    (require 'emacs-rc-highlight-parentheses)

    (defun yantonov/clojure-mode-hook ()
      (let ((m clojure-mode-map))
        (define-key m [return] 'newline-and-indent)
        (define-key m (kbd "C-/") #'comment-or-uncomment-sexp)
        (define-key m (kbd "C-?") #'comment-or-uncomment-sexp)
        (yantonov/apply-smartparens-keybindings clojure-mode-map))
      (rainbow-delimiters-mode-enable)
      (turn-on-eldoc-mode)
      (projectile-mode)
      (company-mode)
      (subword-mode)
      (smartparens-mode)
      ;; cljr-refactor settings
      (clj-refactor-mode 1)
      (yas-minor-mode 1) ; for adding require/use/import statements
      ;; This choice of keybinding leaves cider-macroexpand-1 unbound
      (cljr-add-keybindings-with-prefix "C-c m")
      ;; hightlight-parentheses
      (yantonov/init-highlight-parentheses)
      (highlight-parentheses-mode))

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
