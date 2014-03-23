(autoload 'clojure-mode "clojure-mode.el" "clojure-mode" t)

(add-to-list 'auto-mode-alist '("\\.clj$" . clojure-mode))
(add-to-list 'auto-mode-alist '("\\.cljs$" . clojure-mode))

(defun my-clojure-mode-hook ()
  (paredit-mode +1)
  (local-set-key [return] 'newline-and-indent)
  (highlight-parentheses-mode t)
  (rainbow-delimiters-mode-enable)
  ;; show-paren-mode
  ;; http://emacswiki.org/emacs/ShowParenMode
  (show-paren-mode 1)
  (setq show-paren-style 'expression)
  (turn-on-eldoc-mode))

(eval-after-load 'clojure-mode
  '(progn
     (require 'paredit)
     (require 'highlight-parentheses)
     (require 'rainbow-delimiters)
     (add-hook 'clojure-mode-hook 'my-clojure-mode-hook)))

(provide 'emacs-rc-clojure-mode)
