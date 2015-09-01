(require 'go-mode)

(if (getenv "GOROOT")
    (progn
      (setq exec-path (cons (getenv "GOROOT") exec-path))))

(defun yantonov/go-mode-hook ()
  (setq compile-command "go build -v && go test -v && go vet")
  (define-key (current-local-map) "\C-c\C-c" 'compile)
  ;; (go-eldoc-setup)
  (add-hook 'before-save-hook 'gofmt-before-save)
  (local-set-key (kbd "M-.") 'godef-jump))

(add-hook 'go-mode-hook 'yantonov/go-mode-hook)

(if (and (getenv "GOPATH")
         (file-exists-p (concat (getenv "GOPATH") "/src/golang.org/x/tools/cmd/oracle/oracle.el")))
    (load-file "$GOPATH/src/golang.org/x/tools/cmd/oracle/oracle.el"))

(provide 'emacs-rc-go-mode)
