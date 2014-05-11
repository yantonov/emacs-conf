;; hide splash screen
(setq inhibit-splash-screen t)
;; no scratch message
(setq initial-scratch-message nil)
;; no toolbars
(if (fboundp 'tool-bar-mode)
    (tool-bar-mode -1))
;; no menu bar
;; (if (fboundp 'menu-bar-mode)
;;     (menu-bar-mode -1))

(setq color-theme-is-global nil)

(provide 'emacs-rc-ui)
