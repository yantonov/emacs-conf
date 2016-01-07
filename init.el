;; for debug purposes
(setq debug-on-error t)

(defconst yantonov/user-home
  (let ((home (getenv "HOME")))
    (expand-file-name (if home home "~"))))

(defconst yantonov/emacs-home
  (expand-file-name (concat yantonov/user-home "/emacs")))

(load-file (expand-file-name (concat yantonov/emacs-home
             "/core/core-paths.el")))

(defvar yantonov/custom-init-before-file
  (concat user-emacs-directory "custom-before.el")
  "Defines custom initialization file.
This file is loaded before any settings for mode is loaded.
So you can define environment paths of other global settings it this file.")
(defvar yantonov/custom-init-after-file
  (concat user-emacs-directory "custom-after.el")
  "Defines custom initialization file.
This file is loaded after any settings for mode is loaded.
So you can override any previous defined settings using this file.")

;;
;; javadoc inside cider path
;;
(defvar yantonov/user-javadoc-alist
  nil
  "Defines list of javadoc root paths.
   This variable is machine specific,
   can be defined in `custom-init-before-file' init file."

  ;; Example :
  ;; (setq user-javadoc-alist
  ;;   '(("^\\(java[x]?\.\\|org\.ietf\.\\|org\.omg\.\\|org\.w3c\.\\|org\.xml\.\\a)" .
  ;;   "file:///opt/javadoc/jdk7/docs/api/"  )))
  )

;;
;; erlang environment variables
;;
(defvar yantonov/erlang-mode-home
  nil
  "Defines directory for erlang-mode.
This variable is machine specific,
can be defined in `custom-init-before-file' init file.

Examples:

Ubuntu
(assumed erlang is installed from deb package
     provided by https://www.erlang-solutions.com):

\(setq erlang-mode-home \"/usr/lib/erlang/lib/tools-<ToolsVer>/emacs\"\)

Windows:
\(setq erlang-mode-home \"C:/Program Files/erl<Ver>/lib/tools-<ToolsVer>/emacs\"\)

This examples are already used as defaults.")

(defvar yantonov/erlang-home
  nil
  "Defines directory for erlang installation.
This variable is machine specific,
can be defined in `custom-init-before-file' init file.

Examples:

Ubuntu
(assumed erlang is installed from deb package
     provided by https://www.erlang-solutions.com):
\(setq erlang-home \"/usr/lib/erlang\"\)

Windows:
\(setq erlang-home \"C:/Program Files/erl<Ver>\"\)

This examples are already used as defaults.")


(load yantonov/custom-init-before-file t)

;; etc core settings
(require 'etc-package)
(require 'etc-global-hooks)
;; etc core defuns
(require 'buffer-defuns)
(require 'buffer-move)
(require 'cache-defuns)
(require 'ext-macro)
(require 'elisp-defuns)
(require 'file-defuns)
(require 'search-defuns)
(require 'temp-defuns)
(require 'string-defuns)
(require 'sys-defuns)
(require 'window-defuns)
(require 'xml-buffer-defuns)
;;; configurations for modes
(require 'emacs-rc-ace-window)
(require 'emacs-rc-backup)
(require 'emacs-rc-big-fringe)
(require 'emacs-rc-clojure-mode)
(require 'emacs-rc-color-theme)
(require 'emacs-rc-command-log-mode)
(require 'emacs-rc-common)
(require 'emacs-rc-css-mode)
(require 'emacs-rc-cider)
(require 'emacs-rc-company-mode)
(require 'emacs-rc-dash)
(require 'emacs-rc-dired)
(require 'emacs-rc-elisp-mode)
(require 'emacs-rc-elisp-slime-nav)
(require 'emacs-rc-encoding)
(require 'emacs-rc-erlang)
(require 'emacs-rc-eshell)
(require 'emacs-rc-ess)
(require 'emacs-rc-expand-region)
(require 'emacs-rc-font)
(require 'emacs-rc-git-gutter-fridge)
(require 'emacs-rc-git-timemachine)
(require 'emacs-rc-haskell)
(require 'emacs-rc-hide-mode-line)
(require 'emacs-rc-html-mode)
(require 'emacs-rc-hydra)
(require 'emacs-rc-go-mode)
(require 'emacs-rc-ido)
(require 'emacs-rc-js2-mode)
(require 'emacs-rc-jsx-mode)
(require 'emacs-rc-key-chord)
(require 'emacs-rc-linum)
(require 'emacs-rc-markdown)
(require 'emacs-rc-multiple-cursors)
(require 'emacs-rc-org-mode)
(require 'emacs-rc-paredit)
(require 'emacs-rc-pcomplete)
(require 'emacs-rc-pomodoro)
(require 'emacs-rc-prog-mode)
(require 'emacs-rc-projectile)
(require 'emacs-rc-restclient)
(require 'emacs-rc-rust-mode)
(require 'emacs-rc-s)
(require 'emacs-rc-scroll)
(require 'emacs-rc-showcharcode)
(require 'emacs-rc-sicp)
(require 'emacs-rc-timeclock)
(require 'emacs-rc-ui)
(require 'emacs-rc-undo-tree)
(require 'emacs-rc-webjump)
(require 'emacs-rc-yasnippet)
(require 'emacs-rc-whitespace)
(require 'emacs-rc-zencoding)

;; global hotkeys
;; after all defuns, settings mode already loaded
(require 'etc-platform-key)
(require 'etc-cfg-key-mode)
(require 'etc-help)
(require 'etc-menu)

;; advices
;; after all defuns, settings mode already loaded
(require 'etc-global-advices)

;; custom config
(load yantonov/custom-init-after-file t)

(if (= 1 (length command-line-args))
    (cd yantonov/user-home))

(if (yantonov/macp)
    (x-focus-frame nil))
