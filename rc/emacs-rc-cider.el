(require 'clojure-mode)
(require 'cider)
(require 'paredit)
(require 'highlight-parentheses)
(require 'rainbow-delimiters)
(require 'ac-nrepl)

;; Stop the error buffer from popping up while working in the REPL buffer:
(setq cider-popup-stacktraces nil)

;; enable cider for clojure buffers
(setq cider-enable-on-existing-clojure-buffers t)

;; hide special cider buffers
(setq nrepl-hide-special-buffers t)

(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'cider-mode))

(defun set-auto-complete-as-completion-at-point-function ()
  (setq completion-at-point-functions
        '(auto-complete)))

(add-hook 'auto-complete-mode-hook
          'set-auto-complete-as-completion-at-point-function)

(defun my-cider-common-hook ()
  (paredit-mode +1)
  (highlight-parentheses-mode t)
  (rainbow-delimiters-mode-enable)

  (ac-nrepl-setup)
  (set-auto-complete-as-completion-at-point-function)

  ;; show-paren-mode
  ;; http://emacswiki.org/emacs/ShowParenMode
  (show-paren-mode 1)
  (setq show-paren-style 'expression)
  (cider-turn-on-eldoc-mode))

(defun my-cider-mode-hook ()
  (subword-mode)
  (my-cider-common-hook))

(defun my-repl-mode-hook ()
  (my-cider-common-hook))

(add-hook 'cider-mode-hook 'my-cider-mode-hook)
(add-hook 'cider-repl-mode-hook 'my-repl-mode-hook)

;;; JavaDoc browsing from cider
(defvar javadoc-alist
  '(("^\\(java[x]?\.\\|org\.ietf\.\\|org\.omg\.\\|org\.w3c\.\\|org\.xml\.\\)" .
     "file:///opt/javadoc/jdk7/docs/api/")))

(defun attach-user-javadocs ()
  "Attach user defined javadocs."
  (if user-javadoc-alist
      (dolist (el user-javadoc-alist javadoc-alist)
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
      (message "No javadoc found for %s" class-name))))

(provide 'emacs-rc-cider)
