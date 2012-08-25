(eval-after-load "slime" 
  '(progn (slime-setup '(slime-repl))	
	(defun paredit-mode-enable () (paredit-mode 1))	
	(add-hook 'slime-mode-hook 'paredit-mode-enable)	
	(add-hook 'slime-repl-mode-hook 'paredit-mode-enable)
	
	;; encoding
	(setq slime-net-coding-system 'utf-8-unix)

	;; ignore version's disperancy
	(setq slime-protocol-version 'ignore)
	))
(require 'slime)
(slime-setup)
(setq slime-use-autodoc-mode nil)
(global-set-key [f5] 'slime)
