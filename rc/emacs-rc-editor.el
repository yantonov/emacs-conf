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

;;; [ ui ]
;; hide splash screen
(setq inhibit-splash-screen t)
;; no scratch message
(setq initial-scratch-message nil)
;; no toolbars
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
; (tool-bar-mode 0)
;; no scroll bar
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
;; no menu bar
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
;; tabl
(setq tab-width 4)
(setq indent-tabs-mode nil)




