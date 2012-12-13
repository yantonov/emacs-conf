(require 'auto-complete)
(add-to-list 'ac-dictionary-directories (concat emacs-mode-home "ac-dict"))
(require 'auto-complete-config)
(ac-config-default)
