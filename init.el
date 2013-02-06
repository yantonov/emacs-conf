;; paths, environment
(load "~/emacs/rc/emacs-rc-env.el")

;; modes
(dolist
    (project (directory-files emacs-mode-home t "\\w+"))
  (when (file-directory-p project)
    (add-to-list 'load-path project)))

;; color themes
(dolist
    (project (directory-files (concat emacs-home "color-themes") t "\\w+"))
  (when (file-directory-p project)
    (add-to-list 'load-path project)))

;; settings
(load "~/emacs/rc/emacs-rc-elpa.el")
(load "~/emacs/rc/emacs-rc-editor.el")
(load "~/emacs/rc/emacs-rc-dired.el")
(load "~/emacs/rc/emacs-rc-string-manipulation.el")
(load "~/emacs/rc/emacs-rc-dash.el")
(load "~/emacs/rc/emacs-rc-buffer-defuns.el")
(load "~/emacs/rc/emacs-rc-file-defuns.el")
(load "~/emacs/rc/emacs-rc-projectile.el")
(load "~/emacs/rc/emacs-rc-auto-complete.el")
(load "~/emacs/rc/emacs-rc-paredit.el")
(load "~/emacs/rc/emacs-rc-highlight-parentheses.el")
(load "~/emacs/rc/emacs-rc-command-log-mode.el")
(load "~/emacs/rc/emacs-rc-linum.el")
(load "~/emacs/rc/emacs-rc-clojure.el")
(load "~/emacs/rc/emacs-rc-clojure-test.el")
(load "~/emacs/rc/emacs-rc-nrepl.el")
(load "~/emacs/rc/emacs-rc-slime.el")
(load "~/emacs/rc/emacs-rc-webjump.el")
(load "~/emacs/rc/emacs-rc-sicp.el")
(load "~/emacs/rc/emacs-rc-color-theme.el")
(load "~/emacs/rc/emacs-rc-erlang.el")
(load "~/emacs/rc/emacs-rc-expand-region.el")
(load "~/emacs/rc/emacs-rc-zencoding.el")
(load "~/emacs/rc/emacs-rc-markdown.el")
(load "~/emacs/rc/emacs-rc-yasnippet.el")
(load "~/emacs/rc/emacs-rc-global-hotkeys.el")
