;; paths, environment
(setq emacs-home "~/emacs/")
(setq emacs-mode-home (concat emacs-home "mode/"))

;; modes
(dolist
    (project (directory-files emacs-mode-home t "\\w+"))
  (when (file-directory-p project)
    (add-to-list 'load-path project)))

;; color themes
(setq color-themes-dir (concat emacs-home "color-themes"))
(dolist
    (project (directory-files color-themes-dir t "\\w+"))
  (when (file-directory-p project)
    (add-to-list 'load-path project)))

;; etc (core defuns and settings)
(setq etc-dir (expand-file-name "etc" emacs-home))
(dolist (file (directory-files etc-dir t "\\w+"))
  (when (file-regular-p file)
    (load file)))

;; defuns
(setq defuns-dir (expand-file-name "defuns" emacs-home))
(dolist (file (directory-files defuns-dir t "\\w+"))
  (when (file-regular-p file)
    (load file)))

(setq rc-dir (expand-file-name "rc" emacs-home))
(dolist (file (directory-files defuns-dir t "\\w+"))
  (when (file-regular-p file)
    (load file)))

;; settings
(load "~/emacs/rc/emacs-rc-package.el")
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
(load "~/emacs/rc/emacs-rc-undo-tree.el")
(load "~/emacs/rc/emacs-rc-global-hotkeys.el")
