;; -*- lexical-binding: t -*-

(defconst yantonov/*broken-line-regex* (string ?\n))

(defun yantonov/xml-join-broken-lines (start end)
  (goto-char start)
  (while (re-search-forward yantonov/*broken-line-regex* end t)
    (replace-match "" nil nil)))

(defun yantonov/xml-pretty-print-region (begin end)
  (interactive)
  (let ((cb (current-buffer))
        (buf (get-buffer-create "*xml*")))
    (save-excursion
      (set-buffer buf)
      (erase-buffer)
      (set-buffer cb)
      (copy-to-buffer buf begin end)
      (switch-to-buffer-other-window buf)
      (nxml-mode)
      (yantonov/xml-join-broken-lines begin end)
      (goto-char begin)
      (while (search-forward-regexp "\>[ \\t]*\<" nil t)
        (backward-char) (insert "\n"))
      (indent-region begin end)
      (other-window -1))))

(defun yantonov/xml-pretty-print ()
  (interactive)
  (yantonov/xml-pretty-print-region (point-min) (point-max)))

(provide 'xml-buffer-defuns)
