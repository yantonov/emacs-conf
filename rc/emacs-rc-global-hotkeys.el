; inspired by intellij idea
(global-set-key (kbd "C-M-l") 'indent-buffer) 

; resize buffer key bindings
; http://www.emacswiki.org/emacs/WindowResize
(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)

;; windows movement
;; http://www.emacswiki.org/emacs/WindMove
(when (fboundp 'windmove-default-keybindings)
      (windmove-default-keybindings))
;; too long lines shows/hides by "C-C l"
(global-set-key (kbd "C-c l") 'toggle-truncate-lines)
;; newline and indent
(global-set-key "\r" 'newline-and-indent)
;; wrapper to goto-line (show line number only during entering line number
;; goto-line-with-feedback is defined in emacs-rc-editor.el
(global-set-key [remap goto-line] 'goto-line-with-feedback)

;; defined in rc/emacs-rc-edit-defuns
(global-set-key (kbd "<C-return>") 'open-line-below)
(global-set-key (kbd "<C-S-return>") 'open-line-above)
;; defined in rc/emacs-rc-file-defuns
(global-set-key (kbd "C-x C-r") 'rename-current-buffer-file)
(global-set-key (kbd "C-x C-k") 'delete-current-buffer-file)
