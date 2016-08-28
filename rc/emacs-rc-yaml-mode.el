(require 'yaml-mode)

(defun yantonov/yaml-indent-region (from to)
  (save-excursion
    (let ((from-line (yantonov/line-number-for-point from))
          (to-line (let ((last-line (yantonov/line-number-for-point to)))
                     (if (= last-line to)
                         (yantonov/line-number-for-point (- last-line 1))
                       last-line))))
      (goto-char from-line)
      (while (< (point) to-line)
        (yaml-indent-line)
        (forward-line 1)))))

(defun yantonov/yaml-indent ()
  (interactive)
  (if (use-region-p)
      (yantonov/yaml-indent-region (region-beginning) (region-end))
    (yaml-indent-line)))

(defun yantonov/yaml-mode-hook ()
  (define-key yaml-mode-map (kbd "C-c C-l") 'yantonov/yaml-indent))

(add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))

(add-hook 'yaml-mode-hook 'yantonov/yaml-mode-hook)

(provide 'emacs-rc-yaml-mode)
