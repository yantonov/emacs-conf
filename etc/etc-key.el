(defun yantonov/menu-conf-file (key-map)
  (define-key-after key-map
    [menu-bar file file-operation-separator]
    '("--" . file-operation-separator)
    'kill-buffer)
  (define-key-after key-map
    [menu-bar file rename-file]
    '("Rename current buffer file" . yantonov/rename-current-buffer-file)
    'file-operation-separator)
  (define-key-after key-map
    [menu-bar file delete-file]
    '("Delete current buffer file" . yantonov/delete-current-buffer-file)
    'rename-file)
  (define-key-after key-map
    [menu-bar file file-paths-separator]
    '("--" . file-paths-separator)
    'delete-file)
  (define-key-after key-map
    [menu-bar file copy-file-name]
    '("Copy file name" . yantonov/copy-buffer-file-name-to-clipboard)
    'file-paths-separator)
  (define-key-after key-map
    [menu-bar file copy-file-path]
    '("Copy file path" . yantonov/copy-buffer-file-path-to-clipboard)
    'copy-file-name))

(defun yantonov/menu-conf-launcher (key-map)
  (define-key-after
    key-map
    [menu-bar launchermenu]
    (cons "Launch" (make-sparse-keymap "launchermenu menu"))
    'tools)

  (cond
   ((yantonov/windowsp)
    (define-key
      key-map
      [menu-bar launchermenu chrome]
      `("Keepass" . ,(yantonov/run "keepass"))))
   ((yantonov/linuxp)
    (define-key
      key-map
      [menu-bar launchermenu chrome]
      `("Keepass" . ,(yantonov/run "keepassx")))))

  (define-key
    key-map
    [menu-bar launchermenu launchidea]
    `("IntelliJ Idea" . ,(yantonov/run "idea"))))

(defun yantonov/kbd-conf-help()
  "quick navigate to library, function, variable definition, use C-h prefix"
  (define-key 'help-command (kbd "C-l") 'find-library)
  (define-key 'help-command (kbd "C-f") 'find-function)
  (define-key 'help-command (kbd "C-k") 'find-function-on-key)
  (define-key 'help-command (kbd "C-v") 'find-variable))

(defun yantonov/kbd-conf-mac (key-map)
  (if (yantonov/macp)
      (progn
        (setq mac-command-modifier 'meta)
        (setq mac-option-modifier 'super)
        (setq mac-control-modifier 'control)
        (setq ns-function-modifier 'hyper)
        (define-key key-map (kbd "M-_") 'undo)
        (define-key key-map (kbd "M-N") 'projectile-find-file)
        (define-key key-map (kbd "H-SPC") 'set-mark-command)
        (define-key key-map (kbd "C-M-m") 'yantonov/toggle-fullscreen))))

(defun yantonov/kbd-conf-win (key-map)
  "see http://ergoemacs.org/emacs/emacs_hyper_super_keys.html for details"
  (if (yantonov/windowsp)
      (progn
        (setq w32-pass-lwindow-to-system nil
              w32-pass-rwindow-to-system nil
              w32-pass-apps-to-system nil
              w32-lwindow-modifier 'super
              w32-rwindow-modifier 'super
              w32-apps-modifier 'hyper))))

(defun yantonov/kbd-conf ()
  "load all key customizations"
  (interactive)
  (yantonov/kbd-conf-mac (current-global-map))
  (yantonov/kbd-conf-win (current-global-map))
  (yantonov/menu-conf-file (current-global-map))
  (yantonov/menu-conf-launcher (current-global-map))
  (yantonov/kbd-conf-help))

(yantonov/kbd-conf)

(provide 'etc-key)
