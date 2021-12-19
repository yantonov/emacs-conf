;; for debug purposes
(setq debug-on-error t)

(defconst yantonov/user-home
  (let ((home (getenv "HOME")))
    (expand-file-name (if home home "~"))))

(defconst yantonov/emacs-home
  (expand-file-name (concat yantonov/user-home "/emacs")))

(load-file
 (expand-file-name (concat yantonov/emacs-home
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
(require 'etc-key)
(require 'use-package)
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
(require 'os-defuns)
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
(require 'emacs-rc-cider)
(require 'emacs-rc-company-mode)
(require 'emacs-rc-dash)
(require 'emacs-rc-elisp-mode)
(require 'emacs-rc-elisp-slime-nav)
(require 'emacs-rc-encoding)
(require 'emacs-rc-erlang)
(require 'emacs-rc-eshell)
(require 'emacs-rc-expand-region)
(require 'emacs-rc-fireplace)
(require 'emacs-rc-font)
(require 'emacs-rc-git-gutter-fridge)
(require 'emacs-rc-git-timemachine)
(require 'emacs-rc-hide-mode-line)
(require 'emacs-rc-highlight-symbol)
(require 'emacs-rc-hydra)
(require 'emacs-rc-ido)
(require 'emacs-rc-js2-mode)
(require 'emacs-rc-keyfreq)
(require 'emacs-rc-linum)
(require 'emacs-rc-markdown)
(require 'emacs-rc-multiple-cursors)
(require 'emacs-rc-ocaml)
(require 'emacs-rc-org-mode)
(require 'emacs-rc-pcomplete)
(require 'emacs-rc-pomodoro)
(require 'emacs-rc-prog-mode)
(require 'emacs-rc-projectile)
(require 'emacs-rc-python-mode)
(require 'emacs-rc-rainbow-mode)
(require 'emacs-rc-restclient)
(require 'emacs-rc-s)
(require 'emacs-rc-scroll)
(require 'emacs-rc-sh-script-mode)
(require 'emacs-rc-showcharcode)
(require 'emacs-rc-smartparens)
(require 'emacs-rc-smex)
(require 'emacs-rc-sicp)
(require 'emacs-rc-taskpaper-mode)
(require 'emacs-rc-timeclock)
(require 'emacs-rc-ui)
(require 'emacs-rc-undo-tree)
(require 'emacs-rc-webjump)
(require 'emacs-rc-yasnippet)
(require 'emacs-rc-yaml-mode)
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

(if (and (not (daemonp)) (yantonov/macp))
    (progn
      (x-focus-frame nil)
      (toggle-frame-fullscreen)))
