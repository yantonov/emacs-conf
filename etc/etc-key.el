(defun yantonov/kbd-conf-mac (key-map)
  (if (yantonov/macp)
      (progn
        (setq mac-command-modifier 'meta)
        (setq mac-option-modifier 'super)
        (setq mac-control-modifier 'control)
        (setq ns-function-modifier 'hyper)
        (define-key key-map (kbd "M-_") 'undo)
        (define-key key-map (kbd "M-N") 'projectile-find-file)
        (define-key key-map (kbd "H-SPC") 'set-mark-command)
        (define-key key-map (kbd "C-M-m") 'yantonov/toggle-fullscreen))))

(defun yantonov/kbd-conf-win (key-map)
  "see http://ergoemacs.org/emacs/emacs_hyper_super_keys.html for details"
  (if (yantonov/windowsp)
      (progn
        (setq w32-pass-lwindow-to-system nil
              w32-pass-rwindow-to-system nil
              w32-pass-apps-to-system nil
              w32-lwindow-modifier 'super
              w32-rwindow-modifier 'super
              w32-apps-modifier 'hyper))))

(defun yantonov/kbd-conf ()
  "load all key customizations"
  (interactive)
  (yantonov/kbd-conf-mac (current-global-map))
  (yantonov/kbd-conf-win (current-global-map)))

(yantonov/kbd-conf)

(provide 'etc-key)
