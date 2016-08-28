(require 'emacs-rc-smartparens)
(require 'rainbow-delimiters)
(require 'emacs-rc-highlight-symbol)

(defun yantonov/remove-elc-on-save ()
  "If you're saving an elisp file, likely the .elc is no longer valid."
  (add-hook 'after-save-hook
            (lambda ()
              (if (file-exists-p (concat buffer-file-name "c"))
                  (delete-file (concat buffer-file-name "c"))))
            nil
            t))

(defun yantonov/elisp-mode-hook ()
  (rainbow-delimiters-mode-enable)
  (yantonov/remove-elc-on-save)
  (highlight-symbol-nav-mode)
  (let ((m emacs-lisp-mode-map))
    (define-key m (kbd "C-/") #'comment-or-uncomment-sexp)
    (define-key m (kbd "C-?") #'comment-or-uncomment-sexp)
    (yantonov/apply-smartparens-keybindings m)))

(add-hook 'emacs-lisp-mode-hook 'yantonov/elisp-mode-hook)

(provide 'emacs-rc-elisp-mode)
