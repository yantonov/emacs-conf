(defvar yantonov/cfg-key-mode-map (make-sparse-keymap))

(define-minor-mode yantonov/cfg-key-mode
  "cfg-mode"
  :lighter " cfg"
  yantonov/cfg-key-mode-map)

(defadvice load (after cfg-keybindings-priority)
  (if (not (eq (car (car minor-mode-map-alist)) 'yantonov/cfg-key-mode))
      (let ((mykeys (assq 'yantonov/cfg-key-mode minor-mode-map-alist)))
        (assq-delete-all 'yantonov/cfg-key-mode minor-mode-map-alist)
        (add-to-list 'minor-mode-map-alist mykeys))))
(ad-activate 'load)

(defun yantonov/turn-on-cfg-key-mode ()
  (interactive)
  (yantonov/cfg-key-mode t))

(defun yantonov/turn-off-cfg-key-mode ()
  (interactive)
  (yantonov/cfg-key-mode -1))

(define-globalized-minor-mode global-cfg-mode yantonov/cfg-key-mode yantonov/turn-on-cfg-key-mode)

(defun yantonov/get-hotkeys ()
  (list
   ;; copy/paste/cut
   (list "C-c c" 'kill-ring-save)
   (list "C-c v" 'yank)
   (list "C-c x" 'kill-region)
   ;; revert
   (list "C-S-r" 'revert-buffer)
   ;; search
   (list "C-S-s" 'find-grep)
   ;; god-mode
   (list "C-<escape>" 'god-local-mode)
   ;; ace-window
   (list "C-x o" 'ace-window)
   ;;; indentation
   ;; inspired by intellij idea
   (list "C-M-l" 'yantonov/indent-buffer)
   ;; inspired by intellij idea
   (list "C-S-M-l" 'yantonov/indent-defun)
   ;; to-utf, no trailing whitespaces, no tabs
   (list "C-c n" 'yantonov/cleanup-buffer-safe)

   ;; resize buffer key bindings
   ;; http://www.emacswiki.org/emacs/WindowResize
   (list "C-S-M-<up>" 'buf-move-up)
   (list "C-S-M-<right>" 'buf-move-right)
   (list "C-S-M-<down>" 'buf-move-down)
   (list "C-S-M-<left>" 'buf-move-left)

   (list "C-S-<up>"     'enlarge-window)
   (list "C-S-<right>"  'enlarge-window-horizontally)
   (list "C-S-<down>"   'shrink-window)
   (list "C-S-<left>"   'shrink-window-horizontally)

   ;; windows movement
   ;; http://www.emacswiki.org/emacs/WindMove
   (list "S-<left>" 'windmove-left)
   (list "S-<down>" 'windmove-down)
   (list "S-<right>" 'windmove-right)
   (list "S-<up>" 'windmove-up)
   ;; prevous window
   (list "C-x O" 'yantonov/goto-previous-window)

   ;; too long lines shows/hides by "C-C l"
   (list "C-c l" 'toggle-truncate-lines)

   ;; move lines (examples of using super key)
   (list "M-S-<up>" 'yantonov/move-whole-line-or-region-up)
   (list "M-S-<down>" 'yantonov/move-whole-line-or-region-down)

   ;; open new line like IntelliJIdea/Eclipse etc
   (list "S-<return>" 'yantonov/smart-open-line)
   (list "C-S-<return>" 'yantonov/smart-open-line-above)
   ;; join next line to current
   (list "M-j"
         (lambda ()
           (interactive)
           (join-line -1)))

   ;; file manupulations
   (list "S-<f6>" 'yantonov/rename-current-buffer-file)
   (list "S-<f8>" 'yantonov/delete-current-buffer-file)

  ;;; fullscreen
   ;; fullscreen eshell
   (list "C-c e" 'fullscreen-eshell)
   ;; fullscreen scratch
   (list "C-c f" 'fullscreen-scratch)

   ;; timeclock
   (list "C-c ti" 'timeclock-in)
   (list "C-c to" 'timeclock-out)
   (list "C-c tc" 'timeclock-change)
   (list "C-c tr" 'timeclock-reread-log)
   (list "C-c tl" 'timeclock-visit-timelog)
   (list "C-c tw" 'timeclock-when-to-leave-string)

  ;;; open
   ;; projectile
   (list "C-S-n" 'projectile-find-file)
   ;; webjump
   (list "C-x g" 'webjump)
   ;; open-with
   (list "C-c o" 'yantonov/open-with)
   ;; open-with
   (list "C-c g" 'yantonov/google)

   (list "C-@" 'er/expand-region)

   ;; close all but this
   (list "C-c k" 'yantonov/kill-other-buffers)

   ;; execute shell command for current buffer file
   (list "M-!" 'yantonov/shell-execute-buffer-file)

   ;; close buffer aka IntelliJ Idea
   (list "C-<f4>" 'kill-buffer)

   (list "C-M-<insert>" 'yantonov/copy-buffer-file-path-to-clipboard)
   (list "C-<insert>" 'yantonov/copy-buffer-file-name-to-clipboard)))

(defun yantonov/cfg-hotheys (map)
  (dolist (k (yantonov/get-hotkeys))
    (when k
      (let ((key (kbd (car k)))
            (func (car (cdr k))))
        (define-key map key func)
        (global-set-key key func)))))

(defun yantonov/cfg-key-mode-configure ()
  (add-hook 'minibuffer-setup-hook 'yantonov/turn-off-cfg-key-mode)
  (yantonov/cfg-hotheys yantonov/cfg-key-mode-map)
  (global-cfg-mode))

(yantonov/cfg-key-mode-configure)

(provide 'etc-cfg-key-mode)
