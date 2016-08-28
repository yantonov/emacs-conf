(require 'highlight-symbol)

(defun yantonov/highlight-symbol-hook ()
  (let ((m highlight-symbol-nav-mode-map))
    (define-key m (kbd "C-c C-s") 'highlight-symbol)
    (define-key m (kbd "C-c C-r") 'highlight-symbol-query-replace)))

(add-hook 'highlight-symbol-nav-mode-hook 'yantonov/highlight-symbol-hook)

(provide 'emacs-rc-highlight-symbol)
