;; no scroll bar
(if (fboundp 'scroll-bar-mode)
    (set-scroll-bar-mode nil))

;; This snippet makes mouse wheel and trackpad scrolling bearable.
;; Scroll in 1-line increments the buffer under the mouse.
(setq mouse-wheel-follow-mouse 't)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))

(provide 'emacs-rc-scroll)
