(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)
(package-refresh-contents)

(when (not (package-installed-p 'color-theme-solarized))
  (package-install 'color-theme-solarized))
