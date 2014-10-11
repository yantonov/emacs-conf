(defun yantonov/os-windows-p ()
  (eq system-type 'windows-nt))

(defun yantonov/os-linux-p ()
  (eq system-type 'gnu/linux))

(provide 'sys-defuns)
