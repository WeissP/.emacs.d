(with-eval-after-load 'org
  (defun weiss-org--csv-single-line-to-table (s)
    "DOCSTRING"
    (interactive)
    (->> s
         (s-replace ";" "|" )
         (s-replace "\"" "" )
         (format "|%s|" ) 
         ))

  (defun weiss-org-csv-to-table ()
    "DOCSTRING"
    (interactive)
    (let* ((beg (region-beginning))
           (end (region-end))
           (lines (split-string (buffer-substring-no-properties beg end) "\n")))
      (delete-region beg end)
      (dolist (line lines) 
        (when (> (length line) 2)
          (insert (weiss-org--csv-single-line-to-table line))
          (insert "\n")
          )
        )    
      ))

  (defun weiss-org-cut-line-or-delete-region ()
    "DOCSTRING"
    (interactive)
    (if (use-region-p)
        (kill-region (region-beginning) (region-end) t)
      (progn
        (beginning-of-line)
        (org-kill-line)
        (kill-region (line-beginning-position) (line-beginning-position 2)))))

  (defun weiss-delete-backward-bracket-and-mark-bracket-text-org-mode ()
    "DOCSTRING"
    (interactive)
    (cond
     ((member (char-to-string (char-after)) '("<" ">"))  (delete-char -1))
     ((member (char-to-string (char-before)) weiss-org-special-markers)
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
     (t
      (xah-delete-backward-char-or-bracket-text)
      ;; (message "%s" "123")
      )
     )
    )

  (defun weiss-delete-forward-bracket-and-mark-bracket-text-org-mode ()
    "DOCSTRING"
    (interactive)
    (cond
     ((member (char-to-string (char-after)) '("<" ">"))  (delete-char 1))
     ((member (char-to-string (char-after)) weiss-org-special-markers)
      (let ((before-point (point))
            (mark-point )
            (special-marker (char-to-string (char-after))))      
        (delete-char 1)
        (when (string-match (regexp-opt (list special-marker)) (buffer-substring-no-properties (line-beginning-position) (line-end-position)))
          (if (member (char-to-string (char-before (- (point) 0))) (list " " "\n"))
              (progn (search-forward special-marker)
                     (delete-char -1)
                     (setq mark-point (- before-point 1))
                     )
            (search-backward special-marker)          
            (delete-char 1)
            (setq mark-point (- before-point 1))
            )
          (push-mark mark-point)
          (setq mark-active t)
          (setq deactivate-mark nil)
          (exchange-point-and-mark)
          ))
      )
     (t (xah-delete-forward-char-or-bracket-text))
     )
    )

  (defun weiss-delete-backward-bracket-and-text-org-mode ()
    "DOCSTRING"
    (interactive)
    (weiss-delete-backward-bracket-and-mark-bracket-text-org-mode)
    (when (use-region-p) (kill-region (region-beginning) (region-end)))
    )

  (defun weiss-delete-forward-bracket-and-text-org-mode ()
    "DOCSTRING"
    (interactive)
    (weiss-delete-forward-bracket-and-mark-bracket-text-org-mode)
    (when (use-region-p) (kill-region (region-beginning) (region-end)))
    )
  )

(provide 'weiss_org_edit)
