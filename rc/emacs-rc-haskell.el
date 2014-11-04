(require 'company)
(require 'company-ghc)

;; ghc-mode settings
(autoload 'ghc-init "ghc" nil t)
(autoload 'ghc-debug "ghc" nil t)

;; company mode settings
(add-to-list 'company-backends 'company-ghc)
(custom-set-variables '(company-ghc-show-info t))

(defun yantonov/haskell-mode-hook ()
  (local-unset-key (kbd "C-M-l"))
  (turn-on-haskell-doc-mode)
  (turn-on-haskell-indentation)
  (company-mode)
  (ghc-init))

(add-hook 'haskell-mode-hook 'yantonov/haskell-mode-hook)

(provide 'emacs-rc-haskell)

