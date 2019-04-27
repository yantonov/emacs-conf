;; -*- lexical-binding: t -*-

(defun symbol-to-string (&args) (apply 'symbol-name args))
(defun string-to-symbol (&args) (apply 'intern args))

(provide 'string-defuns)
