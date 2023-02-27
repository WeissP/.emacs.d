(defun weiss-puni-kill-line ()
  "Kill a line forward while keeping expressions balanced.
If nothing can be deleted, kill backward.  If still nothing can be
deleted, kill the pairs around point."
  (interactive)
  (if (use-region-p)
      (kill-region (region-beginning) (region-end))
    (if (weiss-blank-p
         (buffer-substring-no-properties
          (point)
          (line-end-position)))
        (puni-backward-kill-line)
      (puni-kill-line))
    (when (weiss-line-empty-p) (delete-blank-lines))))

(defun weiss-puni-forward-sexp ()
  "DOCSTRING"
  (interactive)
  (unless (puni-strict-forward-sexp) (up-list)))

(defun weiss-puni-backward-sexp ()
  "DOCSTRING"
  (interactive)
  (unless (puni-strict-backward-sexp) (backward-up-list)))

(provide 'weiss_puni_settings)
