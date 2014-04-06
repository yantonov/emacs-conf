(require 'paredit)
(require 'highlight-parentheses)
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
  (paredit-mode +1)
  (highlight-parentheses-mode t)
  (rainbow-delimiters-mode-enable)
  ;; show-paren-mode
  ;; http://emacswiki.org/emacs/ShowParenMode
  (show-paren-mode 1)
  (setq show-paren-style 'expression)
  (yantonov/remove-elc-on-save))

(add-hook 'emacs-lisp-mode-hook 'yantonov/elisp-mode-hook)

(provide 'emacs-rc-elisp-mode)
