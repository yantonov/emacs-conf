(when (window-system)
  (require 'git-gutter-fringe)
  ;; look and feel
  (set-face-foreground 'git-gutter-fr:modified "yellow")
  (set-face-foreground 'git-gutter-fr:added    "green")
  (set-face-foreground 'git-gutter-fr:deleted  "red")
  (setq git-gutter-fr:side 'right-fringe)
  ;; enable by default
  (global-git-gutter-mode +1))

(provide 'emacs-rc-git-gutter-fridge)
