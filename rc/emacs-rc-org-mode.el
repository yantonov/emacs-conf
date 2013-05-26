(defun my-org-mode-hook ()
  "My hook for org mode"
  (interactive)
  (my-general-keybindings org-mode-map))

(add-hook 'org-mode-hook 'my-org-mode-hook)

(provide 'emacs-rc-org-mode)
