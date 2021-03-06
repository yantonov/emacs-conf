(require 'yasnippet)
(add-to-list 'yas-snippet-dirs yantonov/snippets-home)
(yas-global-mode 1)

;;; use popup menu for yas-choose-value
(require 'popup)

;; add some shotcuts in popup menu mode
(define-key popup-menu-keymap (kbd "M-n") 'popup-next)
(define-key popup-menu-keymap (kbd "M-p") 'popup-previous)
(define-key popup-menu-keymap (kbd "TAB") 'popup-select)
(define-key popup-menu-keymap (kbd "<tab>") 'popup-select)
;; (define-key popup-menu-keymap (kbd "<backtab>") 'popup-previous)

(defun yantonov/yas-popup-isearch-prompt (prompt choices &optional display-fn)
  (when (featurep 'popup)
    (popup-menu*
     (mapcar
      (lambda (choice)
        (popup-make-item
         (or (and display-fn (funcall display-fn choice))
             choice)
         :value choice))
      choices)
     :prompt prompt
     ;; start isearch mode immediately
     :isearch t)))

(setq yas-prompt-functions '(yantonov/yas-popup-isearch-prompt yas-ido-prompt yas-no-prompt))

(provide 'emacs-rc-yasnippet)
