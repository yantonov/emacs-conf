;; source http://ergoemacs.org/emacs/emacs_switching_fonts.html



(defcustom yantonov/my-font-list
  nil
  "A list of fonts for `yantonov/cycle-font' to cycle from.
See https://www.gnu.org/software/emacs/manual/html_node/emacs/Fonts.html to get information about font configuration."
  :group
  'font)

(set-default 'yantonov/my-font-list
             (cond
              ((yantonov/windowsp)
               '(
                 "Courier New-13"
                 "DejaVu Sans Mono-13"                 )
               )
              ((yantonov/linuxp)
               '(
                 "DejaVu Sans Mono-13"
                 )
               )
              ((yantonov/macp)
               '(
                 "Recursive-12" ; https://fonts.google.com/specimen/Recursive#standard-styles
                 "Monaco-12"
                 "Courier New-13"
                 ))))

(defun yantonov/set-font (font-index)
  "Set font by index from predefined list."
  (interactive "p")
  (setq fontToUse (nth font-index yantonov/my-font-list))
  (set-frame-parameter nil 'font fontToUse)
  (redraw-frame (selected-frame))
  (message "Current font is: %s" fontToUse))

(defun yantonov/cycle-font (font-index)
  "Change font in current frame.
Each time this is called, font cycles thru a predefined list of fonts in the variable `yantonov/my-font-list' .
If font-index is 1, cycle forward.
If font-index is -1, cycle backward."
  (interactive "p")
  ;; this function sets a property “state”. It is a integer. Possible values are any index to the fontList.
  (let (fontToUse stateBefore stateAfter )
    (setq stateBefore (if (get 'cycle-font 'state)
                          (get 'cycle-font 'state)
                        0))
    (setq stateAfter (% (+ stateBefore (length yantonov/my-font-list) font-index)
                        (length yantonov/my-font-list)))

    (yantonov/set-font stateAfter)
    (put 'cycle-font 'state stateAfter)))

(defun yantonov/cycle-font-forward ()
  "Switch to the next font, in the current frame. See `cycle-font'."
  (interactive)
  (yantonov/cycle-font 1))

(defun yantonov/cycle-font-backward ()
  "Switch to the previous font, in the current frame. See `cycle-font'."
  (interactive)
  (yantonov/cycle-font -1))

(provide 'emacs-rc-font)
