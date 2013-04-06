;;; emacs-rc-timeclock.el ---

(require 'timeclock)

(defvar timeclock-string nil)

(nconc global-mode-string '(timeclock-string))

(defun timeclock-update-string ()
  (interactive)
  (let* ((remainder (timeclock-workday-remaining t))
     (last-in (equal (car timeclock-last-event) "i")))
    (setq timeclock-string
      (format "   %c%s%c"
          (if last-in ?< ?[)
              remainder
              (if last-in ?> ?])))))

;;(run-at-time nil 60 'timeclock-update-string)

(add-hook 'timeclock-event-hook 'timeclock-update-string)
(add-hook 'timeclock-in-hook    'timeclock-reread-log)
(add-hook 'timeclock-out-hook   'timeclock-reread-log)

;;; emacs-rc-timeclock.el ends here
