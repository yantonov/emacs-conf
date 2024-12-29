(defvar yantonov/after-make-console-frame-hooks '()
  "Hooks to run after creating a new TTY frame")
(defvar yantonov/after-make-window-system-frame-hooks '()
  "Hooks to run after creating a new window-system frame")

(defun yantonov/run-after-make-frame-hooks (frame)
  "Selectively run either `after-make-console-frame-hooks' or
`after-make-window-system-frame-hooks'"
  (select-frame frame)
  (run-hooks (if (window-system frame)
                 'yantonov/after-make-window-system-frame-hooks
               'yantonov/after-make-console-frame-hooks))
  (yantonov/set-font 0))

(add-hook 'after-make-frame-functions
          'yantonov/run-after-make-frame-hooks)
(add-hook 'after-init-hook
          (lambda ()
            (yantonov/run-after-make-frame-hooks (selected-frame))))

(provide 'etc-global-hooks)
