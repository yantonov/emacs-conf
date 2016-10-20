(defun yantonov/line-number-for-point (pos)
  (save-excursion
    (goto-char pos)
    (beginning-of-line)
    (point)))

(defun yantonov/whole-line-or-region ()
  "Returns start, end of selected region or current line if no selection."
  (interactive)
  (if (use-region-p)
      (list (region-beginning) (region-end))
    (list (line-beginning-position) (line-beginning-position 2))))

(defun yantonov/indent-region-or-buffer ()
  "indent region or whole buffer"
  (interactive)
  (if (use-region-p)
      (indent-region (region-beginning) (region-end))
    (indent-region (point-min) (point-max))))

(defun yantonov/untabify-buffer()
  (interactive)
  (untabify (point-min) (point-max)))

(defun yantonov/tabify-buffer()
  (interactive)
  (tabify (point-min) (point-max)))

(defun yantonov/goto-line-with-feedback ()
  "Show line numbers temporarily, while prompting for the line number input"
  (interactive)
  (unwind-protect
      (progn
        (linum-mode 1)
        (call-interactively 'goto-line))
    (linum-mode 0)))

(defun yantonov/cleanup-buffer-safe ()
  "Perform a bunch of safe operations on the whitespace content of a buffer.
Does not indent buffer, because it is used for a before-save-hook, and that
might be bad."
  (interactive)
  (untabify (point-min) (point-max))
  (if (eq 'markdown-mode
          (buffer-local-value 'major-mode (current-buffer)))
      nil
    (whitespace-cleanup))
  (set-buffer-file-coding-system 'utf-8))

(defun yantonov/cleanup-buffer ()
  "Perform a bunch of operations on the whitespace content of a buffer.
Including indent-buffer, which should not be called automatically on save."
  (interactive)
  (yantonov/cleanup-buffer-safe)
  (indent-buffer))

(defun yantonov/move-region-to-bottom (start end)
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
    (message "No region selected")))

(defun yantonov/smart-open-line ()
  "Insert an empty line after the current line.
Position the cursor at its beginning, according to the current mode."
  (interactive)
  (move-end-of-line nil)
  (newline-and-indent))

(defun yantonov/smart-open-line-above ()
  "Insert an empty line above the current line.
Position the cursor at it's beginning, according to the current mode."
  (interactive)
  (move-beginning-of-line nil)
  (newline-and-indent)
  (forward-line -1)
  (indent-according-to-mode))

(defun yantonov/get-buffer-file-name (&optional full-path?)
  "Returns full path of file name for current buffer"
  (interactive)
  (if (equal major-mode 'dired-mode)
      default-directory
    (let ((name (buffer-file-name)))
      (when name
        (if full-path?
            name
          (file-name-nondirectory name))))))

(defun yantonov/copy-buffer-file-name-to-clipboard (&optional full-path?)
  "Copy file name for the current buffer to the clipboard."
  (interactive)
  (let ((filename (yantonov/get-buffer-file-name full-path?)))
    (when filename
      (kill-new filename)
      (message "Copied buffer file name '%s' to the clipboard." filename))))

(defun yantonov/copy-buffer-file-path-to-clipboard ()
  "Copy path for current buffer file"
  (interactive)
  (yantonov/copy-buffer-file-name-to-clipboard 1))

(defun yantonov/indent-defun ()
  "Indent the current defun."
  (interactive)
  (save-excursion
    (mark-defun)
    (indent-region (region-beginning) (region-end))))

(defun yantonov/kill-other-file-buffers ()
  "Kill all buffers but the current one. Don't mess with special buffers."
  (interactive)
  (dolist (buffer (buffer-list))
    (unless (or (eql buffer (current-buffer))
                (not (buffer-file-name buffer)))
      (kill-buffer buffer))))

(defun yantonov/kill-other-buffers ()
  "Kill all buffers but the current one. Don't mess with special buffers."
  (interactive)
  (dolist (buffer (buffer-list))
    (unless (or (eql buffer (current-buffer)))
      (kill-buffer buffer))))

(defun yantonov/move-region (from to n)
  "Move the current region up or down by N lines."
  (interactive "r\np")
  (let ((use-region (use-region-p))
        (line-text  (delete-and-extract-region from to)))
    (forward-line n)
    (let ((start (point)))
      (insert line-text)
      (if use-region
          (progn
            (setq deactivate-mark nil)
            (set-mark start))
        (goto-char start)))))

(defun yantonov/move-whole-line-or-region (n)
  (interactive)
  (let ((region (yantonov/whole-line-or-region)))
    (let ((from (nth 0 region))
          (to (nth 1 region)))
      (yantonov/move-region from to n))))

(defun yantonov/move-whole-line-or-region-up ()
  "Move selected region or current line up."
  (interactive)
  (yantonov/move-whole-line-or-region -1))

(defun yantonov/move-whole-line-or-region-down ()
  "Move selected region or current line down."
  (interactive)
  (yantonov/move-whole-line-or-region 1))

(defun yantonov/kill-all-buffers ()
  (interactive)
  (mapc 'kill-buffer (buffer-list))
  (switch-to-buffer "*scratch*"))

(defun yantonov/unix-file ()
  "Change the current buffer to utf-8 with Unix line-ends."
  (interactive)
  (set-buffer-file-coding-system 'utf-8-unix t))

(defun yantonov/dos-file ()
  "Change the current buffer to utf-8 with DOS line-ends."
  (interactive)
  (set-buffer-file-coding-system 'utf-8-dos t))

(defun yantonov/mac-file ()
  "Change the current buffer to utf-8 with Mac line-ends."
  (interactive)
  (set-buffer-file-coding-system 'utf-8-mac t))

(defun yantonov/buffer-encoding ()
  "Get buffer file encoding"
  (interactive)
  (message (symbol-name buffer-file-coding-system)))

(defun yantonov/comment-line (n)
  "Comment or uncomment current line and leave point after it.
With positive prefix, apply to N lines including current one.
With negative prefix, apply to -N lines above."
  (interactive "p")
  (comment-or-uncomment-region
   (line-beginning-position)
   (goto-char (line-end-position n)))
  (forward-line 1)
  (back-to-indentation))

(defun yantonov/smart-comment (n)
  (interactive "p")
  (if (use-region-p)
      (comment-or-uncomment-region (region-beginning) (region-end))
    (yantonov/comment-line n)))

(defun yantonov/toggle-camelcase-underscores ()
  "Toggle between camcelcase and underscore notation for the symbol at point."
  (interactive)
  (save-excursion
    (let* ((bounds (bounds-of-thing-at-point 'symbol))
           (start (car bounds))
           (end (cdr bounds))
           (currently-using-underscores-p (progn (goto-char start)
                                                 (re-search-forward "_" end t))))
      (if currently-using-underscores-p
          (progn
            (upcase-initials-region start end)
            (replace-string "_" "" nil start end)
            (downcase-region start (1+ start)))
        (replace-regexp "\\([A-Z]\\)" "_\\1" nil (1+ start) end)
        (downcase-region start end)))))

(provide 'buffer-defuns)
