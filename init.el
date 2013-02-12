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
(dolist (file (directory-files rc-dir t "\\w+"))
  (when (file-regular-p file)
    (load file)))

(load (concat emacs-home "hotkeys.el"))
