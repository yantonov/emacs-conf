(use-package taskpaper-mode
  :defer t
  :init
  (progn
    (add-to-list 'auto-mode-alist '("\\.todo\\'" . taskpaper-mode)))
  :config
  (progn
    nil
    ))

(provide 'emacs-rc-taskpaper-mode)
