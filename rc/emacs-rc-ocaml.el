(require 'tuareg)
(require 'utop)

(autoload 'utop-minor-mode "utop" "Minor mode for utop" t)
(add-hook 'tuareg-mode-hook 'utop-minor-mode)

(provide 'emacs-rc-ocaml)
