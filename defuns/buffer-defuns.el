(defun yantonov/indent-buffer ()
  (interactive)
  (indent-region (point-min) (point-max)))

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

(defun yantonov/google ()
  "Google the selected region if any, display a query prompt otherwise."
  (interactive)
  (search-internal "http://www.google.com/search?ie=utf-8&oe=utf-8&q=" "Google: "))

(defun yantonov/youtube ()
  "Search YouTube with a query or region if any."
  (interactive)
  (search-internal "http://www.youtube.com/results?search_query=" "Search YouTube: "))

(defun search-internal (url description)
  (browse-url
   (concat
    url
    (url-hexify-string (if mark-active
                           (buffer-substring (region-beginning) (region-end))
                         (read-string description))))))

(defun yantonov/indent-defun ()
  "Indent the current defun."
  (interactive)
  (save-excursion
    (mark-defun)
    (indent-region (region-beginning) (region-end))))

(defun yantonov/kill-other-buffers ()
  "Kill all buffers but the current one.
Don't mess with special buffers."
  (interactive)
  (dolist (buffer (buffer-list))
    (unless (or (eql buffer (current-buffer)) (not (buffer-file-name buffer)))
      (kill-buffer buffer))))

(defun yantonov/move-line-up ()
  "Move up the current line."
  (interactive)
  (transpose-lines 1)
  (forward-line -2)
  (indent-according-to-mode))

(defun yantonov/move-line-down ()
  "Move down the current line."
  (interactive)
  (forward-line 1)
  (transpose-lines 1)
  (forward-line -1)
  (indent-according-to-mode))

(defun yantonov/kill-all-buffers ()
  (interactive)
  (mapc 'kill-buffer (buffer-list))
  (switch-to-buffer "*scratch*")
  (if (eq system-type 'windows-nt)
      (cd "~")))

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

(provide 'buffer-defuns)
