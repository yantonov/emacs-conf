;; webjump
;; http://www.neilvandyke.org/webjump/
;; description articles :
;; http://justinsboringpage.blogspot.com/2009/02/search-reddit-flickr-and-google-from.html
;; http://justinsboringpage.blogspot.com/2009/05/emacs-searching-programming-apis-with.html
;; http://justinsboringpage.blogspot.com/2010/11/just-browsing.html
(require 'webjump)
(global-set-key [f2] 'webjump)
(setq
 webjump-sites
 (append
  '(
    ("Java API" .
     [simple-query
      "www.google.com"
      "http://www.google.ca/search?hl=en&as_sitesearch=http://java.sun.com/javase/6/docs/api/&q="
      ""])
    ("clojure" . "http://clojure.org"))
  webjump-sample-sites))
