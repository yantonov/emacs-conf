;; erlang-mode-home, erlang-home is defined in ~/emacs/init.el
(defun apply-erlang-environment-defaults ()
  (interactive)
  (if (not erlang-mode-home)
      (cond ((eq system-type 'gnu/linux)
             (setq erlang-mode-home (file-expand-wildcards-single-or-nil "/usr/lib/erlang/lib/tools*/emacs")))
            ((eq system-type 'windows-nt)
             (setq erlang-mode-home (file-expand-wildcards-single-or-nil "C:/Program Files/erl*/lib/tools-*/emacs")))))
  (if (not erlang-home)
      (cond ((eq system-type 'gnu/linux)
             (setq erlang-home (file-expand-wildcards-single-or-nil "/usr/lib/erlang")))
            ((eq system-type 'windows-nt)
             (setq erlang-home (file-expand-wildcards-single-or-nil "C:/Program Files/erl*"))))))

(defun erlang-mode-exists ()
  (and
   erlang-mode-home
   (file-directory-p erlang-mode-home)
   (file-exists-p (concat erlang-mode-home "/erlang.el"))))

(defun erlang-repl-exists()
  (and erlang-home
       (file-directory-p erlang-home)
       (or (file-exists-p (concat erlang-home "/bin/erl"))
           (file-exists-p (concat erlang-home "/bin/erl.exe")))))

(defun erlang-environment-defined ()
  (interactive)
  (and (erlang-mode-exists) (erlang-repl-exists)))

(defun init-erlang-settings ()
  (interactive)
  (add-to-list 'load-path erlang-mode-home)
  (setq erlang-root-dir erlang-home)
  (add-to-list 'exec-path (concat erlang-root-dir "/bin"))
  (setq erlang-man-root-dir (concat erlang-root-dir "/man"))
  (require 'erlang-start)

  ;; open *.erl, *.hrl in erlang-mode
  ;; acrually erlang mode contains this bindings, added to avoid default problems
  (add-to-list 'auto-mode-alist '("\\.erl?$" . erlang-mode))
  (add-to-list 'auto-mode-alist '("\\.hrl?$" . erlang-mode)))

(apply-erlang-environment-defaults)
(if (erlang-environment-defined)
    (init-erlang-settings))

(defun my-erlang-mode-hook ()
  (paredit-mode +1)
  (highlight-parentheses-mode t)
  (rainbow-delimiters-mode-enable)
  ;; default node name in case of starting erlang shell in emacs
  (setq inferior-erlang-machine-options '("-sname" "emacs"))
  ;; add erlang functions to an imenu menu
  (imenu-add-to-menubar "imenu")
  ;; customize keys
  (local-set-key [return] 'newline-and-indent))

(add-hook 'erlang-mode-hook 'my-erlang-mode-hook)

(eval-after-load 'erlang-mode
  '(progn
     (require 'paredit)
     (require 'highlight-parentheses)
     (require 'rainbow-delimiters)))

(provide 'emacs-rc-erlang)
