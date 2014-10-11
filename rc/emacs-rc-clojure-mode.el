(require 'clojure-mode-autoloads)

(defun yantonov/clojure-mode-hook ()
  (paredit-mode +1)
  (local-set-key [return] 'newline-and-indent)
  (highlight-parentheses-mode t)
  (rainbow-delimiters-mode-enable)
  (turn-on-eldoc-mode)
  (projectile-mode))

(eval-after-load 'clojure-mode
  '(progn
     (require 'paredit)
     (require 'highlight-parentheses)
     (require 'rainbow-delimiters)
     (require 'projectile)
     (add-hook 'clojure-mode-hook 'yantonov/clojure-mode-hook)))

(provide 'emacs-rc-clojure-mode)
