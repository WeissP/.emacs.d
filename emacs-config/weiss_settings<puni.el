(with-eval-after-load 'puni
  (defun puni--backward-char-with-spaces ()
    "Go backward a char and return the point.
If there are spaces before the cursor, go over them first."
    (puni--backward-syntax " ")
    (condition-case _
        (progn (forward-char -1) (point))
      (error nil)))

  (defun puni--bounds-of-sexp-at-point ()
    "Bounds of sexp at point."
    (save-excursion
      (let ((end (or (puni-strict-forward-sexp) (point)))
            (beg (or (puni-strict-backward-sexp) (point))))
        (cons beg end))))

  (defun puni--bounds-of-sexps-around-point ()
    "Bounds of sexps around point.
The beginning of them is where `puni-beginning-of-sexp' takes you
to, and the end is where `puni-end-of-sexp' takes you to."
    (save-excursion
      (let ((beg (progn (puni-beginning-of-sexp) (point)))
            (end (progn (puni-end-of-sexp) (point))))
        (cons beg end))))

  (defun puni--find-bigger-balanced-region (beg end)
    "Find a bigger balanced region than the one between BEG and END.
When such a region can't be found, return (BEG . END)."
    (let ((new-beg beg)
          new-end done err)
      (save-excursion
        (while (and (not done) (not err))
          (goto-char new-beg)
          (setq new-end (puni-strict-forward-sexp))
          (if (and new-end (> new-end end))
              (setq done t)
            (setq new-beg
                  (progn
                    (goto-char new-beg)
                    (puni--backward-char-with-spaces)))
            (unless new-beg (setq err t))))
        (if (and done (not err))
            (cons new-beg new-end)
          (cons beg end)))))

  (defun puni--set-region (beg end)
    "Set and active a region between BEG and END.
The default behavior is to mark at BEG and goto END.  If there's
already an active region, and the mark is at the end of it, mark
END and goto BEG."
    (if (and
         (use-region-p)
         (> (mark) (point)))
        (progn (set-mark end) (goto-char beg) (activate-mark))
      (set-mark beg)
      (goto-char end)
      (activate-mark)))

  (defun puni--expand-region (beg end)
    "Expand balanced region between BEG and END."
    (pcase-let* ((`(,sexp-beg . ,sexp-end)
                  (save-excursion
                    (goto-char beg)
                    (puni--bounds-of-sexp-at-point)))
                 (`(,sexps-beg . ,sexps-end)
                  (save-excursion
                    (goto-char beg)
                    (puni--bounds-of-sexps-around-point))))
      (cond
       ((<= beg sexps-beg)
        (let ((region (puni--find-bigger-balanced-region beg end)))
          (puni--set-region (car region) (cdr region))))
       ((and (< sexps-beg beg) (<= beg sexp-beg))
        (puni--set-region sexps-beg sexps-end))
       ;; (> beg sexp-beg)
       (t (puni--set-region sexp-beg sexp-end)))))

  (defun puni-expand-region ()
    "Select current sexp, or expand the selection after that."
    (interactive)
    (if (use-region-p)
        (puni--expand-region (region-beginning) (region-end))
      (pcase-let ((`(,sexp-beg . ,sexp-end)
                   (puni--bounds-of-sexp-at-point)))
        (if (eq sexp-beg sexp-end)
            (puni--expand-region sexp-beg sexp-end)
          (puni--set-region sexp-beg sexp-end)))))

  (defun weiss-puni--empty-sexp-p ()
    "DOCSTRING"
    (interactive)
    (let ((r (puni--bounds-of-sexp-at-point))
          )
      (eq (car r) (cdr r))))

  (defun weiss-puni-delete-bigger-balanced-region ()
    "DOCSTRING"
    (interactive)
    (let ((r (puni--find-bigger-balanced-region (point) (point))))
      (delete-region (car r) (cdr r))))

  (defun weiss-puni-kill-line ()
    "Kill a line forward while keeping expressions balanced.
If nothing can be deleted, kill backward.  If still nothing can
be deleted, kill the pairs around point."
    (interactive)
    (if (use-region-p)
        (kill-region (region-beginning) (region-end))
      (let ((forward-line
             (lambda ()
               (if (eolp) (forward-char) (end-of-line))))
            (backward-line
             (lambda ()
               (if (bolp) (forward-char -1) (beginning-of-line)))))
        (and
         (or
          (puni-soft-delete-by-move forward-line 'strict-sexp 'beyond 'kill)
          (puni-soft-delete-by-move backward-line 'strict-sexp 'beyond 'kill)
          (save-excursion
            (let (beg end)
              (when (setq beg (puni-up-list 'backward))
                (setq end (puni-strict-forward-sexp)))
              (when (and beg end) (puni-delete-region beg end 'kill)))))
         ;; We can't reindent after this, or we'll have trouble inside the
         ;; beginning spaces in a line.
         )))))



;; parent: 
(provide 'weiss_settings<puni)
