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
