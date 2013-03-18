(require 'paredit)
(require 'highlight-parentheses)
(require 'rainbow-delimiters)

(defun my-elisp-mode-hook ()
  (paredit-mode +1)
  (highlight-parentheses-mode t)
  (rainbow-delimiters-mode-enable)
  ;; show-paren-mode
  ;; http://emacswiki.org/emacs/ShowParenMode
  (show-paren-mode 1)
  (setq show-paren-style 'expression)
  )
