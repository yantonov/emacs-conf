;; hide splash screen
(setq inhibit-splash-screen t)
;; no scratch message (message in scratch buffer)
(setq initial-scratch-message nil)
;; no startup message
(setq inhibit-startup-message t)
;; no toolbars
(if (fboundp 'tool-bar-mode)
    (tool-bar-mode 0))
;; no menu bar
(if (fboundp 'menu-bar-mode)
    (menu-bar-mode 1))

;; no flasing frames
(setq visible-bell nil)

;; cursor blinking
(blink-cursor-mode 1)

;; one theme for all frames
(setq color-theme-is-global t)

(provide 'emacs-rc-ui)
