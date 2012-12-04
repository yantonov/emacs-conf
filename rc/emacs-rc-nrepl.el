(require 'nrepl)
; Enable eldoc in clojure buffers:
(add-hook 'nrepl-interaction-mode-hook
	  'nrepl-turn-on-eldoc-mode)

; Stop the error buffer from popping up while working in the REPL buffer:
(setq nrepl-popup-stacktraces nil)

; Make C-c C-z switch to the *nrepl* buffer in the current window:
(add-to-list 'same-window-buffer-names "*nrepl*")

; nrepl hook
(require 'paredit)
(require 'highlight-parentheses)

(defun my-nrepl-hook ()
  (paredit-mode 1)
  (highlight-parentheses-mode t)
  )
(add-hook 'nrepl-mode-hook 'my-nrepl-hook)