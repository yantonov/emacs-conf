(defun yantonov/windowsp ()
  (eq system-type 'windows-nt))

(defun yantonov/linuxp ()
  (eq system-type 'gnu/linux))

(defun yantonov/macp ()
  (eq system-type 'darwin))

(provide 'sys-defuns)
