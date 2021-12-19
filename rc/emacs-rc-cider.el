(use-package cider
  :ensure t
  :init
  (progn
    (setq cider-stacktrace-default-filters '(tooling dup)
          cider-repl-pop-to-buffer-on-connect t
          cider-prompt-save-file-on-load nil
          cider-repl-use-clojure-font-lock t
          ;; hide special buffers
          nrepl-hide-special-buffers t
          ;; Log communication with the nREPL server (extremely useful for debugging CIDER problems):
          nrepl-log-messages t
          ;; Don't show on error:
          cider-show-error-buffer nil))
  :config
  (progn

    (defun yantonov/cider-eval-first-sexp ()
      (interactive)
      (let ((debug-on-error t))
        (save-excursion
          (forward-sexp 1)
          (cider-eval-last-sexp))))

    (defun my-cider-common-hook ()
      (let ((m cider-mode-map))
        (define-key m (kbd "C-c C-q") 'nrepl-close)
        (define-key m (kbd "C-c C-Q") 'cider-quit)
        (define-key m (kbd "C-c C-a") 'yantonov/cider-eval-first-sexp))
      (rainbow-delimiters-mode-enable)
      (company-mode))

    (defun my-cider-mode-hook ()
      (subword-mode)
      (my-cider-common-hook))

    (defun my-repl-mode-hook ()
      (my-cider-common-hook))


    (add-hook 'cider-mode-hook 'my-cider-mode-hook)
    (add-hook 'cider-repl-mode-hook 'my-repl-mode-hook)))

(provide 'emacs-rc-cider)
