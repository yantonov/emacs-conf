(defun yantonov/kbd-conf-general (my-key-map)
  ;; copy/paste/cut
  (define-key my-key-map (kbd "C-c c") 'kill-ring-save)
  (define-key my-key-map (kbd "C-c v") 'yank)
  (define-key my-key-map (kbd "C-c x") 'kill-region)

  ;; revert
  (define-key my-key-map (kbd "C-S-r") 'revert-buffer)

  ;; search
  (define-key my-key-map (kbd "C-S-s") 'find-grep)

  ;; god-mode
  (define-key my-key-map (kbd "C-<escape>") 'god-local-mode)

  ;; ace-window
  (define-key my-key-map (kbd "C-x o") 'ace-window)

  ;;; indentation
  ;; inspired by intellij idea
  (define-key my-key-map (kbd "C-M-l") 'yantonov/indent-buffer)
  ;; inspired by intellij idea
  (define-key my-key-map (kbd "C-S-M-l") 'yantonov/indent-defun)
  ;; to-utf, no trailing whitespaces, no tabs
  (define-key my-key-map (kbd "C-c n") 'yantonov/cleanup-buffer-safe)

  ;; resize buffer key bindings
  ;; http://www.emacswiki.org/emacs/WindowResize
  (define-key my-key-map (kbd "C-S-M-<up>") 'buf-move-up)
  (define-key my-key-map (kbd "C-S-M-<right>") 'buf-move-right)
  (define-key my-key-map (kbd "C-S-M-<down>") 'buf-move-down)
  (define-key my-key-map (kbd "C-S-M-<left>") 'buf-move-left)

  (define-key my-key-map (kbd "C-S-<up>")     'enlarge-window)
  (define-key my-key-map (kbd "C-S-<right>")  'enlarge-window-horizontally)
  (define-key my-key-map (kbd "C-S-<down>")   'shrink-window)
  (define-key my-key-map (kbd "C-S-<left>")   'shrink-window-horizontally)

  ;; windows movement
  ;; http://www.emacswiki.org/emacs/WindMove
  (define-key my-key-map (kbd "S-<left>") 'windmove-left)
  (define-key my-key-map (kbd "S-<down>") 'windmove-down)
  (define-key my-key-map (kbd "S-<right>") 'windmove-right)
  (define-key my-key-map (kbd "S-<up>") 'windmove-up)
  ;; prevous window
  (define-key my-key-map (kbd  "C-x O") 'yantonov/goto-previous-window)

  ;; too long lines shows/hides by "C-C l"
  (define-key my-key-map (kbd "C-c l") 'toggle-truncate-lines)

  ;; wrapper to goto-line (show line number only during entering line number
  (define-key my-key-map [remap goto-line] 'yantonov/goto-line-with-feedback)

  ;; move lines (examples of using super key)
  (define-key my-key-map (kbd "M-S-<up>") 'yantonov/move-whole-line-or-region-up)
  (define-key my-key-map (kbd "M-S-<down>") 'yantonov/move-whole-line-or-region-down)

  ;;; new lines
  (define-key my-key-map "\r" 'newline-and-indent)
  ;; open new line like IntelliJIdea/Eclipse etc
  (define-key my-key-map (kbd "S-<return>") 'yantonov/smart-open-line)
  (define-key my-key-map (kbd "C-S-<return>") 'yantonov/smart-open-line-above)
  ;; join next line to current
  (define-key my-key-map  (kbd "M-j")
    (lambda ()
      (interactive)
      (join-line -1)))

  ;; file manupulations
  (define-key my-key-map (kbd "S-<f6>") 'yantonov/rename-current-buffer-file)
  (define-key my-key-map (kbd "S-<f8>") 'yantonov/delete-current-buffer-file)

  ;;; fullscreen
  ;; fullscreen eshell
  (define-key my-key-map (kbd "C-c e")
    'fullscreen-eshell)
  ;; fullscreen scratch
  (define-key my-key-map (kbd "C-c f")
    'fullscreen-scratch)

  ;; timeclock
  (define-key my-key-map (kbd "C-c ti") 'timeclock-in)
  (define-key my-key-map (kbd "C-c to") 'timeclock-out)
  (define-key my-key-map (kbd "C-c tc") 'timeclock-change)
  (define-key my-key-map (kbd "C-c tr") 'timeclock-reread-log)
  (define-key my-key-map (kbd "C-c tl") 'timeclock-visit-timelog)
  (define-key my-key-map (kbd "C-c tw") 'timeclock-when-to-leave-string)

  ;;; open
  ;; projectile
  (define-key my-key-map (kbd "C-S-n") 'projectile-find-file)
  ;; webjump
  (define-key my-key-map (kbd "C-x g") 'webjump)
  ;; open-with
  (define-key my-key-map (kbd  "C-c o") 'yantonov/open-with)
  ;; open-with
  (define-key my-key-map (kbd  "C-c g") 'yantonov/google)

  (define-key my-key-map (kbd "C-@") 'er/expand-region)

  ;; close all but this
  (define-key my-key-map (kbd "C-c k") 'yantonov/kill-other-buffers)

  ;; execute shell command for current buffer file
  (define-key my-key-map (kbd "M-!") 'yantonov/shell-execute-buffer-file)

  ;; close buffer aka IntelliJ Idea
  (define-key my-key-map (kbd "C-<f4>") 'kill-buffer)

  ;; rename tag
  (define-prefix-command 'tag-util-map)
  (define-key my-key-map (kbd "C-t") 'tag-util-map)
  (define-key tag-util-map (kbd "C-r") 'mc/mark-sgml-tag-pair)

  (define-key my-key-map (kbd "C-M-<insert>") 'yantonov/copy-buffer-file-path-to-clipboard)
  (define-key my-key-map (kbd "C-<insert>") 'yantonov/copy-buffer-file-name-to-clipboard))

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
  (yantonov/kbd-conf-general (current-global-map))
  (yantonov/kbd-conf-mac (current-global-map))
  (yantonov/kbd-conf-win (current-global-map))
  (yantonov/menu-conf-file (current-global-map))
  (yantonov/menu-conf-launcher (current-global-map))
  (yantonov/kbd-conf-help))

(yantonov/kbd-conf)

(provide 'etc-key)
