;; SLIME
;; emacs-mode-dir initialized in emacs-rc-env.el
(add-to-list 'load-path (concat emacs-mode-home "slime/"))
(add-to-list 'load-path (concat emacs-mode-home "slime/contrib"))

;; encoding
(setq slime-net-coding-system 'utf-8-unix)

;; ignore version's disperancy
 (setq slime-protocol-version 'ignore)

;; lisp implementations
;(setq
;  slime-lisp-implementations
;    '(
;       (clojure ("clj-cmd") :init swank-clojure-init)
;       (sbcl ("/usr/bin/sbcl") :coding-system utf-8-unix)
;     )
;  )
;; 
;(defmacro defslime-start (name mapping)
;  `(defun ,name ()
;     (interactive)
;     (let ((slime-default-lisp ,mapping))
;       (slime))))
;(defslime-start clojure 'clojure)
;(defslime-start sbcl 'sbcl)
;;

;; 
(eval-after-load "slime" 
  '(progn (slime-setup '(slime-repl))	
	(defun paredit-mode-enable () (paredit-mode 1))	
	(add-hook 'slime-mode-hook 'paredit-mode-enable)	
	(add-hook 'slime-repl-mode-hook 'paredit-mode-enable)
	(setq slime-protocol-version 'ignore)))
(require 'slime)
(slime-setup)
(setq slime-use-autodoc-mode nil)
(global-set-key [f5] 'slime)
;; *** SLIME END