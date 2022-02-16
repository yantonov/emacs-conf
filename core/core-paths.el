(defun add-to-load-path (dir)
  "shortcut to adjust load-path"
  (add-to-list 'load-path dir))

(defconst yantonov/emacs-core-home
  (expand-file-name (concat yantonov/emacs-home "/core"))
  "dir with core settings and defuns")

(add-to-load-path yantonov/emacs-core-home)
(require 'core-funcs)

;; additional paths

(defconst yantonov/modes-home
  (expand-file-name (concat yantonov/emacs-home "/mode")))

(defconst yantonov/color-themes-home
  (expand-file-name (concat yantonov/emacs-home "/color-themes")))

(defconst yantonov/rc-home
  (expand-file-name (concat yantonov/emacs-home "/rc")))

(defconst yantonov/defuns-home
  (expand-file-name (concat yantonov/emacs-home "/defuns")))

(defconst yantonov/etc-home
  (expand-file-name (concat yantonov/emacs-home "/etc")))

(defconst yantonov/snippets-home
  (expand-file-name (concat yantonov/etc-home "/snippets")))

(defconst yantonov/eshell-home
  (expand-file-name (concat yantonov/etc-home "/eshell")))

(defun list-directories-only (dir)
  (filter-list 'file-directory-p (directory-files dir t "\\w+")))

(mapc 'add-to-load-path
      (append (list-directories-only yantonov/modes-home)
              (list-directories-only yantonov/color-themes-home)
              (list yantonov/rc-home
                    yantonov/defuns-home
                    yantonov/etc-home)))

(mapc (lambda (x) (add-to-list 'custom-theme-load-path x))
      (list-directories-only yantonov/color-themes-home))
