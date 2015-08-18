(defun yantonov/clojure-mode-hook ()
  (paredit-mode +1)
  (local-set-key [return] 'newline-and-indent)
  (rainbow-delimiters-mode-enable)
  (turn-on-eldoc-mode)
  (projectile-mode)
  (company-mode)
  (subword-mode))

(eval-after-load 'clojure-mode
  '(progn
     (require 'paredit)
     (require 'rainbow-delimiters)
     (require 'projectile)
     (require 'company)
     (add-hook 'clojure-mode-hook 'yantonov/clojure-mode-hook)
     (define-key clojure-mode-map (kbd "C-M-;") #'comment-or-uncomment-sexp)))

(provide 'emacs-rc-clojure-mode)
