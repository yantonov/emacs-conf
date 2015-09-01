(defun yantonov/kbd-conf-help()
  "quick navigate to library, function, variable definition, use C-h prefix"
  (define-key 'help-command (kbd "C-l") 'find-library)
  (define-key 'help-command (kbd "C-f") 'find-function)
  (define-key 'help-command (kbd "C-k") 'find-function-on-key)
  (define-key 'help-command (kbd "C-v") 'find-variable))

(yantonov/kbd-conf-help)

(provide 'etc-help)
