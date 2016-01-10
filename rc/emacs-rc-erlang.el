;; erlang-mode-home, erlang-home is defined in ~/emacs/init.el
(defun yantonov/apply-erlang-environment-defaults ()
  (yantonov/find-system-type-specific-file
   yantonov/erlang-mode-home
   '((yantonov/linuxp "/usr/lib/erlang/lib/tools*/emacs")
     (yantonov/windowsp "C:/Program Files/erl*/lib/tools-*/emacs")
     (yantonov/macp "/usr/local/lib/erlang/lib/tools-*/emacs")))
  (yantonov/find-system-type-specific-file
   yantonov/erlang-home
   '((yantonov/linuxp "/usr/lib/erlang")
     (yantonov/windowsp "C:/Program Files/erl*")
     (yantonov/macp "/usr/local/lib/erlang"))))

(defun yantonov/erlang-mode-exists ()
  (and
   yantonov/erlang-mode-home
   (file-directory-p yantonov/erlang-mode-home)
   (file-exists-p (concat yantonov/erlang-mode-home "/erlang.el"))))

(defun yantonov/erlang-repl-exists()
  (and yantonov/erlang-home
       (file-directory-p yantonov/erlang-home)
       (or (file-exists-p (concat yantonov/erlang-home "/bin/erl"))
           (file-exists-p (concat yantonov/erlang-home "/bin/erl.exe")))))

(defun yantonov/erlang-environment-defined ()
  (and (yantonov/erlang-mode-exists)
       (yantonov/erlang-repl-exists)))

(defun yantonov/erlang-load-hook()
  (setq erlang-root-dir yantonov/erlang-home)

  (add-to-list 'exec-path (concat erlang-root-dir "/bin"))
  (setq erlang-man-root-dir (concat erlang-root-dir "/man"))
  ;; default node name in case of starting erlang shell in emacs
  (setq inferior-erlang-machine-options '("-sname" "emacs"))

  ;; distel
  (if (not (locate-library "distel"))
      (add-to-list 'load-path
                   (concat yantonov/modes-home
                           "/distel/elisp")))
  (when (locate-library "distel")
    (require 'distel)
    (distel-setup))

  ;; open *.erl, *.hrl in erlang-mode
  ;; actually erlang mode contains this bindings,
  ;; added to avoid default problems
  (add-to-list 'auto-mode-alist '("\\.erl?$" . erlang-mode))
  (add-to-list 'auto-mode-alist '("\\.hrl?$" . erlang-mode))

  (require 'rainbow-delimiters))

(defun yantonov/erlang-mode-hook ()
  (rainbow-delimiters-mode-enable)
  ;; add erlang functions to an imenu menu
  (imenu-add-to-menubar "imenu")
  ;; customize keys
  (local-set-key [return] 'newline-and-indent))

(yantonov/apply-erlang-environment-defaults)
(if (yantonov/erlang-environment-defined)
    (progn
      (add-to-list 'load-path yantonov/erlang-mode-home)
      (require 'erlang-start)
      (add-hook 'erlang-load-hook 'yantonov/erlang-load-hook)
      (add-hook 'erlang-mode-hook 'yantonov/erlang-mode-hook)))

(provide 'emacs-rc-erlang)
