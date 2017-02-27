;; -*- lexical-binding: t -*-

(defmacro yantonov/run (program-name &optional program-args)
  "Return a function that runs the executable EXEC."
  (let ((func-name
         (intern (concat "yantonov/run-executable-" program-name)))
        (args (if (eq nil program-args) '() program-args)))
    `(progn
       (defun ,func-name ()
         ,(format "Run the %s executable [args=%s]." program-name args)
         (interactive)
         (message (format "Run the %s executable [args=%s]." ,program-name ,args))
         (start-process "" nil ,program-name ,@args))
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
