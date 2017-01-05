(require 'package)
(setq package-archives '(("melpa-stable" . "http://melpa-stable.milkbox.net/packages/")
;;                         ("melpa" . "https://melpa.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("gnu" . "http://elpa.gnu.org/packages/")))

(add-to-list 'package-pinned-packages '(cider . "melpa-stable") t)
(add-to-list 'package-pinned-packages '(clj-refactor . "melpa") t)

(package-initialize)

(provide 'etc-package)
