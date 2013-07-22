(require 'ido)

(ido-mode t)
(setq ido-enable-prefix nil
      ido-enable-flex-matching t
      ido-create-new-buffer 'always)

(provide 'emacs-rc-ido)
