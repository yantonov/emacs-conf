(add-to-list 'load-path "/usr/bin/erl")
(require 'erlang-start)

(add-to-list 'auto-mode-alist '("\\.erl?$" . erlang-mode))
(add-to-list 'auto-mode-alist '("\\.hrl?$" . erlang-mode))

(setq erlang-root-dir "/usr/bin/erl")
(add-to-list 'exec-path "/usr/bin/erl/bin")
(setq erlang-man-root-dir "/usr/bin/erl/man")
