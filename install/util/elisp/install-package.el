(defun yantonov/install-package (package-name)
  (let ((pkg (intern package-name)))
    (when (not (package-installed-p pkg))
      (package-install pkg))))

(defun yantonov/install-package-command-line-argument-handler (switch)
  (when (and command-line-args-left
             (not (string-match "^-" (car command-line-args-left))))
    (let ((package-name (pop command-line-args-left)))
      (yantonov/install-package package-name))))

(add-to-list 'command-switch-alist '("-install-package" . yantonov/install-package-command-line-argument-handler))
