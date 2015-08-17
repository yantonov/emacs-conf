(autoload 'rust-mode "rust-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))

(defun yantonov/rust-mode-hook ()
  (setq rust-indent-offset 4))

(defun yantonov/racer-defined-p ()
  (and (getenv "RACER_HOME")
       (file-exists-p (getenv "RACER_HOME"))))

(defun yantonov/racer-init ()
  (if (yantonov/racer-defined-p)
      (progn
        (setq racer-rust-src-path  (getenv "RUST_SRC_PATH"))
        (setq racer-cmd (getenv "RACER_HOME"))
        (add-to-list 'load-path (concat (getenv "RACER_HOME")
                                        "/editors/emacs/")))))

(defun yantonov/rust-compile-hook ()
  (require 'compile)
  (require 'projectile)
  (set (make-local-variable 'compile-command)
       (if (locate-dominating-file (buffer-file-name) "Cargo.toml")
           "cargo run"
         (format "rustc %s && %s" (buffer-file-name)
                 (file-name-sans-extension (buffer-file-name))))))

(add-hook 'rust-mode-hook 'yantonov/rust-mode-hook)
(add-hook 'rust-mode-hook 'yantonov/rust-compile-hook)

(yantonov/racer-init)

(eval-after-load "rust-mode"
  '(progn
     (require 'company)
     (if (yantonov/racer-defined-p)
         (require 'racer))))

(provide 'emacs-rc-rust-mode)
