;; snippet-helper-helpers

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
