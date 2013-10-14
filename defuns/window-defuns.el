(defun rotate-windows ()
  "Rotate your windows."
  (interactive)
  (cond ((not (> (count-windows) 1))
         (message "You can't rotate a single window!"))
        (t
         (defvar i)
         (defvar numWindows)
         (setq i 1)
         (setq numWindows (count-windows))
         (while  (< i numWindows)
           (let* (
                  (w1 (elt (window-list) i))
                  (w2 (elt (window-list) (+ (% i numWindows) 1)))

                  (b1 (window-buffer w1))
                  (b2 (window-buffer w2))

                  (s1 (window-start w1))
                  (s2 (window-start w2))
                  )
             (set-window-buffer w1 b2)
             (set-window-buffer w2 b1)
             (set-window-start w1 s2)
             (set-window-start w2 s1)
             (setq i (1+ i)))))))

(defun reverse-rotate-windows ()
  "Rotate your windows in reserse order."
  (interactive)
  (cond ((not (> (count-windows) 1))
         (message "You can't rotate a single window!"))
        (t
         (defvar i)
         (defvar numWindows)
         (setq numWindows (count-windows))
         (setq i numWindows)
         (while  (> i 1)
           (let* (
                  (w1 (elt (window-list) i))
                  (w2 (elt (window-list) (- i 1)))

                  (b1 (window-buffer w1))
                  (b2 (window-buffer w2))

                  (s1 (window-start w1))
                  (s2 (window-start w2))
                  )
             (set-window-buffer w1 b2)
             (set-window-buffer w2 b1)
             (set-window-start w1 s2)
             (set-window-start w2 s1)
             (setq i (1- i)))))))

(defun toggle-window-split ()
  "Toggles between horizontal and vertical layout of two windows."
  (interactive)
  (if (= (count-windows) 2)
      (let* ((this-win-buffer (window-buffer))
             (next-win-buffer (window-buffer (next-window)))
             (this-win-edges (window-edges (selected-window)))
             (next-win-edges (window-edges (next-window)))
             (this-win-2nd (not (and (<= (car this-win-edges)
                                         (car next-win-edges))
                                     (<= (cadr this-win-edges)
                                         (cadr next-win-edges)))))
             (splitter
              (if (= (car this-win-edges)
                     (car (window-edges (next-window))))
                  'split-window-horizontally
                'split-window-vertically)))
        (delete-other-windows)
        (let ((first-win (selected-window)))
          (funcall splitter)
          (if this-win-2nd (other-window 1))
          (set-window-buffer (selected-window) this-win-buffer)
          (set-window-buffer (next-window) next-win-buffer)
          (select-window first-win)
          (if this-win-2nd (other-window 1))))))

(defun eshell-for-buffer ()
  "Switch to eshell and make sure we're in the directory the current buffer is in."
  (interactive)
  (let ((dir default-directory)
        (eshell-buffer-name "*eshell*"))
    (let ((b (get-buffer eshell-buffer-name)))
      (unless b
        (eshell)))
    (display-buffer eshell-buffer-name t)
    (switch-to-buffer-other-window eshell-buffer-name)
    (end-of-buffer)
    (unless (equalp dir default-directory)
      (cd dir)
      (eshell-send-input)
      (end-of-buffer))))

(defun reset-ui (&optional frame)
  (interactive)
  ;; init frame
  ;; (split-window-horizontally)
  t
  )

(defun start-or-switch-to (function buffer-name)
  "Invoke FUNCTION if there is no buffer with BUFFER-NAME.
Otherwise switch to the buffer named BUFFER-NAME.  Don't clobber
the current buffer."
  (if (not (get-buffer buffer-name))
      (progn
        (split-window-sensibly (selected-window))
        (other-window 1)
        (funcall function))
    (switch-to-buffer-other-window buffer-name)))

(defun switch-to-fullscreen-buffer (b-name function reg-name)
  "switches between current buffer layout and fullscreen buffer of given name1.
Calls function during swithing to fullscrenn."
  (interactive)
  (if (and
       (= (count-windows) 1)
       (string= (buffer-name) b-name))
      (jump-to-register reg-name)
    (progn
      (window-configuration-to-register reg-name)
      (delete-other-windows)
      (if (not (get-buffer b-name))
          (funcall function)
        (switch-to-buffer b-name)))))

(defun fullscreen-eshell ()
  "Bring up a full-screen eshell or restore previous config."
  (interactive)
  (switch-to-fullscreen-buffer "*eshell*"
                               (lambda () (eshell))
                               :eshell-fullscreen))

(defun fullscreen-scratch ()
  "Save window configuraion and goto *scratch* buffer.
Second call restores windows configuration."
  (interactive)
  (switch-to-fullscreen-buffer "*scratch*"
                               (lambda () (switch-to-buffer "*scratch*"))
                               :eshell-fullscreen))

(defun goto-previous-window ()
  "Turns you to previous window."
  (interactive)
  (other-window -1))

(provide 'window-defuns)
