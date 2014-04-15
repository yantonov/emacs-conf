(defun yantonov/my-highlight-prog-keywords ()
  "highlight FIXME/TODO/BUG keywords"

  ;; action highlighting
  (font-lock-add-keywords
   nil
   '(("\\<\\(FIX\\(ME\\)?\\|TODO\\|BUG\\|HACK\\|OPTIMIZE\\|REFACTOR\\):"
      1 font-lock-warning-face t)))

  ;; done highlighting
  (font-lock-add-keywords
   nil
   '(("\\<\\(DONE\\):" 1 font-lock-doc-face t)))
  
  ;; highlight too long lines
  ;; (font-lock-add-keywords
  ;;  nil
  ;;  '(("^[^\n]\\{120\\}\\(.*\\)$"
  ;;     1
  ;;     font-lock-warning-face t)))
  )

(defun yantonov/prog-mode-hook ()
  (subword-mode 1)
  (yantonov/my-highlight-prog-keywords)
  (yantonov/prog-mode-hotkey-hook))

(add-hook 'prog-mode-hook 'yantonov/prog-mode-hook)

(provide 'emacs-rc-prog-mode)
