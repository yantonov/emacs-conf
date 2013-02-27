(require 'clojure-mode)
(require 'paredit)
(require 'highlight-parentheses)
(require 'rainbow-delimiters)

(add-to-list 'auto-mode-alist '("\\.cljs$" . clojure-mode))

(defun my-clojure-mode-hook ()
  (paredit-mode +1)
  (local-set-key [return] 'newline-and-indent)
  (highlight-parentheses-mode t)
  (rainbow-delimiters-mode-enable)
  )

(add-hook 'clojure-mode-hook 'my-clojure-mode-hook)
