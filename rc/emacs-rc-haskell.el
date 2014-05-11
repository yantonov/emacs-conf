(defun yantonov/haskell-mode-hook ()
  (local-unset-key (kbd "C-M-l"))
  (turn-on-haskell-doc-mode)
  (turn-on-haskell-indent))

(add-hook 'haskell-mode-hook 'yantonov/haskell-mode-hook)

(provide 'emacs-rc-haskell)
