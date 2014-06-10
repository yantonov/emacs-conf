(require 'god-mode)

(setq god-global-mode nil)

(defun yantonov/my-update-cursor ()
  (setq cursor-type (if (or god-local-mode buffer-read-only)
                        'box
                      'bar)))

(defun yantonov/god-mode-update-cursor ()
  (let ((limited-colors-p (> 257 (length (defined-colors)))))
    (cond (god-local-mode (progn
                            (set-face-background 'mode-line (if limited-colors-p "white" "#e9e2cb"))
                            (set-face-background 'mode-line-inactive (if limited-colors-p "white" "#e9e2cb"))))
          (t (progn
               (set-face-background 'mode-line (if limited-colors-p "black" "#0a2832"))
               (set-face-background 'mode-line-inactive (if limited-colors-p "black" "#0a2832")))))))

(defun yantonov/god-mode-toggle-hook ()
  (yantonov/my-update-cursor)
  (yantonov/god-mode-update-cursor))

(defun yantonov/god-mode-enabled-hook ()
  (yantonov/god-mode-toggle-hook))

(defun yantonov/god-mode-disable-hook ()
  (yantonov/god-mode-toggle-hook))

(add-hook 'god-mode-enabled-hook 'yantonov/god-mode-disable-hook)
(add-hook 'god-mode-disabled-hook 'yantonov/god-mode-disable-hook)

(provide 'emacs-rc-god-mode)
