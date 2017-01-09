(use-package org
  :defer t
  :config
  (progn
    (defun yantonov/stop-increase-font-size-for-org-mode-headers ()
      "Stop the org-level headers from increasing in height relative to the other text."
      (dolist (face '(org-level-1
                      org-level-2
                      org-level-3
                      org-level-4
                      org-level-5))
        (set-face-attribute face nil :weight 'semi-bold :height 1.0)))

    (defun yantonov/org-mode-hook ()
      ;; (yantonov/kbd-conf-general org-mode-map)
      (setq org-default-notes-file "~/emacs/.todo-list.org")
      (yantonov/stop-increase-font-size-for-org-mode-headers)
      (message "hook"))

    (add-hook 'org-mode-hook 'yantonov/org-mode-hook)))

(defun yantonov/stop-increase-font-size-for-org-mode-headers ()
      "Stop the org-level headers from increasing in height relative to the other text."
      (dolist (face '(org-level-1
                      org-level-2
                      org-level-3
                      org-level-4
                      org-level-5))
        (set-face-attribute face nil :weight 'semi-bold :height 1.0)))

    (defun yantonov/org-mode-hook ()
      ;; (yantonov/kbd-conf-general org-mode-map)
      (setq org-default-notes-file "~/emacs/.todo-list.org")
      (yantonov/stop-increase-font-size-for-org-mode-headers)
      (message "hook"))

    (add-hook 'org-mode-hook 'yantonov/org-mode-hook)

(provide 'emacs-rc-org-mode)
