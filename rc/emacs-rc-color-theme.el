;; color-theme
;; additional-themes http://jblevins.org/projects/emacs-color-themes/
(require 'color-theme)
(require 'gentooish)
(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     (color-theme-gentooish)))