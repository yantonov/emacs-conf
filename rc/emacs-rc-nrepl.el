(require 'clojure-mode)
(require 'nrepl)
(require 'paredit)
(require 'highlight-parentheses)
(require 'ac-nrepl)

; Stop the error buffer from popping up while working in the REPL buffer:
(setq nrepl-popup-stacktraces nil)

; only indent for tab
;(setq nrepl-tab-command 'indent-for-tab-command)

(add-hook 'nrepl-mode-hook 'ac-nrepl-setup)
(add-hook 'nrepl-interaction-mode-hook 'ac-nrepl-setup)

(eval-after-load "auto-complete"
   '(add-to-list 'ac-modes 'nrepl-mode))

(defun set-auto-complete-as-completion-at-point-function ()
  (setq completion-at-point-functions '(auto-complete)))
(add-hook 'auto-complete-mode-hook 'set-auto-complete-as-completion-at-point-function)

(defun my-nrepl-mode-hook ()
  (paredit-mode 1)
  (highlight-parentheses-mode t)
  (set-auto-complete-as-completion-at-point-function)
  )

(defun my-nrepl-interaction-mode-hook ()
  (paredit-mode 1)
  (highlight-parentheses-mode t)
  (set-auto-complete-as-completion-at-point-function)
  ; using ac-nrepl's popup documentation in place of nrepl-doc
  (define-key nrepl-interaction-mode-map (kbd "C-c C-d") 'ac-nrepl-popup-doc)
  )

(add-hook 'nrepl-mode-hook 'my-nrepl-mode-hook)
(add-hook 'nrepl-interaction-mode-hook 'my-nrepl-interactive-mode-hook)
