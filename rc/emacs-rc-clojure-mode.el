(require 'clojure-mode-autoloads)

(defun yantonov/clojure-mode-hook ()
  (paredit-mode +1)
  (local-set-key [return] 'newline-and-indent)
  (highlight-parentheses-mode t)
  (rainbow-delimiters-mode-enable)
  ;; show-paren-mode
  ;; http://emacswiki.org/emacs/ShowParenMode
  (show-paren-mode 1)
  (setq show-paren-style 'expression)
  (turn-on-eldoc-mode)
  (projectile-on))

(eval-after-load 'clojure-mode
  '(progn
     (require 'paredit)
     (require 'highlight-parentheses)
     (require 'rainbow-delimiters)
     (require 'clojure-test-mode)
     (require 'projectile)
     (add-hook 'clojure-mode-hook 'yantonov/clojure-mode-hook)))

(provide 'emacs-rc-clojure-mode)
