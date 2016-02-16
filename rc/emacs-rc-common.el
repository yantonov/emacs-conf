(require 'uniquify)
;; directory prefix for buffer name (in case of multiple files with same name at different directories)
(setq uniquify-buffer-name-style 'forward)
;; set goal colulm
;; http://emacsblog.org/2007/03/17/quick-tip-set-goal-column/
(put 'set-goal-column 'disabled nil)
;; show column-number in the mode line
(column-number-mode 1)
;; delete selected region on backspace, del, ctrl+d
(delete-selection-mode t)
;; no confirmation for new files
(setq confirm-nonexistent-file-or-buffer nil)
;; Ask "y" or "n" instead of "yes" or "no". Yes, laziness is great.
(fset 'yes-or-no-p 'y-or-n-p)
;; do not require final newline
(setq require-final-newline nil)

;; With the default configuration you will get an error when you get
;; to attempt to move to a window that doesn't exist which becomes
;; kind of annoying after a while.
;; However when windmove-wrap-around is set then attempting to move off
;; the bottom of the frame for example will instead select the topmost
;; window in the frame.
(setq windmove-wrap-around t)
;;ensure that M-v always undoes C-v, so you can go back exactly
(setq scroll-preserve-screen-position 'always)

;; tabs
(setq-default indent-tabs-mode nil) ; use spaces instead of tabs
(setq indent-tabs-mode nil) ; use spaces instead of tabs
(setq-default tab-width 4)
(setq tab-stop-list (number-sequence 4 200 4))
(setq tab-width 4)

;; search and replace
(setq search-highlight           t) ; Highlight search object
(setq query-replace-highlight    t) ; Highlight query object

;; no highlight for current line
(global-hl-line-mode 0)

(setq exec-path (reverse (delete-dups (reverse (append (split-string (getenv "PATH") ":") exec-path)))))

;; disable visual notification
(setq visible-bell t)
;; disable ring bell notification
(setq ring-bell-function 'ignore)

(provide 'emacs-rc-common)
