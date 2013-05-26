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

;; fires when an emacs frame is created
(add-hook 'after-make-frame-functions 'reset-ui)
;; hook for setting up UI when not running in daemon mode
(add-hook 'emacs-startup-hook 'reset-ui)

(provide 'emacs-rc-ui)
