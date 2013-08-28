(defun my-org-mode-hook ()
  "My hook for org mode"
  (interactive)
  (my-general-keybindings org-mode-map))

(setq org-default-notes-file "~/emacs/.todo-list.org")

(add-hook 'org-mode-hook 'my-org-mode-hook)

(provide 'emacs-rc-org-mode)
