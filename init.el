;; paths, environment
(load "~/emacs/rc/emacs-rc-env.el")

;; 
;; used modes
;;

;; package manager
;; http://repo.or.cz/w/emacs.git/blob_plain/1a0a666f941c99882093d7bd08ced15033bc3f0c:/lisp/emacs-lisp/package.el
(add-to-list 'load-path (concat emacs-mode-home "package"))

;; highlight parentheses
;; http://www.emacswiki.org/emacs/HighlightParentheses
(add-to-list 'load-path (concat emacs-mode-home "highlight-parentheses/"))
(require 'highlight-parentheses)

;; color theme mode
(add-to-list 'load-path (concat emacs-mode-home "color-theme"))

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

;; nrepl 
;; https://github.com/kingtim/nrepl.el
(add-to-list 'load-path (concat emacs-mode-home "nrepl/"))

;; expand-region
;; https://github.com/magnars/expand-region.el.gitl
(add-to-list 'load-path (concat emacs-mode-home "expand-region/"))

;; 
;; settings
;;

; elpa settings
(load "~/emacs/rc/emacs-rc-elpa.el")

;; general editor settings
(load "~/emacs/rc/emacs-rc-editor.el")

;; paredit
(load "~/emacs/rc/emacs-rc-paredit.el")

;; linum
(load "~/emacs/rc/emacs-rc-linum.el")
 
;; clojure-mode
(load "~/emacs/rc/emacs-rc-clojure.el")

;; slime
(load "~/emacs/rc/emacs-rc-slime.el")

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

;; expand-region
(load "~/emacs/rc/emacs-rc-expand-region.el")
