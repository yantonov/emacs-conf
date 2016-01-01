(require 'paredit)
(require 'rainbow-delimiters)

(defun yantonov/remove-elc-on-save ()
  "If you're saving an elisp file, likely the .elc is no longer valid."
  (add-hook 'after-save-hook
            (lambda ()
              (if (file-exists-p (concat buffer-file-name "c"))
                  (delete-file (concat buffer-file-name "c"))))
            nil
            t))

(defun yantonov/elisp-mode-hook ()
  (paredit-mode 1)
  (rainbow-delimiters-mode-enable)
  (yantonov/remove-elc-on-save)
  (define-key emacs-lisp-mode-map (kbd "C-/") #'comment-or-uncomment-sexp)
  (define-key emacs-lisp-mode-map (kbd "C-?") #'comment-or-uncomment-sexp))

(add-hook 'emacs-lisp-mode-hook 'yantonov/elisp-mode-hook)

(provide 'emacs-rc-elisp-mode)
