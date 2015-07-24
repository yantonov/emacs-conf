(require 'go-mode)

(if (getenv "GOROOT")
    (progn
      (setq exec-path (cons (getenv "GOROOT") exec-path))))

;; todo install only for go-mode
(defun yantonov/my-go-mode-before-save-hook ()
  ;;(message major-mode)
  (when (eq major-mode 'go-mode)
    (gofmt-before-save)))

(add-hook 'before-save-hook 'yantonov/my-go-mode-before-save-hook)

(provide 'emacs-rc-go-mode)
