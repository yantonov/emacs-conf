;; paths, environment
(defvar user-home (if (getenv "HOME") (getenv "HOME") (expand-file-name "~"))
  "Defines user home directory.")
(defvar emacs-home (concat user-home "/emacs/")
  "Defines emacs config directory inside user home directory.")
(defvar emacs-mode-home (concat emacs-home "mode/")
      "Defines directory for emacs extensions and modes.")
;; for windows move explicitly to user home directory
(cd user-home)

(defvar custom-init-before-file (concat user-emacs-directory "custom-before.el")
      "Defines custom initialization file.
This file is loaded before any settings for mode is loaded.
So you can define environment paths of other global settings it this file.")
(defvar custom-init-after-file (concat user-emacs-directory "custom-after.el")
      "Defines custom initialization file.
This file is loaded after any settings for mode is loaded.
So you can override any previous defined settings using this file.")

(load custom-init-before-file 'noerror)

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
(dolist (file (directory-files rc-dir t "\\w+"))
  (when (file-regular-p file)
    (load file)))

(load (concat emacs-home "hotkeys.el"))

(load custom-init-after-file 'noerror)
