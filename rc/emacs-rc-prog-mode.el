;;; emacs-rc-prog-mode.el ---

;; show FIXME/TODO/BUG keywords
(defun my-show-prog-keywords ()
  ;; highlight additional keywords
  (font-lock-add-keywords nil '(("\\<\\(FIXME\\|TODO\\|BUG\\):" 1 font-lock-warning-face t)))
  (font-lock-add-keywords nil '(("\\<\\(DONE\\):" 1 font-lock-doc-face t)))
  ;; highlight too long lines
  ;;(font-lock-add-keywords nil '(("^[^\n]\\{120\\}\\(.*\\)$" 1 font-lock-warning-face t)))
  )

(defun my-common-prog-hook ()
  (subword-mode 1)
  (my-show-prog-keywords))

(add-hook 'prog-mode-hook 'my-common-prog-hook)

(provide 'emacs-rc-prog-mode)
;;; emacs-rc-prog-mode.el ends here---
