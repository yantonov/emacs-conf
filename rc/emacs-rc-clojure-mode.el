(load "clojure-mode-autoloads.el")

(defun yantonov/clojure-mode-hook ()
  (paredit-mode +1)
  (local-set-key [return] 'newline-and-indent)
  (rainbow-delimiters-mode-enable)
  (turn-on-eldoc-mode)
  (projectile-mode)
  (company-mode))

(eval-after-load 'clojure-mode
  '(progn
     (require 'paredit)
     (require 'rainbow-delimiters)
     (require 'projectile)
     (require 'company)
     (add-hook 'clojure-mode-hook 'yantonov/clojure-mode-hook)))

(provide 'emacs-rc-clojure-mode)
