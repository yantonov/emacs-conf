(defun yantonov/update-installed-packages ()
  (save-window-excursion
    (package-list-packages t)
    (package-menu-mark-upgrades)
    (package-menu-execute)))

(defun yantonov/update-installed-packages-command-line-argument-handler (switch)
  (yantonov/update-installed-packages))

(add-to-list 'command-switch-alist '("-update-packages" . yantonov/update-installed-packages-command-line-argument-handler))


