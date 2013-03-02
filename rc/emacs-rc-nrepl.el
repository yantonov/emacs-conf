(require 'clojure-mode)
(require 'nrepl)
(require 'paredit)
(require 'highlight-parentheses)
(require 'rainbow-delimiters)
(require 'ac-nrepl)

;; Stop the error buffer from popping up while working in the REPL buffer:
(setq nrepl-popup-stacktraces nil)

(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'nrepl-mode))

(defun set-auto-complete-as-completion-at-point-function ()
  (setq completion-at-point-functions '(auto-complete)))
(add-hook 'auto-complete-mode-hook 'set-auto-complete-as-completion-at-point-function)

(defun my-nrepl-mode-hook ()
  (paredit-mode +1)
  (highlight-parentheses-mode t)
  (rainbow-delimiters-mode-enable)

  (ac-nrepl-setup)
  (set-auto-complete-as-completion-at-point-function)
  )

(defun my-nrepl-interaction-mode-hook ()
  (paredit-mode +1)
  (highlight-parentheses-mode t)
  (rainbow-delimiters-mode-enable)

  (ac-nrepl-setup)
  (set-auto-complete-as-completion-at-point-function)

  (define-key nrepl-interaction-mode-map (kbd "C-c C-d") 'ac-nrepl-popup-doc)
  )

(add-hook 'nrepl-mode-hook 'my-nrepl-mode-hook)
(add-hook 'nrepl-interaction-mode-hook 'my-nrepl-interaction-mode-hook)

;;; JavaDoc browsing from nrepl
(defvar javadoc-alist
  '(("^\\(java[x]?\.\\|org\.ietf\.\\|org\.omg\.\\|org\.w3c\.\\|org\.xml\.\\)" .
     "file:///opt/javadoc/jdk7/docs/api/")))

(defun javadoc-root (sym)
  (let ((m (find-if (lambda (x) (string-match (car x) sym)) javadoc-alist)))
    (when m (cdr m))))

(defun my-nrepl-javadoc (class-name)
  "Get JavaDoc documentation on Java class at point."
  (interactive (list
                (cond
                 ((nrepl-connection-buffer-name)
                  (or (second (nrepl-eval
                               (format "%s" (list 'resolve
                                                  (list 'quote
                                                        (make-symbol
                                                         (substring-no-properties
                                                          (symbol-name
                                                           (symbol-at-point)))))
                                                  ))
                               ))
                      (symbol-name (nrepl-read-symbol-name "JavaDoc info for: "))))

                 ((ignore-errors (mark))
                  (buffer-substring-no-properties (region-beginning) (region-end)))

                 (t (symbol-name (symbol-at-point))))))
  (or class-name (error "No symbol given"))
  (let* ((root (and class-name (javadoc-root class-name)))
         (dots-to-slashes (subst-char-in-string ?. ?/ class-name))
         (canon-class-name (subst-char-in-string ?$ ?. dots-to-slashes)))
    (if (and root canon-class-name)
        (browse-url (concat root canon-class-name ".html"))
      (message "No javadoc found for %s" class-name))))
