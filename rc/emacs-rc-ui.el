;; hide splash screen
(setq inhibit-splash-screen t)
;; no scratch message
(setq initial-scratch-message nil)
;; no toolbars
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
;; no scroll bar
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
;; no menu bar
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

(setq color-theme-is-global nil)

(defvar after-make-console-frame-hooks '()
"Hooks to run after creating a new TTY frame")
(defvar after-make-window-system-frame-hooks '()
"Hooks to run after creating a new window-system frame")

(defun run-after-make-frame-hooks (frame)
"Selectively run either `after-make-console-frame-hooks' or
`after-make-window-system-frame-hooks'"
  (select-frame frame)
  (run-hooks (if window-system
               'after-make-window-system-frame-hooks
               'after-make-console-frame-hooks)))

(add-hook 'after-make-frame-functions 'run-after-make-frame-hooks)
(add-hook 'after-init-hook (lambda ()
  (run-after-make-frame-hooks (selected-frame))))

(provide 'emacs-rc-ui)
