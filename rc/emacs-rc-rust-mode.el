(autoload 'rust-mode "rust-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))

(add-hook 'rust-mode-hook
          (lambda ()
            (setq rust-indent-offset 4)))

(provide 'emacs-rc-rust-mode)
