;; set goal colulm
;; http://emacsblog.org/2007/03/17/quick-tip-set-goal-column/
(put 'set-goal-column 'disabled nil)
;; Show column-number in the mode line
(column-number-mode 1)
;; delete selected region on backspace, del, ctrl+d
(delete-selection-mode t)

;; tabl
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq tab-stop-list (number-sequence 4 200 4))

(setq tab-width 4)
(setq indent-tabs-mode nil)

;; search and replace
(setq search-highlight           t) ; Highlight search object
(setq query-replace-highlight    t) ; Highlight query object

;; Always ALWAYS use UTF-8
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
