(require 'package)
(setq package-archives '(("melpa-stable" . "http://melpa-stable.milkbox.net/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("gnu" . "http://elpa.gnu.org/packages/")))

(add-to-list 'package-pinned-packages '(cider . "melpa-stable") t)

(package-initialize)

(require 'use-package)

(provide 'etc-package)
