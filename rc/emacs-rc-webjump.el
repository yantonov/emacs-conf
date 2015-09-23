;; webjump
;; http://www.neilvandyke.org/webjump/
;; description articles :
;; http://justinsboringpage.blogspot.com/2009/02/search-reddit-flickr-and-google-from.html
;; http://justinsboringpage.blogspot.com/2009/05/emacs-searching-programming-apis-with.html
;; http://justinsboringpage.blogspot.com/2010/11/just-browsing.html
(require 'webjump)
(setq
 webjump-sites
 (append
  '(
    ("jdk" .
     [simple-query
      "www.google.com"
      "http://www.google.com/search?hl=en&as_sitesearch=http://docs.oracle.com/javase/8/docs/api/&q="
      ""])
    ("clojure" . "http://clojure.org")
    ("github" . "https://github.com")
    ("bitbucket" . "https://bitbucket.org")
    ("hoogle" .
     [simple-query
      "http://www.haskell.org/hoogle/"
      "http://www.haskell.org/hoogle/?hoogle="
      ""])
    ("symbol" .
     [simple-query
      "http://symbolhound.com"
      "http://symbolhound.com/?q="
      ""])
    ("hayoo" .
     [simple-query
      "http://hayoo.fh-wedel.de/"
      "http://hayoo.fh-wedel.de/?query="
      ""])
    ("youtube" .
     [simple-query
      "youtube.com"
      "http://youtube.com/results?search_query="
      ""])
    ("google" .
     [simple-query
      "http://google.com"
      "http://www.google.com/search?ie=utf-8&oe=utf-8&q="
      ""]))
  webjump-sample-sites))

(provide 'emacs-rc-webjump)
