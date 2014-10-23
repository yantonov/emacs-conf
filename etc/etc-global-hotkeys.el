(defun yantonov/apply-general-keybindings (my-key-map)
  ;; copy/paste/cut
  (define-key my-key-map (kbd "C-c c") 'kill-ring-save)
  (define-key my-key-map (kbd "C-c v") 'yank)
  (define-key my-key-map (kbd "C-c x") 'kill-region)

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

  (if (yantonov/os-mac-p)
      (define-key my-key-map (kbd "H-SPC")   'set-mark-command))

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
  (define-key my-key-map (kbd "M-s-<up>") 'yantonov/move-line-up)
  (define-key my-key-map (kbd "M-s-<down>") 'yantonov/move-line-down)

  ;;; new lines
  (define-key my-key-map "\r" 'newline-and-indent)
  ;; open new line like IntelliJIdea/Eclipse etc
  (define-key my-key-map (kbd "S-<return>") 'yantonov/smart-open-line)
  (define-key my-key-map (kbd "<C-S-return>") 'yantonov/smart-open-line-above)
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

  ;; copy file path to clipboard
  (define-key my-key-map (kbd "C-M-<insert>") 'yantonov/copy-buffer-file-path-to-clipboard)
  (define-key my-key-map (kbd "C-<insert>") 'yantonov/copy-buffer-file-name-to-clipboard))

(defun yantonov/create-general-menu (key-map)
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

(defun yantonov/create-launcher-menu (key-map)
  (define-key-after
    key-map
    [menu-bar launchermenu]
    (cons "Launch" (make-sparse-keymap "launchermenu menu"))
    'tools)

  (cond
   ((yantonov/os-windows-p)
    (define-key
      key-map
      [menu-bar launchermenu chrome]
      `("Keepass" . ,(yantonov/run "keepass"))))
   ((yantonov/os-linux-p)
    (define-key
      key-map
      [menu-bar launchermenu chrome]
      `("Keepass" . ,(yantonov/run "keepassx")))))

  (define-key
    key-map
    [menu-bar launchermenu launchidea]
    `("IntelliJ Idea" . ,(yantonov/run "idea"))))

(defun yantonov/load-my-help-keybinding ()
  (define-key 'help-command (kbd "C-l") 'find-library)
  (define-key 'help-command (kbd "C-f") 'find-function)
  (define-key 'help-command (kbd "C-k") 'find-function-on-key)
  (define-key 'help-command (kbd "C-v") 'find-variable))

(defun yantonov/keyboard-settings-for-macos ()
  (if (yantonov/os-mac-p)
      (progn
        ;; setting Super, Hyper keys for Apple keyboard,
        ;; for emacs running in OS X
        ;; sets the Command key to Meta
        (setq mac-command-modifier 'meta)
        ;; sets the Option key to Super
        (setq mac-option-modifier 'super)
        ;; sets the Control key to Control
        (setq mac-control-modifier 'control)
        ;; set Mac's Fn key to Control
        (setq ns-function-modifier 'control))))

(defun yantonov/keyboard-settings-for-windows ()
  (if (yantonov/os-windows-p)
      (progn ;; http://ergoemacs.org/emacs/emacs_hyper_super_keys.html
        (setq w32-pass-lwindow-to-system nil
              w32-pass-rwindow-to-system nil
              w32-pass-apps-to-system nil
              w32-lwindow-modifier 'super
              w32-rwindow-modifier 'super
              w32-apps-modifier 'hyper))))

(defun yantonov/load-my-keybindings ()
  (interactive)
  (yantonov/keyboard-settings-for-macos)
  (yantonov/keyboard-settings-for-windows)
  (yantonov/apply-general-keybindings (current-global-map))
  (yantonov/create-general-menu (current-global-map))
  (yantonov/create-launcher-menu (current-global-map))
  (yantonov/load-my-help-keybinding))

(yantonov/load-my-keybindings)

(provide 'etc-global-hotkeys)
