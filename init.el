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
\(setq erlang-mode-home \"/usr/lib/erlang\"\)

Windows
\(setq erlang-mode-home \"C:/Program Files/erl<Ver>\"\)")

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
;; etc (core defuns and settings)
;;
(setq etc-dir (expand-file-name "etc" emacs-home))
(dolist (file (directory-files etc-dir t load-emacs-lisp-file-pattern))
  (when (file-regular-p file)
    (load file)))

;;
;; defuns
;;
(setq defuns-dir (expand-file-name "defuns" emacs-home))
(dolist (file (directory-files defuns-dir t load-emacs-lisp-file-pattern))
  (when (file-regular-p file)
    (load file)))

(setq rc-dir (expand-file-name "rc" emacs-home))
(dolist (file (directory-files rc-dir t load-emacs-lisp-file-pattern))
  (when (file-regular-p file)
    (load file)))

;; global hotkeys
(load (concat emacs-home "hotkeys.el"))

;; hooks
(load (concat emacs-home "hooks.el"))

;; custom config
(load custom-init-after-file 'noerror)

;; goto home in case of windows
(if (eq system-type 'windows-nt)
  (cd "~"))
