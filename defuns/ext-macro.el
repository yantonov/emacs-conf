(defmacro yantonov/run (program-name program-args fn-alias)
  "Return a function that runs the executable EXEC."
  (let ((func-name
         (intern (concat "yantonov/run-executable-"
                         (if fn-alias fn-alias program-name)))))
    `(progn
       (defun ,func-name ()
         ,(format "Run the %s executable [args=%s]." ,program-name ,program-args)
         (interactive)
         (message (format "Run the %s executable [args=%s]." ,program-name ,program-args))
         (start-process "" nil ,program-name ,@program-args))
       ',func-name)))

(defmacro yantonov/browse (url fn-alias)
  "Return a function that calls `browse-url' on URL."
  (let ((func-name
         (intern (concat "yantonov/browse-url-"
                         (if fn-alias fn-alias url)))))
    `(progn
       (defun ,func-name ()
         ,(format "Browse to the url %s." url)
         (interactive)
         (message (format "Browse to the url %s." url))
         (browse-url ,url))
       ',func-name)))

(provide 'ext-macro)
