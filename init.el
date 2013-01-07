;; paths, environment
(load "~/emacs/rc/emacs-rc-env.el")

;; used modes
(add-to-list 'load-path (concat emacs-mode-home "package"))
(add-to-list 'load-path (concat emacs-mode-home "highlight-parentheses/"))
(add-to-list 'load-path (concat emacs-mode-home "color-theme"))
(add-to-list 'load-path (concat emacs-home "color-themes"))
(add-to-list 'load-path (concat emacs-home "color-themes" "/solarized"))
(add-to-list 'load-path (concat emacs-mode-home "command-log-mode/"))
(add-to-list 'load-path (concat emacs-mode-home "linumplus/"))
(add-to-list 'load-path (concat emacs-mode-home "paredit/"))
(add-to-list 'load-path (concat emacs-mode-home "rainbow-delimiters/"))
(add-to-list 'load-path (concat emacs-mode-home "auto-complete/"))
(add-to-list 'load-path (concat emacs-mode-home "nrepl/"))
(add-to-list 'load-path (concat emacs-mode-home "ac-nrepl/"))
(add-to-list 'load-path (concat emacs-mode-home "expand-region/"))
(add-to-list 'load-path (concat emacs-mode-home "zencoding-mode/"))
(add-to-list 'load-path (concat emacs-mode-home "markdown-mode/"))
(add-to-list 'load-path (concat emacs-mode-home "string-manipulation/"))
(add-to-list 'load-path (concat emacs-mode-home "yasnippet/"))

;; settings
(load "~/emacs/rc/emacs-rc-elpa.el")
(load "~/emacs/rc/emacs-rc-editor.el")
(load "~/emacs/rc/emacs-rc-string-manipulation.el")
(load "~/emacs/rc/emacs-rc-buffer-defuns.el")
(load "~/emacs/rc/emacs-rc-file-defuns.el")
(load "~/emacs/rc/emacs-rc-auto-complete.el")
(load "~/emacs/rc/emacs-rc-paredit.el")
(load "~/emacs/rc/emacs-rc-highlight-parentheses.el")
(load "~/emacs/rc/emacs-rc-command-log-mode.el")
(load "~/emacs/rc/emacs-rc-linum.el")
(load "~/emacs/rc/emacs-rc-clojure.el")
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
