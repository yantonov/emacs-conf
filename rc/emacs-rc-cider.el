(use-package cider
  :ensure t
  :init

  :config
  (setq cider-prompt-save-file-on-load nil
          
        ;; hide special buffers
        nrepl-hide-special-buffers t
          
        ;; Log communication with the nREPL server (extremely useful for debugging CIDER problems):
        ;; nrepl-log-messages t
          
        ;; Don't show on error:
        cider-show-error-buffer nil)
  :bind (:map cider-mode-map
              ("C-c C-q" . nrepl-close)
              ("C-c C-Q" . cider-quit)
              ("C-<return>" . cider-eval-defun-at-point)))

(provide 'emacs-rc-cider)
