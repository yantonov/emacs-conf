;; no scroll bar
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(setq redisplay-dont-pause t
      scroll-margin 1
      scroll-step 1
      scroll-conservatively 10000
      scroll-preserve-screen-position 1)

(provide 'emacs-rc-scroll)
