(defun untabify-buffer()
  (interactive)
  (untabify (point-min) (point-max))
  )

(defun tabify-buffer()
  (interactive)
  (tabify (point-min) (point-max))
  )

(defun goto-line-with-feedback ()
  "Show line numbers temporarily, while prompting for the line number input"
  (interactive)
  (unwind-protect
      (progn
        (linum-mode 1)
        (call-interactively 'goto-line))
    (linum-mode 0)))

(defun open-line-below ()
  (interactive)
  (if (eolp)
      (newline)
    (end-of-line)
    (newline))
  (indent-for-tab-command))

(defun open-line-above ()
  (interactive)
  (beginning-of-line)
  (newline)
  (forward-line -1)
  (indent-for-tab-command))

(defun cleanup-buffer-safe ()
  "Perform a bunch of safe operations on the whitespace content of a buffer.
Does not indent buffer, because it is used for a before-save-hook, and that
might be bad."
  (interactive)
  (untabify (point-min) (point-max))
  (if (eq 'markdown-mode (buffer-local-value 'major-mode (current-buffer)))
      nil
    (delete-trailing-whitespace)
    )
  (set-buffer-file-coding-system 'utf-8)
  )

(defun cleanup-buffer ()
  "Perform a bunch of operations on the whitespace content of a buffer.
Including indent-buffer, which should not be called automatically on save."
  (interactive)
  (cleanup-buffer-safe)
  (indent-buffer)
  )

(defun move-region-to-bottom (start end)
  "Move selected text to bottom of buffer"
  (interactive "r")
  (if (use-region-p)
      (let ((count (count-words-region start end)))
        (save-excursion
          (kill-region start end)
          (goto-char (point-max))
          (yank)
          (newline))
        (push-mark (point))
        (message "Moved %s words" count))
    (message "No region selected"))
  )
