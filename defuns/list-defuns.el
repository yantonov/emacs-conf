(defun somep (list)
  "Checks if at least one element of list is equal to true"
  (let ((value nil))
    (dolist (el list value)
      (setq value (or value (if el t nil))))))

(provide 'list-defuns)
