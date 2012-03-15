;; linum (line numbers) settings
(add-to-list 'load-path (concat emacs-mode-home "linumplus/"))
(require 'linum+)
(setq linum-format "%d ")
(global-linum-mode 1)