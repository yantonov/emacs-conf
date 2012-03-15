;; color-theme
;; additional-themes http://jblevins.org/projects/emacs-color-themes/
(add-to-list 'load-path (concat emacs-mode-home "color-theme-6.6.0"))
(add-to-list 'load-path (concat emacs-home "color-themes"))

(require 'color-theme)
(require 'color-theme-subdued)
(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     (color-theme-subdued)))