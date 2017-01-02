(require 'ido)
(require 'flx-ido)

(ido-mode t)
(ido-everywhere 1)
(flx-ido-mode 1)
(ido-vertical-mode 1)
(setq ido-enable-prefix nil
      ido-enable-flex-matching t
      ido-create-new-buffer 'prompt)
;; disable ido faces to see flx highlights.
;; (setq ido-use-faces nil)

(provide 'emacs-rc-ido)
