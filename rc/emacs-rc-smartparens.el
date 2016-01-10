(require 'smartparens-config)

(defun yantonov/smartparens-keybindings ()
  (append
   ;; general nagigation
   '(("C-M-f" sp-forward-sexp)
     ("C-M-b" sp-backward-sexp)
     ("C-M-n" sp-next-sexp)
     ("C-M-p" sp-previous-sexp)
     ("C-M-u" sp-backward-up-sexp)
     ("C-M-d" sp-down-sexp)
     ("C-M-(" sp-beginning-of-sexp)
     ("C-M-)" sp-end-of-sexp)
     ("C-M-t" sp-transpose-sexp)
     ("C-M-<backspace>" sp-backward-kill-sexp)
     ("C-M-k" sp-kill-sexp)
     ("C-M-w" sp-copy-sexp))
   ;; sexp navigation
   '(("C-M-<up>" sp-backward-up-sexp)
     ("C-M-<down>" sp-down-sexp)
     ("C-M-<left>" sp-backward-sexp)
     ("C-M-<right>" sp-forward-sexp))
   ;; shift parens
   '(("C-<left>" sp-backward-slurp-sexp)
     ("C-<right>" sp-forward-slurp-sexp)
     ("M-<left>" sp-forward-barf-sexp)
     ("M-<right>" sp-backward-barf-sexp)
     ("C-," sp-backward-slurp-sexp)
     ("C-." sp-forward-slurp-sexp)
     ("C-M-," sp-forward-barf-sexp)
     ("C-M-." sp-backward-barf-sexp))
   ;; move up and down
   '(("C-<up>" sp-splice-sexp-killing-around)
     ("C-<down>" sp-splice-sexp)
     ("M-[" sp-backward-unwrap-sexp)
     ("M-]" sp-unwrap-sexp))))

(defun yantonov/apply-smartparens-keybindings (mode-map)
  (dolist (binding (yantonov/smartparens-keybindings))
    (let ((key (kbd (car binding)))
          (fn (car (cdr binding))))
      (define-key mode-map key fn))))

(provide 'emacs-rc-smartparens)
