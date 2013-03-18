;; org-mode
(defun my-org-mode-hook ()
  "My hook for org mode"
  (interactive)
  (my-general-keybindings org-mode-map)
  )
(add-hook 'org-mode-hook 'my-org-mode-hook)


;; paredit
(defun my-paredit-mode-hook ()
  "My hook for paredit mode."
  (my-paredit-keybindings)
  )
(add-hook 'paredit-mode-hook 'my-paredit-mode-hook)

;; init ui
;; fires when an emacs frame is created
(add-hook 'after-make-frame-functions 'reset-ui)
;; hook for setting up UI when not running in daemon mode
(add-hook 'emacs-startup-hook 'reset-ui)
