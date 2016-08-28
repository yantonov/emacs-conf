(use-package rust-mode
  :defer t
  :init
  (progn
    (autoload 'rust-mode "rust-mode" nil t)
    (add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode)))
  :config
  (progn

    (defun yantonov/racer-defined-p ()
      (and (getenv "RACER_HOME")
           (file-exists-p (getenv "RACER_HOME"))))

    (defun yantonov/search-rust-doc ()
      "Search https://doc.rust-lang.org/std/"
      (interactive)
      (yantonov/search-internal "https://doc.rust-lang.org/std/?search=" "Search doc.rust-lang.org/std: "))

    (defun yantonov/rust-mode-hook ()
      (setq rust-indent-offset 4)
      (company-mode)
      (setq company-idle-delay 0.2)
      (setq company-minimum-prefix-length 1)
      (smartparens-mode)
      (show-paren-mode)
      (rainbow-delimiters-mode-enable)
      (if (yantonov/racer-defined-p)
          (progn
            (racer-activate)
            (eldoc-mode)
            (local-set-key (kbd "M-.") #'racer-find-definition)
            (local-set-key (kbd "TAB") #'racer-complete-or-indent)
            (local-set-key (kbd "C-c C-c") #'yantonov/toggle-camelcase-underscores)
            (local-set-key (kbd "C-c C-d") #'yantonov/search-rust-doc)
            (local-set-key (kbd "C-/") #'yantonov/smart-comment))))

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

    (require 'emacs-rc-company-mode)
    (require 'compile)
    (require 'emacs-rc-projectile)
    (require 'emacs-rc-flycheck)
    (require 'emacs-rc-smartparens)
    (require 'rainbow-delimiters)

    (add-hook 'flycheck-mode-hook #'flycheck-rust-setup)
    (flycheck-mode)

    (if (yantonov/racer-defined-p)
        (yantonov/racer-init))))

(provide 'emacs-rc-rust-mode)
