(defun yantonov/google ()
  "Google the selected region if any, display a query prompt otherwise."
  (interactive)
  (yantonov/search-internal "http://www.google.com/search?ie=utf-8&oe=utf-8&q=" "Google: "))

(defun yantonov/youtube ()
  "Search YouTube with a query or region if any."
  (interactive)
  (yantonov/search-internal "http://www.youtube.com/results?search_query=" "Search YouTube: "))

(defun yantonov/search-rust-doc ()
  "Search https://doc.rust-lang.org/std/"
  (interactive)
  (yantonov/search-internal "https://doc.rust-lang.org/std/?search=" "Search doc.rust-lang.org/std: "))

(defun yantonov/search-internal (url description &optional interactive-mode)
  (browse-url
   (concat
    url
    (url-hexify-string
     (cond (interactive-mode (read-string description))
           (mark-active (buffer-substring (region-beginning)
                                          (region-end)))
           (t (thing-at-point 'symbol)))))))

(provide 'search-defuns)
