;; [ general editor settings ]
;; newline and indent
(global-set-key "\r" 'newline-and-indent)
;; set goal colulm
;; http://emacsblog.org/2007/03/17/quick-tip-set-goal-column/
(put 'set-goal-column 'disabled nil)
;; windows movement
;; http://www.emacswiki.org/emacs/WindMove
(when (fboundp 'windmove-default-keybindings)
      (windmove-default-keybindings))
;; too long lines shows/hides by "C-C l"
(global-set-key (kbd "C-c l") 'toggle-truncate-lines)
;; Show column-number in the mode line
(column-number-mode 1)
;; delete selected region on backspace, del, ctrl+d
(delete-selection-mode t)
;; [ ui ]
;; hide splash screen
(setq inhibit-splash-screen t)
; no scratch message
(setq initial-scratch-message nil)
; no toolbars
(tool-bar-mode nil)