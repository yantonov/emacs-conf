(require 'go-mode)

(if (getenv "GOROOT")
    (progn
      (setq exec-path (cons (getenv "GOROOT") exec-path))))

(defun yantonov/go-mode-before-save-hook ()
  (when (eq major-mode 'go-mode)
    (gofmt-before-save)))

(defun yantonov/go-mode-remove-unused-import (&optional point)
  (interactive)
  (go-remove-unused-imports nil))

(defun yantonov/go-mode-comment-unused-import (&optional point)
  (interactive)
  (go-remove-unused-imports nil))

(defun yantonov/go-mode-keys ()
  (local-set-key "\C-c\C-c" 'compile)
  (local-set-key (kbd "M-.") 'godef-jump)
  (local-set-key (kbd "C-M-l") 'gofmt)
  (local-set-key (kbd "C-c C-k") 'godoc)
  (local-set-key (kbd "C-c C-d") 'godef-describe)
  (local-set-key (kbd "C-c C-i C-r") 'yantonov/go-mode-remove-unused-import)
  (local-set-key (kbd "C-c C-i C-c") 'yantonov/go-mode-comment-unused-import)
  (local-set-key (kbd "C-c C-i C-g") 'go-goto-imports))

(defun yantonov/go-mode-hook ()
  (setq compile-command "go build -v && go test -v && go vet")
  (yantonov/go-mode-keys)
  ;; (go-eldoc-setup)
  (add-hook 'before-save-hook 'yantonov/go-mode-before-save-hook))

(add-hook 'go-mode-hook 'yantonov/go-mode-hook)

(if (and (getenv "GOPATH")
         (file-exists-p (concat (getenv "GOPATH") "/src/golang.org/x/tools/cmd/oracle/oracle.el")))
    (load-file "$GOPATH/src/golang.org/x/tools/cmd/oracle/oracle.el"))

(provide 'emacs-rc-go-mode)
