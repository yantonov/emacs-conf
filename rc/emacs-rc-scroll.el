;; no scroll bar
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(setq redisplay-dont-pause t
      scroll-margin 1
      scroll-step 1
      scroll-conservatively 10000
      scroll-preserve-screen-position 1)

;; This snippet makes mouse wheel and trackpad scrolling bearable.
;; Scroll in 1-line increments the buffer under the mouse.
(setq mouse-wheel-follow-mouse 't)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))

(provide 'emacs-rc-scroll)
