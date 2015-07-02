(autoload 'rust-mode "rust-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))

(add-hook 'rust-mode-hook
          (lambda ()
            (setq rust-indent-offset 4)
            (setq )))

(setq racer-rust-src-path  (getenv "RUST_SRC_PATH"))
(setq racer-cmd (getenv "RACER_HOME"))
(add-to-list 'load-path (concat (getenv "RACER_HOME") "/editors/emacs/"))
(eval-after-load "rust-mode"
  '(progn
     (require 'company)
     (require 'racer)))

(defun yantonov/rust-compile-hook ()
  (require 'compile)
  (require 'projectile)
  (set (make-local-variable 'compile-command)
       (if (locate-dominating-file (buffer-file-name) "Cargo.toml")
           "cargo run"
         (format "rustc %s && %s" (buffer-file-name)
                 (file-name-sans-extension (buffer-file-name))))))

;; (setq-default compilation-read-command nil)
(add-hook 'rust-mode-hook 'yantonov/rust-compile-hook)

(provide 'emacs-rc-rust-mode)
