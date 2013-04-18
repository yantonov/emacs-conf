;; org-mode
(add-hook 'org-mode-hook 'my-org-mode-hook)

;; paredit
(add-hook 'paredit-mode-hook 'my-paredit-mode-hook)

;; emacs-lisp-mode-hook
(add-hook 'emacs-lisp-mode-hook 'my-elisp-mode-hook)

;; init ui
;; fires when an emacs frame is created
(add-hook 'after-make-frame-functions 'reset-ui)
;; hook for setting up UI when not running in daemon mode
(add-hook 'emacs-startup-hook 'reset-ui)

;; enable paredit in minibuffer
(add-hook 'minibuffer-setup-hook 'conditionally-enable-paredit-mode)
