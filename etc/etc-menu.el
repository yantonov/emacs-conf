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
    ;; use Tools->Create Command-Line Launcher... to create start script named 'idea'
    `("IntelliJ Idea" . ,(yantonov/run "idea"))))

(defun yantonov/menu-conf ()
  (interactive)
  (yantonov/menu-conf-file (current-global-map))
  (yantonov/menu-conf-launcher (current-global-map)))

(yantonov/menu-conf)

(provide 'etc-menu)
