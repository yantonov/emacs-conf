;;
;; paths, environment
;;
(defvar user-home (if (getenv "HOME") (getenv "HOME") (expand-file-name "~"))
  "Defines user home directory.")
(defvar emacs-home (concat user-home "/emacs/")
  "Defines emacs config directory inside user home directory.")
(defvar emacs-mode-home (concat emacs-home "mode/")
  "Defines directory for emacs extensions and modes.")
(defvar emacs-color-themes-home (concat emacs-home "color-themes/")
  "Defines directory for emacs color themes.")

(defvar custom-init-before-file (concat user-emacs-directory "custom-before.el")
  "Defines custom initialization file.
This file is loaded before any settings for mode is loaded.
So you can define environment paths of other global settings it this file.")
(defvar custom-init-after-file (concat user-emacs-directory "custom-after.el")
  "Defines custom initialization file.
This file is loaded after any settings for mode is loaded.
So you can override any previous defined settings using this file.")

;;
;; javadoc inside nrepl path
;;

(defvar user-javadoc-alist nil
  "Defines list of javadoc root paths. This variable is machine specific, can be defined in `custom-init-before-file' init file."
  ;; Example :
  ;; (setq user-javadoc-alist
  ;;   '(("^\\(java[x]?\.\\|org\.ietf\.\\|org\.omg\.\\|org\.w3c\.\\|org\.xml\.\\)" .
  ;;   "file:///opt/javadoc/jdk7/docs/api/"  )))
  )

;;
;; erlang environment variables
;;
(defvar erlang-mode-home nil
  "Defines directory for erlang-mode. This variable is machine specific, can be defined in `custom-init-before-file' init file.

Examples:

Ubuntu (assumed erlang is installed from deb package provided by https://www.erlang-solutions.com) :

\(setq erlang-mode-home \"/usr/lib/erlang/lib/tools-<ToolsVer>/emacs\"\)

Windows
\(setq erlang-mode-home \"C:/Program Files/erl<Ver>/lib/tools-<ToolsVer>/emacs\"\)")

(defvar erlang-home nil
  "Defines directory for erlang installation. This variable is machine specific, can be defined in `custom-init-before-file' init file.

Examples:

Ubuntu (assumed erlang is installed from deb package provided by https://www.erlang-solutions.com) :
\(setq erlang-home \"/usr/lib/erlang\"\)

Windows
\(setq erlang-home \"C:/Program Files/erl<Ver>\"\)")

(load custom-init-before-file 'noerror)

;;
;; modes paths
;;
(dolist
    (project (directory-files emacs-mode-home t "\\w+"))
  (when (file-directory-p project)
    (add-to-list 'load-path project)))

;;
;; color themes
;;
(setq color-themes-dir emacs-color-themes-home)
(dolist
    (project (directory-files color-themes-dir t "\\w+"))
  (when (file-directory-p project)
    (add-to-list 'load-path project)))

(setq load-emacs-lisp-file-pattern "\\w+\\.elc?$")
;;
;; etc core settings
;;
(setq etc-dir (expand-file-name "etc" emacs-home))
(add-to-list 'load-path etc-dir)
(require 'etc-package)
(require 'etc-path)

;;
;; etc core defuns
;;
(setq defuns-dir (expand-file-name "defuns" emacs-home))
(add-to-list 'load-path defuns-dir)
(require 'buffer-defuns)
(require 'file-defuns)
(require 'snippet-defuns)
(require 'temp-defuns)
(require 'window-defuns)

;;;
;;; configurations for modes
;;;
(setq rc-dir (expand-file-name "rc" emacs-home))
(add-to-list 'load-path rc-dir)
(require 'emacs-rc-auto-complete)
(require 'emacs-rc-backup)
(require 'emacs-rc-clojure-mode)
(require 'emacs-rc-clojure-test)
(require 'emacs-rc-color-theme)
(require 'emacs-rc-command-log-mode)
(require 'emacs-rc-dash)
(require 'emacs-rc-dired)
(require 'emacs-rc-editor)
(require 'emacs-rc-elisp-mode)
(require 'emacs-rc-erlang)
(require 'emacs-rc-eshell)
(require 'emacs-rc-highlight-parentheses)
(require 'emacs-rc-js2-mode)
(require 'emacs-rc-key-chord)
(require 'emacs-rc-linum)
(require 'emacs-rc-markdown)
(require 'emacs-rc-nrepl)
(require 'emacs-rc-org-mode)
(require 'emacs-rc-paredit)
(require 'emacs-rc-prog-mode)
(require 'emacs-rc-projectile)
(require 'emacs-rc-s)
(require 'emacs-rc-sicp)
(require 'emacs-rc-switch-buffers)
(require 'emacs-rc-timeclock)
(require 'emacs-rc-ui)
(require 'emacs-rc-undo-tree)
(require 'emacs-rc-webjump)
(require 'emacs-rc-yasnippet)
(require 'emacs-rc-zencoding)

;; global hotkeys
(require 'etc-global-hotkeys)

;; advices
(load (concat emacs-home "advices.el"))

;; custom config
(load custom-init-after-file 'noerror)

;; goto home in case of windows
(if (eq system-type 'windows-nt)
    (cd "~"))
