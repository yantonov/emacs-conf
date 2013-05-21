;; erlang-mode-home, erlang-home is defined in ~/emacs/init.el
(require 'paredit)
(require 'highlight-parentheses)
(require 'rainbow-delimiters)

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

(defun erlang-envorinment-defined ()
  (interactive)
  (and (erlang-mode-exists) (erlang-repl-exists)))

(defun init-erlang-settings ()
  (interactive)
  (add-to-list 'load-path erlang-mode-home)
  (setq erlang-root-dir erlang-home)
  (add-to-list 'exec-path (concat erlang-root-dir "/bin"))
  (setq erlang-man-root-dir (concat erlang-root-dir "/man"))
  (require 'erlang-start)

  (add-to-list 'auto-mode-alist '("\\.erl?$" . erlang-mode))
  (add-to-list 'auto-mode-alist '("\\.hrl?$" . erlang-mode)))

(if (erlang-envorinment-defined)
    (init-erlang-settings))

(defun my-erlang-mode-hook ()
  (paredit-mode +1)
  (highlight-parentheses-mode t)
  (rainbow-delimiters-mode-enable))

(add-hook 'erlang-mode-hook 'my-erlang-mode-hook)
