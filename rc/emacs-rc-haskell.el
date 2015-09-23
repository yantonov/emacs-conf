(require 'company)
(require 'company-ghc)

;; ghc-mode settings
(autoload 'ghc-init "ghc" nil t)
(autoload 'ghc-debug "ghc" nil t)

;; company mode settings
(add-to-list 'company-backends 'company-ghc)
(custom-set-variables '(company-ghc-show-info t))

(defun yantonov/search-hoogle ()
  (interactive)
  (yantonov/search-internal "http://www.haskell.org/hoogle/?hoogle=" "Hoogle: "))

(defun yantonov/search-hayoo ()
  (interactive)
  (yantonov/search-internal "http://hayoo.fh-wedel.de/?query=" "Hayoo: "))


(defun yantonov/haskell-mode-hook ()
  (local-unset-key (kbd "C-M-l"))
  (local-unset-key (kbd "C-c -h"))
  (local-set-key (kbd "C-c C-s C-h") 'yantonov/search-hoogle)
  (local-set-key (kbd "C-c C-s C-y") 'yantonov/search-hayoo)
  (turn-on-haskell-doc-mode)
  (turn-on-haskell-indentation)
  (company-mode)
  (ghc-init))

(add-hook 'haskell-mode-hook 'yantonov/haskell-mode-hook)

(provide 'emacs-rc-haskell)

