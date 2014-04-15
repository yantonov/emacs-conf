(defun yantonov/org-mode-hook ()
  "My hook for org mode"
  (interactive)
  (yantonov/apply-general-keybindings org-mode-map))

(setq org-default-notes-file "~/emacs/.todo-list.org")

(add-hook 'org-mode-hook 'yantonov/org-mode-hook)

(provide 'emacs-rc-org-mode)
