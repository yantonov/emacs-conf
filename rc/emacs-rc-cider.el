(use-package cider
  :defer t
  :init
  (progn
    (setq cider-stacktrace-default-filters '(tooling dup)
          cider-repl-pop-to-buffer-on-connect t
          cider-prompt-save-file-on-load nil
          cider-repl-use-clojure-font-lock t
          ;; hide special buffers
          nrepl-hide-special-buffers t
          ;; Log communication with the nREPL server (extremely useful for debugging CIDER problems):
          nrepl-log-messages t
          ;; Don't show on error:
          cider-show-error-buffer nil
          ))
  :config
  (progn
    (defun my-cider-common-hook ()

      (rainbow-delimiters-mode-enable)
      (company-mode))

    (defun my-cider-mode-hook ()
      (subword-mode)
      (my-cider-common-hook))

    (defun my-repl-mode-hook ()
      (my-cider-common-hook))

    (add-hook 'cider-mode-hook 'my-cider-mode-hook)
    (add-hook 'cider-repl-mode-hook 'my-repl-mode-hook)

    (define-key cider-mode-map (kbd "C-c C-q") 'nrepl-close)
    (define-key cider-mode-map (kbd "C-c C-Q") 'cider-quit)

    ;;; JavaDoc browsing from cider
    (defvar javadoc-alist
      '(("^\\(java[x]?\.\\|org\.ietf\.\\|org\.omg\.\\|org\.w3c\.\\|org\.xml\.\\)" .
         "file:///opt/javadoc/jdk7/docs/api/")))

    (defun attach-user-javadocs ()
      "Attach user defined javadocs."
      (if yantonov/user-javadoc-alist
          (dolist (el yantonov/user-javadoc-alist javadoc-alist)
            (setq javadoc-alist (cons el javadoc-alist)))))
    ;; load user defined settings
    (attach-user-javadocs)

    (defun javadoc-root (sym)
      (let ((m (find-if (lambda (x) (string-match (car x) sym)) javadoc-alist)))
        (when m (cdr m))))

    (defun my-cider-javadoc (class-name)
      "Get JavaDoc documentation on Java class at point."
      (interactive (list
                    (cond
                     ((cider-connection-buffer-name)
                      (or (second (cider-eval
                                   (format "%s" (list 'resolve
                                                      (list 'quote
                                                            (make-symbol
                                                             (substring-no-properties
                                                              (symbol-name
                                                               (symbol-at-point)))))
                                                      ))
                                   ))
                          (symbol-name (cider-read-symbol-name "JavaDoc info for: "))))

                     ((ignore-errors (mark))
                      (buffer-substring-no-properties (region-beginning) (region-end)))

                     (t (symbol-name (symbol-at-point))))))
      (or class-name (error "No symbol given"))
      (let* ((root (and class-name (javadoc-root class-name)))
             (dots-to-slashes (subst-char-in-string ?. ?/ class-name))
             (canon-class-name (subst-char-in-string ?$ ?. dots-to-slashes)))
        (if (and root canon-class-name)
            (browse-url (concat root canon-class-name ".html"))
          (message "No javadoc found for %s" class-name))))))

(provide 'emacs-rc-cider)
