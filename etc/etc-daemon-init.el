(add-hook 'after-make-window-system-frame-hooks
          '(lambda ()
             (load-theme 'solarized-dark t)))
(add-hook 'after-make-console-frame-hooks
          '(lambda ()
             (load-theme 'zenburn t)))

(provide 'etc-daemon-init)
