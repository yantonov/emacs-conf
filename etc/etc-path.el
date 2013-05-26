(defcustom pt-projectile-require-project-root t
  "Require the presence of a project root to operate when true.
Otherwise consider the current directory the project root."
  :type 'boolean)

(defvar pt-project-root-files
  '(".projectile" "project.clj" ".git" ".hg" ".bzr" "_darcs"
    "rebar.config" "pom.xml" "build.sbt" "Gemfile")
  "A list of files considered to mark the root of a project.")

(defun pt-project-root ()
  "Retrieves the root directory of a project if available.
The current directory is assumed to be the project's root otherwise."
  (interactive)
  (or (->> pt-project-root-files
        (--map (locate-dominating-file default-directory it))
        (-remove #'null)
        (car))
      (if pt-projectile-require-project-root
          (error "You're not into a project")
        default-directory)))

(provide 'etc-path)
