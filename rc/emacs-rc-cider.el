(defun yantonov/cider-eval-first-sexp ()
      (interactive)
      (let ((debug-on-error t))
        (save-excursion
          (forward-sexp 1)
          (cider-eval-last-sexp))))

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
              ("C-c C-a" . yantonov/cider-eval-first-sexp)
              ("C-<return>" . cider-eval-defun-at-point)))

(provide 'emacs-rc-cider)
