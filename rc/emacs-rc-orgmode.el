;; *** orgmode 
(setq load-path (cons (concat emacs-mode-home "org/lisp") load-path))
(setq load-path (cons (concat emacs-mode-home "org/contrib/lisp") load-path))
(require 'org-install)
;; The following lines are always needed. Choose your own keys.
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(add-hook 'org-mode-hook 'turn-on-font-lock) ; not needed when global-font-lock-mode is on
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
;; *** orgmode end
