;; [ general editor settings ]
;; set goal colulm
;; http://emacsblog.org/2007/03/17/quick-tip-set-goal-column/
(put 'set-goal-column 'disabled nil)
;; Show column-number in the mode line
(column-number-mode 1)
;; delete selected region on backspace, del, ctrl+d
(delete-selection-mode t)

;; Write backup files to own directory
(setq backup-directory-alist
      `(("." . ,(expand-file-name
                 (concat user-emacs-directory "backups")))))

;; Make backups of files, even when they're in version control
(setq vc-make-backup-files t)

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




