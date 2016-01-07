(defun add-to-load-path (dir)
  "shortcut to adjust load-path"
  (add-to-list 'load-path dir))

(defvar yantonov/emacs-core-home
  (expand-file-name (concat yantonov/emacs-home "/core"))
  "dir with core settings and defuns")

(add-to-load-path yantonov/emacs-core-home)
(require 'core-funcs)

;; additional paths

(defvar yantonov/modes-home
  (expand-file-name (concat yantonov/emacs-home "/mode")))

(defvar yantonov/inline-home
  (expand-file-name (concat yantonov/emacs-home "/inline")))

(defvar yantonov/color-themes-home
  (expand-file-name (concat yantonov/emacs-home "/color-themes")))

(defvar yantonov/rc-home
  (expand-file-name (concat yantonov/emacs-home "/rc")))

(defvar yantonov/defuns-home
  (expand-file-name (concat yantonov/emacs-home "/defuns")))

(defvar yantonov/etc-home
  (expand-file-name (concat yantonov/emacs-home "/etc")))

(defvar yantonov/snippets-home
  (expand-file-name (concat yantonov/etc-home "/snippets")))

(defvar yantonov/eshell-home
  (expand-file-name (concat yantonov/etc-home "/eshell")))

(defun list-directories-only (dir)
  (filter-list 'file-directory-p (directory-files dir t "\\w+")))

(defun yantonov/modes-paths (dir)
  (list-directories-only dir))

(defun yantonov/color-themes-paths (dir)
  (list-directories-only dir))

(mapc 'add-to-load-path
      (append (yantonov/modes-paths yantonov/modes-home)
              (yantonov/color-themes-paths yantonov/color-themes-home)
              (list yantonov/inline-home
                    yantonov/rc-home
                    yantonov/defuns-home
                    yantonov/etc-home)))

(mapc (lambda (x) (add-to-list 'custom-theme-load-path x))
      (yantonov/color-themes-paths yantonov/color-themes-home))
