(require 'frame-cmds)

;;set frame full height and 86 columns wide
;;and position at screen left
(defun yantonov/frame-resize-l ()
  "set frame full height and 86 columns wide and position at screen left"
  (interactive)
  (set-frame-width (selected-frame) 86)
  (maximize-frame-vertically)
  (set-frame-position (selected-frame) 0 0))

;;set frame full height and 86 columns wide
;;and position at screen right
(defun yantonov/frame-resize-r ()
  "set frame full height and 86 columns wide and position at screen right"
  (interactive)
  (set-frame-width (selected-frame) 86)
  (maximize-frame-vertically)
  (set-frame-position (selected-frame)
                      (- (display-pixel-width)
                         (frame-pixel-width)) 0))

;;set frame full height and 86 columns wide
;;and position at screen right of left hand screen in 2 monitor display
;;assumes monitors are same resolution
(defun yantonov/frame-resize-r2 ()
  "set frame full height and 86 columns wide and position at screen right of left hand screen in 2 monitor display assumes monitors are same resolution"
  (interactive)
  (set-frame-width (selected-frame) 86)
  (maximize-frame-vertically)
  (set-frame-position (selected-frame)
                      (- (/ (display-pixel-width) 2)
                         (frame-pixel-width)) 0))


(provide 'emacs-rc-frame-cmds)
