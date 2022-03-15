(setq weiss-latex-special-markers '("$"))

(defun weiss-quick-add-latex-style-sout ()
  (interactive)
  (let ((region-string
         (if (use-region-p)
             (delete-and-extract-region (region-beginning) (region-end))
           (delete-and-extract-region (point) (+ 1 (point))))))
    (insert (format "$ \\sout{\\textrm{%s}} $" region-string))
    ))

(defun weiss--quick-add-latex-style (latex-style)
  "Quick add latex style"
  (interactive)
  (let ((region-string
         (if (use-region-p)
             (delete-and-extract-region (region-beginning) (region-end))
           (delete-and-extract-region (point) (+ 1 (point))))))
    (insert (format "\\%s{%s}" latex-style region-string))
    )
  )

(defun weiss-delete-backward-bracket-and-mark-bracket-text-latex-mode ()
  "DOCSTRING"
  (interactive)
  (cond
   ;; ((string= (char-to-string (char-before)) ">")  (delete-char -1))
   ((member (char-to-string (char-before)) weiss-latex-special-markers)
    (let ((before-point (point))
          (mark-point )
          (special-marker (char-to-string (char-before))))
      (delete-char -1)
      (when (string-match (regexp-opt (list special-marker)) (buffer-substring-no-properties (line-beginning-position) (line-end-position)))
        (if (member (char-to-string (char-before (- (point) 0))) (list " " "\n"))
            (progn (search-forward special-marker)
                   (delete-char -1)
                   (setq mark-point (- before-point 1))
                   )
          (search-backward special-marker)
          (delete-char 1)
          (setq mark-point (- before-point 2))
          )
        (push-mark mark-point)
        (setq mark-active t)
        (setq deactivate-mark nil)
        (exchange-point-and-mark)
        ))
    )
   ((member (char-to-string (char-before)) '("}" "{"))
    (if (member (char-to-string (char-before)) '("}"))
        (xah-delete-backward-bracket-text)
      (xah-delete-forward-bracket-text)
      )
    (let ((before-point (point))
          (before-char (char-before))
          )
      ;; if char-before is a-z or A-Z
      (when (or (and (> before-char 96) (< before-char 123)) (and (> before-char 64) (< before-char 91)))
        ;; 92 -> \
        (if (and (re-search-backward "[ {}+]") (eq (char-after (1+ (point))) 92))
            (kill-region (1+ (point)) before-point)
          (goto-char before-point)
          (when (eq (char-after (line-beginning-position)) 92) (kill-region (line-beginning-position) (point)))
          )
        )))
   (t (xah-delete-backward-char-or-bracket-text))
   )
  )
(defun weiss-delete-forward-bracket-and-mark-bracket-text-latex-mode ()
  "DOCSTRING"
  (interactive)
  (cond
   ;; ((string= (char-to-string (char-after)) ">")  (delete-char -1))
   ((member (char-to-string (char-after)) weiss-latex-special-markers)
    (let ((before-point (point))
          (mark-point )
          (special-marker (char-to-string (char-after))))
      (delete-char 1)
      (when (string-match (regexp-opt (list special-marker)) (buffer-substring-no-properties (line-beginning-position) (line-end-position)))
        (if (member (char-to-string (char-before (- (point) 0))) (list " " "\n"))
            (progn (search-forward special-marker)
                   (delete-char 1)
                   (setq mark-point (- before-point 1))
                   )
          (search-backward special-marker)
          (delete-char 1)
          (setq mark-point (- before-point 2))
          )
        (push-mark mark-point)
        (setq mark-active t)
        (setq deactivate-mark nil)
        (exchange-point-and-mark)
        ))
    )
   ((member (char-to-string (char-after)) '("}" "{"))
    (forward-char)
    (if (member (char-to-string (char-before)) '("}"))
        (xah-delete-backward-bracket-text)
      (xah-delete-forward-bracket-text)
      )
    (let ((before-point (point))
          (before-char (char-before))
          )
      ;; if char-after is a-z or A-Z
      (when (or (and (> before-char 96) (< before-char 123)) (and (> before-char 64) (< before-char 91)))
        ;; 92 -> \
        (if (and (re-search-backward "[ {}+]") (eq (char-after (1+ (point))) 92))
            (kill-region (1+ (point)) before-point)
          (goto-char before-point)
          (when (eq (char-after (line-beginning-position)) 92) (kill-region (line-beginning-position) (point)))
          )
        )))
   (t (xah-delete-forward-char-or-bracket-text))
   )
  )

(provide 'weiss_latex_edit)
