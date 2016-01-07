(load (concat yantonov/modes-home "/ess/ess-autoloads.el"))

(autoload 'R-mode "ess-site" "ESS" t)
(add-to-list 'auto-mode-alist '("\\.R\\'" . R-mode))
(add-to-list 'auto-mode-alist '("\\.r\\'" . R-mode))

(provide 'emacs-rc-ess)
