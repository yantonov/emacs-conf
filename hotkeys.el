(defun my-general-keybindings (my-key-map)
  (define-key my-key-map (kbd "C-SPC") 'set-mark-command)

  ;; inspired by intellij idea
  (define-key my-key-map (kbd "C-M-l") 'indent-buffer)

  ;; resize buffer key bindings
  ;; http://www.emacswiki.org/emacs/WindowResize
  (define-key my-key-map (kbd "S-C-<left>") 'shrink-window-horizontally)
  (define-key my-key-map (kbd "S-C-<right>") 'enlarge-window-horizontally)
  (define-key my-key-map (kbd "S-C-<down>") 'shrink-window)
  (define-key my-key-map (kbd "S-C-<up>") 'enlarge-window)

  ;; windows movement
  ;; http://www.emacswiki.org/emacs/WindMove
  (when (fboundp 'windmove-default-keybindings)
     (windmove-default-keybindings))
  ;; the same as
  ;;(define-key my-key-map (kbd "S-<left>") 'windmove-left)
  ;;(define-key my-key-map (kbd "S-<down>") 'windmove-down)
  ;;(define-key my-key-map (kbd "S-<right>") 'windmove-right)
  ;;(define-key my-key-map (kbd "S-<up>") 'windmove-up)

  ;; too long lines shows/hides by "C-C l"
  (define-key my-key-map (kbd "C-c l") 'toggle-truncate-lines)
  ;; newline and indent
  (define-key my-key-map "\r" 'newline-and-indent)
  ;; wrapper to goto-line (show line number only during entering line number
  (define-key my-key-map [remap goto-line] 'goto-line-with-feedback)

  (define-key my-key-map (kbd "<C-return>") 'open-line-below)
  (define-key my-key-map (kbd "<C-S-return>") 'open-line-above)
  (define-key my-key-map (kbd "C-c n") 'cleanup-buffer)

  (define-key my-key-map (kbd "C-x C-r") 'rename-current-buffer-file)
  (define-key my-key-map (kbd "C-x C-k") 'delete-current-buffer-file)

  (define-key my-key-map (kbd "C-/") 'comment-or-uncomment-region)
  (define-key my-key-map (kbd "C-?") 'comment-or-uncomment-region)

  ;; join next line to current
  (define-key my-key-map  (kbd "M-j")
    (lambda ()
      (interactive)
      (join-line -1)))

  ;; fullscreen eshell
  (define-key my-key-map (kbd "C-c t")
    'fullscreen-eshell)
  ;; fullscreen scratch
  (define-key my-key-map (kbd "C-c f")
    'fullscreen-scratch)
  ;; webjump
  (define-key my-key-map (kbd "C-x g") 'webjump)
  )

(defun my-paredit-keybindings (key-map)
  (define-key paredit-mode-map (kbd "M-)") 'paredit-wrap-round-from-behind)
  )

(defun load-my-keybindings ()
  (interactive)
  (my-general-keybindings (current-global-map))
  (my-paredit-keybindings paredit-mode-map)
  )

(load-my-keybindings)
