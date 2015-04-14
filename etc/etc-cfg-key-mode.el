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
   (list "C-x o" 'ace-window)))

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
