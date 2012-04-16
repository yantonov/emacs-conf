;; color-theme
;; additional-themes http://jblevins.org/projects/emacs-color-themes/
;; enable color theme mode
(add-to-list 'load-path (concat emacs-mode-home "color-theme-6.6.0"))
;; custom color themes
(add-to-list 'load-path (concat emacs-home "color-themes"))

(require 'color-theme)
(require 'gentooish)
(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     (color-theme-gentooish)))