(require 'ido)

(ido-mode t)
(setq ido-enable-prefix nil
      ido-enable-flex-matching t
      ido-completion-buffer-all-completions nil
      ido-create-new-buffer 'prompt)

(provide 'emacs-rc-ido)
