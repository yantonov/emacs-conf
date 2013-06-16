(defun my-general-keybindings (my-key-map)

  ;;; indentation
  ;; inspired by intellij idea
  (define-key my-key-map (kbd "C-M-l") 'indent-buffer)
  ;; inspired by intellij idea
  (define-key my-key-map (kbd "C-S-M-l") 'indent-defun)
  ;; to-utf, no trailing whitespaces, no tabs
  (define-key my-key-map (kbd "C-c n") 'cleanup-buffer-safe)

  ;; resize buffer key bindings
  ;; http://www.emacswiki.org/emacs/WindowResize
  (define-key my-key-map (kbd "S-C-<left>") 'shrink-window-horizontally)
  
  (define-key my-key-map (kbd "S-C-<right>") 'enlarge-window-horizontally)
  
  
  (define-key my-key-map (kbd "S-C-<down>") 'shrink-window)
  (define-key my-key-map (kbd "S-C-<up>") 'enlarge-window)

  ;; windows movement
  ;; http://www.emacswiki.org/emacs/WindMove
  (define-key my-key-map (kbd "S-<left>") 'windmove-left)
  (define-key my-key-map (kbd "S-<down>") 'windmove-down)
  (define-key my-key-map (kbd "S-<right>") 'windmove-right)
  (define-key my-key-map (kbd "S-<up>") 'windmove-up)
  ;; prevous window
  (define-key my-key-map (kbd  "C-x O") 'goto-previous-window)

  ;; too long lines shows/hides by "C-C l"
  (define-key my-key-map (kbd "C-c l") 'toggle-truncate-lines)

  ;; wrapper to goto-line (show line number only during entering line number
  (define-key my-key-map [remap goto-line] 'goto-line-with-feedback)

  ;;; new lines
  (define-key my-key-map "\r" 'newline-and-indent)
  ;; open new line like IntelliJIdea/Eclipse etc
  (define-key my-key-map (kbd "S-<return>") 'smart-open-line)
  (define-key my-key-map (kbd "<C-S-return>") 'smart-open-line-above)
  ;; join next line to current
  (define-key my-key-map  (kbd "M-j")
    (lambda ()
      (interactive)
      (join-line -1)))

  ;; file manupulations
  (define-key my-key-map (kbd "C-x C-r") 'rename-current-buffer-file)
  (define-key my-key-map (kbd "C-x C-k") 'delete-current-buffer-file)

  ;;; fullscreen
  ;; fullscreen eshell
  (define-key my-key-map (kbd "C-c e")
    'fullscreen-eshell)
  ;; fullscreen ansi-term
  (define-key my-key-map (kbd "C-c t")
    'visit-ansi-term-buffer)
  ;; fullscreen scratch
  (define-key my-key-map (kbd "C-c f")
    'fullscreen-scratch)

  ;; timeclock
  (define-key my-key-map (kbd "C-c cs") 'timeclock-in)
  (define-key my-key-map (kbd "C-c ce") 'timeclock-out)
  (define-key my-key-map (kbd "C-c cr") 'timeclock-reread-log)
  (define-key my-key-map (kbd "C-c cu") 'timeclock-update-string)
  (define-key my-key-map (kbd "C-c cw") 'timeclock-when-to-leave-string)

  ;;; open
  ;; projectile
  (define-key my-key-map (kbd "M-p") 'projectile-find-file)
  ;; webjump
  (define-key my-key-map (kbd "C-x g") 'webjump)
  ;; open-with
  (define-key my-key-map (kbd  "C-c o") 'open-with)
  ;; open-with
  (define-key my-key-map (kbd  "C-c g") 'google)

  (define-key my-key-map (kbd "C-@") 'er/expand-region)

  ;; close all but this
  (define-key my-key-map (kbd "C-c k") 'kill-other-buffers)

  ;; execute shell command for current buffer file
  (define-key my-key-map (kbd "M-!") 'shell-execute-buffer-file))

(defun my-paredit-keybindings ()
  "Customization for paredit keybindings."
  (interactive)
  (define-key paredit-mode-map (kbd "M-)") 'paredit-wrap-round-from-behind))

(defun load-my-keybindings ()
  (interactive)
  (my-general-keybindings (current-global-map)))

(load-my-keybindings)

(defun my-prog-mode-hotkey-hook ()
  (local-set-key (kbd "C-/") 'comment-or-uncomment-region)
  (local-set-key (kbd "C-?") 'comment-or-uncomment-region))

(add-hook 'prog-mode-hook 'my-prog-mode-hotkey-hook)

(provide 'etc-global-hotkeys)
