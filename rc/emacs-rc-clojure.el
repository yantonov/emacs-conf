;; *** clojure-mode BEGIN
(defun my-clojure-mode-hook ()
  (paredit-mode 1)
  (local-set-key [return] 'newline-and-indent)
  (highlight-parentheses-mode t)
  )
(add-hook 'clojure-mode-hook 'my-clojure-mode-hook)
;; *** clojure-mode END
