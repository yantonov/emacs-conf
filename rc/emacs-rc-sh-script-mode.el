(use-package sh-script
  :defer t
  :config
  (progn
    (add-hook 'sh-mode-hook
              (lambda ()
                (define-key sh-mode-map (kbd "C-/") 'yantonov/smart-comment)))))

(provide 'emacs-rc-sh-script-mode)
