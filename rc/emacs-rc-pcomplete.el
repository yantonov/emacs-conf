;;**** Git Completion
(defun pcmpl-git-commands ()
  "Return the most common git commands by parsing the git output."
  (interactive)
  (with-temp-buffer
    (call-process-shell-command "git" nil (current-buffer) nil "help" "--all")
    (goto-char 0)
    (if (eq (search-forward "available git commands in") nil)
        '("cant find git executable, check PATH varialbe")
      (let (commands)
        (while (re-search-forward
                "^[[:blank:]]+\\([[:word:]-.]+\\)[[:blank:]]*\\([[:word:]-.]+\\)?"
                nil t)
          (push (match-string 1) commands)
          (when (match-string 2)
            (push (match-string 2) commands)))
        (sort commands #'string<)))))

(defconst cached__pcmpl-git-commands (cached 'pcmpl-git-commands)
  "Cached list of `git' commands.")

(defvar pcmpl-git-ref-list-cmd "git for-each-ref refs/ --format='%(refname)'"
  "The `git' command to run to get a list of refs.")

(defun pcmpl-git-get-refs (type)
  "Return a list of `git' refs filtered by TYPE."
  (with-temp-buffer
    (insert (shell-command-to-string pcmpl-git-ref-list-cmd))
    (goto-char (point-min))
    (let (refs)
      (while (re-search-forward (concat "^refs/" type "/\\(.+\\)$") nil t)
        (push (match-string 1) refs))
      (nreverse refs))))

(defun pcmpl-git-remotes ()
  "Return a list of remote repositories."
  (split-string (shell-command-to-string "git remote")))

(defun pcomplete/git ()
  "Completion for `git'."
  ;; Completion for the command argument.
  (pcomplete-here* (funcall cached__pcmpl-git-commands))
  (cond
   ((pcomplete-match "help" 1)
    (pcomplete-here* (funcall cached__pcmpl-git-commands)))
   ((pcomplete-match (regexp-opt '("pull" "push")) 1)
    (pcomplete-here (pcmpl-git-remotes)))
   ;; provide branch completion for the command `checkout'.
   ((pcomplete-match "checkout" 1)
    (pcomplete-here* (append (pcmpl-git-get-refs "heads")
                             (pcmpl-git-get-refs "tags"))))
   (t
    (while (pcomplete-here (pcomplete-entries))))))

;;**** Mercurial (hg) Completion

(defun pcmpl-hg-commands ()
  "Return the most common hg commands by parsing the hg output."
  (interactive)
  (with-temp-buffer
    (call-process-shell-command "hg" nil (current-buffer) nil "-v" "help")
    (goto-char 0)
    (if (eq (search-forward "list of comxmands:" nil t) nil)
        '("cant find hg executable, check PATH variable")
      (let (commands
            (bound (save-excursion
                     (re-search-forward "^[[:alpha:]]")
                     (forward-line 0)
                     (point))))
        (while (re-search-forward
                "^[[:blank:]]\\([[:word:]]+\\(?:, [[:word:]]+\\)*\\)" bound t)
          (let ((match (match-string 1)))
            (if (not (string-match "," match))
                (push (match-string 1) commands)
              (dolist (c (split-string match ", ?"))
                (push c commands)))))
        (sort commands #'string<)))))

(defconst cached__pcmpl-hg-commands (cached 'pcmpl-hg-commands))

(defun pcomplete/hg ()
  "Completion for `hg'."
  ;; Completion for the command argument.
  (pcomplete-here* (funcall cached__pcmpl-hg-commands))
  (cond
   ((pcomplete-match "help" 1)
    (pcomplete-here* (funcall cached__pcmpl-hg-commands)))
   (t
    (while (pcomplete-here (pcomplete-entries))))))

(provide 'emacs-rc-pcomplete)
