;; paths, environment
(load "~/emacs/rc/emacs-rc-env.el")

;; used modes
;; highlight parentheses
;; http://www.emacswiki.org/emacs/HighlightParentheses
(add-to-list 'load-path (concat emacs-mode-home "highlight-parentheses/"))
(require 'highlight-parentheses)
;; clojure mode
(add-to-list 'load-path (concat emacs-mode-home "clojure-mode/"))
;; color theme mode
(add-to-list 'load-path (concat emacs-mode-home "color-theme-6.6.0"))
;; custom color themes
(add-to-list 'load-path (concat emacs-home "color-themes"))
;; linum
;; http://www.emacswiki.org/emacs/LinumPlus
;; trunk
;; http://code.google.com/p/dea/source/browse/trunk/my-lisps/linum%2B.el
;; download to mode/linumplus/linum+.el
(add-to-list 'load-path (concat emacs-mode-home "linumplus/"))
;; paredit
;; http://mumble.net/~campbell/emacs/paredit.el
;; download to mode/paredit/paredit.el
(add-to-list 'load-path (concat emacs-mode-home "paredit/"))

;; general editor settings
(load "~/emacs/rc/emacs-rc-editor.el")

;; paredit
(load "~/emacs/rc/emacs-rc-paredit.el")

;; linum
(load "~/emacs/rc/emacs-rc-linum.el")
 
;; clojure-mode
;; https://github.com/jochu/clojure-mode.git
;; download to mode/clojure-mode
(load "~/emacs/rc/emacs-rc-clojure.el")

;; slime
;(load "~/emacs/rc/emacs-rc-slime.el")

;; org-mode
;; git clone git://orgmode.org/org-mode.git
;; download to mode/org-mode
(load "~/emacs/rc/emacs-rc-orgmode.el")

;; webjump
(load "~/emacs/rc/emacs-rc-webjump.el")

;; sicp book
(load "~/emacs/rc/emacs-rc-sicp.el")

;; color-theme
;; http://www.nongnu.org/color-theme/
;; download to mode/color-theme-x.x.x
(load "~/emacs/rc/emacs-rc-color-theme.el")

;; erlang support
(load "~/emacs/rc/emacs-rc-erlang.el")

