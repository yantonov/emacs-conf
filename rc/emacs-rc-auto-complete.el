(require 'auto-complete)
(add-to-list 'ac-dictionary-directories (concat emacs-mode-home "ac-dict"))
(require 'auto-complete-config)
(ac-config-default)
(setq ac-delay 0.5)

(provide 'emacs-rc-auto-complete)
