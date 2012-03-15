;; *** clojure-mode BEGIN
;; emacs-mode-dir initialized in emacs-rc-env.el
(add-to-list 'load-path (concat emacs-mode-home "clojure-mode/"))
(setq clojure-home "/opt/clojure/jar/")
(autoload 'clojure-mode "clojure-mode" "A major mode for Clojure" t)
(add-to-list 'auto-mode-alist '("\\.clj$" . clojure-mode))

; concat tool func
(defun string-join (joiner strings)
  (string-join-accum joiner strings ""))

(defun string-join-accum (joiner strings accum)
  (cond ((not strings) accum)
    ((not (cdr strings)) (concat accum (car strings)))
    (t (string-join-accum joiner (cdr strings)
           (concat accum (car strings) joiner)))))

(defvar clj-cmd)
(setenv "CLJ_CMD"
        (setq clj-cmd
              (concat "java "
                      "-server "
                      "-Xms512m -Xmx512m -Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=8888 "
		      "-Dclojure.compile.path=classes "
                      "-cp "
                      (string-join ":" (append
                                        (file-expand-wildcards (concat clojure-home "*.jar") t)
                                        (file-expand-wildcards "./src" t)
                                        (file-expand-wildcards "./classes" t)					
                                        ))
                      " clojure.main")))

;; paredit enable code
(defun my-clojure-mode-hook ()
  (paredit-mode 1)
  (local-set-key [return] 'newline-and-indent)
  )
(add-hook 'clojure-mode-hook 'my-clojure-mode-hook)
;; *** clojure-mode END
