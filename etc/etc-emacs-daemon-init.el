(add-hook 'after-make-window-system-frame-hooks
          '(lambda ()
             (load-theme 'solarized-dark t)))
(add-hook 'after-make-console-frame-hooks
          '(lambda ()
             (load-theme 'solarized-light t)))

;;; TODO: choose color mode for console mode

(provide 'etc-emacs-daemon-init)
