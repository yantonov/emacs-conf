(autoload 'clojure-test-mode "clojure-test-mode.el" "clojure-test-mode" t)
(add-to-list 'auto-mode-alist '("\\.clj$" . clojure-test-mode))

(provide 'emacs-rc-clojure-test)
