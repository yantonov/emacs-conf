;;; clojure

(defun file-name ()
  (interactive)
  (print (expand-file-name (buffer-file-name)))
  )

(defun snippet--clojure-namespace-from-buffer-file-name ()
  (replace-regexp-in-string
   "_" "-"
   (replace-regexp-in-string
    "/" "."
    (chop-prefix
     "test/"
     (chop-prefix
      "src/"
      (chop-suffix
       ".clj"
       (substring (expand-file-name (buffer-file-name))
                  (length (expand-file-name (pt-project-root))))))))))

(defun snippet--clojure-namespace-under-test ()
  (replace-regexp-in-string
   "-test"
   ""
   (snippet--clojure-namespace-from-buffer-file-name)))

;; snippet-helper-helpers

(defun chop-suffix (suffix s)
  "Remove string 'suffix' if it is at end of string 's'"
  (let ((pos (- (length suffix))))
    (if (and (>= (length s) (length suffix))
             (string= suffix (substring s pos)))
        (substring s 0 pos)
      s)))

(defun chop-prefix (prefix s)
  "Remove string 'prefix' if it is at start of string 's'"
  (let ((pos (length prefix)))
    (if (and (>= (length s) (length prefix))
             (string= prefix (substring s 0 pos)))
        (substring s pos)
      s)))
