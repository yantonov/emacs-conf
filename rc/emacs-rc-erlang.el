;; erlang-mode-home, erlang-home is defined in ~/emacs/init.el
(defun yantonov/apply-erlang-environment-defaults ()
  (interactive)
  (yantonov/find-system-type-specific-file
   yantonov/erlang-mode-home
   '(('gnu/linux "/usr/lib/erlang/lib/tools*/emacs")
     ('windows-nt "C:/Program Files/erl*/lib/tools-*/emacs")))
  (yantonov/find-system-type-specific-file
   yantonov/erlang-home
   '(('gnu/linux "/usr/lib/erlang")
     ('windows-nt "C:/Program Files/erl*"))))

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
  (interactive)
  (and (yantonov/erlang-mode-exists) 
(yantonov/erlang-repl-exists)))

(defun yantonov/init-erlang-settings ()
  (interactive)
  (add-to-list 'load-path yantonov/erlang-mode-home)
  (setq erlang-root-dir yantonov/erlang-home)
  (add-to-list 'exec-path (concat erlang-root-dir "/bin"))
  (setq erlang-man-root-dir (concat erlang-root-dir "/man"))
  (require 'erlang-start)

  ;; open *.erl, *.hrl in erlang-mode
  ;; acrually erlang mode contains this bindings, added to avoid default problems
  (add-to-list 'auto-mode-alist '("\\.erl?$" . erlang-mode))
  (add-to-list 'auto-mode-alist '("\\.hrl?$" . erlang-mode)))

(yantonov/apply-erlang-environment-defaults)
(if (yantonov/erlang-environment-defined)
    (yantonov/init-erlang-settings))

(defun yantonov/erlang-mode-hook ()
  (paredit-mode +1)
  (highlight-parentheses-mode t)
  (rainbow-delimiters-mode-enable)
  ;; default node name in case of starting erlang shell in emacs
  (setq inferior-erlang-machine-options '("-sname" "emacs"))
  ;; add erlang functions to an imenu menu
  (imenu-add-to-menubar "imenu")
  ;; customize keys
  (local-set-key [return] 'newline-and-indent))

(add-hook 'erlang-mode-hook 'yantonov/erlang-mode-hook)

(eval-after-load 'erlang-mode
  '(progn
     (require 'paredit)
     (require 'highlight-parentheses)
     (require 'rainbow-delimiters)))

;; distel setup
(if (not (locate-library "distel"))
    ;; all modes inside mode directory
    ;; distel.el inside distel/elisp
    (add-to-list 'load-path (concat yantonov/emacs-mode-home  "/distel/elisp")))
(when (locate-library "distel")
  (require 'distel)
  (distel-setup))

(provide 'emacs-rc-erlang)
