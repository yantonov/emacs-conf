(autoload 'rust-mode "rust-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))

(defun yantonov/racer-defined-p ()
  (and (getenv "RACER_HOME")
       (file-exists-p (getenv "RACER_HOME"))))

(defun yantonov/rust-mode-hook ()
  (setq rust-indent-offset 4)
  (company-mode)
  (setq company-idle-delay 0.2)
  (setq company-minimum-prefix-length 1)
  (if (yantonov/racer-defined-p)
      (progn
        (racer-activate)
        (eldoc-mode)
        (local-set-key (kbd "M-.") #'racer-find-definition)
        (local-set-key (kbd "TAB") #'racer-complete-or-indent)
        (local-set-key (kbd "C-c C-c") #'yantonov/toggle-camelcase-underscores))))

(defun yantonov/racer-init ()
  (if (yantonov/racer-defined-p)
      (progn
        (setq racer-rust-src-path  (getenv "RUST_SRC_PATH"))
        (setq racer-cmd (concat (getenv "RACER_HOME")
                                "/target/release/racer"))
        (add-to-list 'load-path (concat (getenv "RACER_HOME")
                                        "/editors/emacs/"))
        (require 'racer))))

(defun yantonov/rust-compile-hook ()
  (set (make-local-variable 'compile-command)
       (if (locate-dominating-file (buffer-file-name) "Cargo.toml")
           "cargo run"
         (format "rustc %s && %s" (buffer-file-name)
                 (file-name-sans-extension (buffer-file-name))))))

(add-hook 'rust-mode-hook 'yantonov/rust-mode-hook)
(add-hook 'rust-mode-hook 'yantonov/rust-compile-hook)

(eval-after-load "rust-mode"
  '(progn
     (require 'company)
     (require 'compile)
     (require 'projectile)
     (if (yantonov/racer-defined-p)
         (yantonov/racer-init))))

(provide 'emacs-rc-rust-mode)
