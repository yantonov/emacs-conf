;; Non-interactive `package-autoremove' for batch use.
;; `package-autoremove' prompts and, with an empty `package-selected-packages',
;; offers to remove every package.  Seed the list in memory only, so that we
;; never write to the user's init file from a script.
(defun yantonov/autoremove-packages ()
  (unless (consp package-selected-packages)
    (setq package-selected-packages (package--find-non-dependencies)))
  (let ((removable (package--removable-packages)))
    (dolist (pkg removable)
      (package-delete (cadr (assq pkg package-alist)) t))
    (message "Autoremove: %d package(s) removed" (length removable))))

(defun yantonov/autoremove-packages-command-line-argument-handler (switch)
  (yantonov/autoremove-packages))

(add-to-list 'command-switch-alist '("-autoremove-packages" . yantonov/autoremove-packages-command-line-argument-handler))

(provide 'autoremove-packages)
