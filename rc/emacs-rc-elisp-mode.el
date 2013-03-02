(require 'paredit)
(require 'highlight-parentheses)
(require 'rainbow-delimiters)

(defun my-elisp-mode-hook ()
  (paredit-mode +1)
  (highlight-parentheses-mode t)
  (rainbow-delimiters-mode-enable)
  )

(add-hook 'emacs-lisp-mode-hook 'my-elisp-mode-hook)
