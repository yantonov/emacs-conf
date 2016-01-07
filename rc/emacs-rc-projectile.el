(require 'projectile)
(require 'grizzl)
;; enable globally
;; (projectile-global-mode)

;; to enable for some mode
;; (add-hook 'clojure-mode-hook 'projectile-on)

(setq projectile-completion-system 'grizzl)

(provide 'emacs-rc-projectile)
