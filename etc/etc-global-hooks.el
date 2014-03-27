(defvar after-make-console-frame-hooks '()
  "Hooks to run after creating a new TTY frame")
(defvar after-make-window-system-frame-hooks '()
  "Hooks to run after creating a new window-system frame")

(defun run-after-make-frame-hooks (frame)
  "Selectively run either `after-make-console-frame-hooks' or
`after-make-window-system-frame-hooks'"
  (select-frame frame)
  (run-hooks (if (window-system frame)
                 'after-make-window-system-frame-hooks
               'after-make-console-frame-hooks)))

(add-hook 'after-make-frame-functions
          'run-after-make-frame-hooks)
(add-hook 'after-init-hook
          (lambda ()
            (run-after-make-frame-hooks (selected-frame))))

(if (string-match "\\(^GNU Emacs ([0-9]*.[0-9]*.[0-9]*)\\)" (emacs-version))
    (let (vrs (match-beginning 1))
      (if (>= vrs "24.4")
          (progn
            ;; save all buffers on losing focus
            (add-hook 'focus-out-hook (lambda () (save-some-buffers t)))))))

(provide 'etc-global-hooks)
