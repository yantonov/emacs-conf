(use-package smartparens-config
  :ensure smartparens
  :config
  (progn (show-smartparens-global-mode t)

         ;; https://ebzzry.com/en/emacs-pairs/
         (defmacro def-pairs (pairs)
           "Define functions for pairing. PAIRS is an alist of (NAME . STRING)
conses, where NAME is the function name that will be created and
STRING is a single-character string that marks the opening character.

  (def-pairs ((paren . \"(\")
              (bracket . \"[\"))

defines the functions WRAP-WITH-PAREN and WRAP-WITH-BRACKET,
respectively."
           `(progn
              ,@(loop for (key . val) in pairs
                      collect
                      `(defun ,(read (concat
                                      "wrap-with-"
                                      (prin1-to-string key)
                                      "s"))
                           (&optional arg)
                         (interactive "p")
                         (sp-wrap-with-pair ,val)))))

         (def-pairs ((paren . "(")
                     (bracket . "[")
                     (brace . "{")
                     (single-quote . "'")
                     (double-quote . "\"")
                     (back-quote . "`")))

         (bind-keys
          :map smartparens-mode-map
          ("C-M-a" . sp-beginning-of-sexp)
          ("C-M-e" . sp-end-of-sexp)

          ("C-<down>" . sp-down-sexp)
          ("C-<up>"   . sp-up-sexp)
          ("M-<down>" . sp-backward-down-sexp)
          ("M-<up>"   . sp-backward-up-sexp)

          ("C-M-f" . sp-forward-sexp)
          ("C-M-b" . sp-backward-sexp)

          ("C-M-n" . sp-next-sexp)
          ("C-M-p" . sp-previous-sexp)

          ("C-S-f" . sp-forward-symbol)
          ("C-S-b" . sp-backward-symbol)

          ("C-<right>" . sp-forward-slurp-sexp)
          ("M-<right>" . sp-forward-barf-sexp)
          ("C-<left>"  . sp-backward-slurp-sexp)
          ("M-<left>"  . sp-backward-barf-sexp)

          ("C-M-t" . sp-transpose-sexp)
          ("C-M-k" . sp-kill-sexp)
          ("C-k"   . sp-kill-hybrid-sexp)
          ("M-k"   . sp-backward-kill-sexp)
          ("C-M-w" . sp-copy-sexp)
          ("C-M-d" . delete-sexp)

          ("M-<backspace>" . backward-kill-word)
          ("C-<backspace>" . sp-backward-kill-word)
          ([remap sp-backward-kill-word] . backward-kill-word)

          ("M-[" . sp-backward-unwrap-sexp)
          ("M-]" . sp-unwrap-sexp)

          ("C-x C-t" . sp-transpose-hybrid-sexp)

          ("C-c ("  . wrap-with-parens)
          ("C-c ["  . wrap-with-brackets)
          ("C-c {"  . wrap-with-braces)
          ("C-c '"  . wrap-with-single-quotes)
          ("C-c \"" . wrap-with-double-quotes)
          ("C-c _"  . wrap-with-underscores)
          ("C-c `"  . wrap-with-back-quotes))))

(add-hook 'prog-mode-hook 'turn-on-smartparens-strict-mode)
(add-hook 'markdown-mode-hook 'turn-on-smartparens-strict-mode)

(provide 'emacs-rc-smartparens)
