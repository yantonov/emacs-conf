;; -*- lexical-binding: t -*-

(defun cached (f)
  "evaluate once and cache it"
  (lexical-let ((value nil)
                (fn f))
    (lambda (&rest args)
      (if (eq value nil)
          (progn
            (setq value (funcall fn))
            value)
        value))))

(provide 'cache-defuns)
