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

;; dont let emacs hurt your ears
(setq visible-bell t)

;; cursor blinking
(blink-cursor-mode 1)

(setq color-theme-is-global nil)

(provide 'emacs-rc-ui)
