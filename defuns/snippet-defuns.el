;; snippet-helper-helpers

(defun yantonov/chop-suffix (suffix s)
  "Remove string 'suffix' if it is at end of string 's'"
  (let ((pos (- (length suffix))))
    (if (and (>= (length s) (length suffix))
             (string= suffix (substring s pos)))
        (substring s 0 pos)
      s)))

(defun yantonov/chop-prefix (prefix s)
  "Remove string 'prefix' if it is at start of string 's'"
  (let ((pos (length prefix)))
    (if (and (>= (length s) (length prefix))
             (string= prefix (substring s 0 pos)))
        (substring s pos)
      s)))

;;; clojure

(defun yantonov/file-name ()
  (interactive)
  (print (expand-file-name (buffer-file-name))))

(defun yantonov/snippet--clojure-namespace-from-buffer-file-name ()
  (replace-regexp-in-string
   "_" "-"
   (replace-regexp-in-string
    "/" "."
    (yantonov/chop-prefix
     "test/"
     (yantonov/chop-prefix
      "src/"
      (yantonov/chop-suffix
       ".clj"
       (substring (expand-file-name (buffer-file-name))
                  (length (expand-file-name (yantonov/pt-project-root))))))))))

(defun yantonov/snippet--clojure-namespace-under-test ()
  (replace-regexp-in-string
   "-test"
   ""
   (snippet--clojure-namespace-from-buffer-file-name)))

;;; javascript

(defun yantonov/js-method-p ()
  (save-excursion
    (word-search-backward "function")
    (looking-back ": ")))

(defun yantonov/js-function-declaration-p ()
  (save-excursion
    (word-search-backward "function")
    (looking-back "^\\s *")))

(defun yantonov/snippet--function-punctuation ()
  (if (js-method-p)
      (when (not (looking-at "[ \n\t\r]*}"))
        (insert ","))
    (unless (js-function-declaration-p)
      (if (looking-at "$") (insert ";")))))

(defun yantonov/snippet--function-name ()
  (if (js-function-declaration-p) "name" ""))

(provide 'snippet-defuns)
