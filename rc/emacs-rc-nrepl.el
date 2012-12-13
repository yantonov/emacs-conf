(require 'clojure-mode)
(require 'nrepl)
(require 'paredit)
(require 'highlight-parentheses)
(require 'ac-nrepl)

; Stop the error buffer from popping up while working in the REPL buffer:
(setq nrepl-popup-stacktraces nil)

(defun set-auto-complete-as-completion-at-point-function ()
  (setq completion-at-point-functions '(auto-complete)))
(add-hook 'auto-complete-mode-hook 'set-auto-complete-as-completion-at-point-function)

(defun my-nrepl-hook ()
  (paredit-mode 1)
  (highlight-parentheses-mode t)
  (ac-nrepl-setup)
  (set-auto-complete-as-completion-at-point-function)
  )

(defun my-nrepl-interaction-mode-hook ()
  ;(nrepl-turn-on-eldoc-mode)
  (ac-nrepl-setup)
  (set-auto-complete-as-completion-at-point-function)
  )

(add-hook 'nrepl-mode-hook 'my-nrepl-hook)
(add-hook 'nrepl-interaction-mode-hook 'my-nrepl-interaction-mode-hook)

(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'nrepl-mode))

