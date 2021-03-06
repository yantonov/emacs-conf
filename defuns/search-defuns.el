;; -*- lexical-binding: t -*-

(defun yantonov/google ()
  "Google the selected region if any, display a query prompt otherwise."
  (interactive)
  (yantonov/search-internal "http://www.google.com/search?ie=utf-8&oe=utf-8&q=" "Google: "))

(defun yantonov/youtube ()
  "Search YouTube with a query or region if any."
  (interactive)
  (yantonov/search-internal "http://www.youtube.com/results?search_query=" "Search YouTube: "))

(defun yantonov/search-internal (url description)
  (browse-url
   (concat
    url
    (url-hexify-string
     (cond (mark-active (buffer-substring (region-beginning)
                                          (region-end)))
           (t (let ((s (read-string description)))
                (if (> (length s) 0)
                    s
                  (thing-at-point 'symbol)))))))))

(defun yantonov/isearch-symbol-with-prefix (p)
  "Like isearch, unless prefix argument is provided.
With a prefix argument P, isearch for the symbol at point.
C-u C-s - search symbol under point"
  (interactive "P")
  (let ((current-prefix-arg nil))
    (call-interactively
     (if p #'isearch-forward-symbol-at-point
       #'isearch-forward))))

(provide 'search-defuns)
