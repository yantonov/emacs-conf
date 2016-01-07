(defun filter-list (condp lst)
  "filter list by given predicate condp"
  (delq nil
        (mapcar (lambda (x) (and (funcall condp x) x)) lst)))

(defun parent-dir (dir)
  "returns parent directory"
  (file-name-directory (directory-file-name dir)))

(provide 'core-funcs)
