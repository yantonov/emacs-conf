(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

(when (not (package-installed-p 'nrepl))
  (package-install 'nrepl))
