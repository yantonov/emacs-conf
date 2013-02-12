(defun dired-back-to-top ()
  (interactive)
  (beginning-of-buffer)
  (dired-next-line 4))

(defun dired-jump-to-bottom ()
  (interactive)
  (end-of-buffer)
  (dired-next-line -1))


(add-hook 'dired-mode-hook
          (lambda ()
            (define-key dired-mode-map
              (vector 'remap 'beginning-of-buffer) 'dired-back-to-top)

            (define-key dired-mode-map
              (vector 'remap 'end-of-buffer) 'dired-jump-to-bottom)
            )
          )

