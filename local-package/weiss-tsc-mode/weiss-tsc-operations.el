(defvar weiss-tsc-non-stop-chars (mapcar 'string-to-char '(" " "\n")))
(defvar weiss-tsc-ignored-node-text '("\"" "!" ","))
(setq-mode-local
 rustic-mode
 weiss-tsc-ignored-node-text '("\"" "!" "," "::")
 )

(defvar weiss-tsc-ignored-forward-char (-map #'string-to-char '(")" "]" "}")))
(defvar weiss-tsc-ignored-backward-char (-map #'string-to-char '("(" "[" "{")))

(defun weiss-tsc-find-next-named-node (start)
  "DOCSTRING"
  (interactive)
  (let* ((p start)
         (cur
          (tsc-get-descendant-for-position-range
           (tsc-root-node tree-sitter-tree)
           p p)))
    (while (not (tsc-node-named-p cur))
      (setq p (weiss-tsc-next-point (tsc-node-end-byte cur)))
      (setq cur
            (tsc-get-descendant-for-position-range
             (tsc-root-node tree-sitter-tree)
             p p)))
    cur))

(defun weiss-mark (from to)
  "DOCSTRING"
  (interactive)
  (goto-char from)
  (push-mark nil t)
  (goto-char to)
  (setq mark-active t))

(defun weiss-tsc-next-point (start)
  "DOCSTRING"
  (interactive)
  (let ((pt start)
        )
    (while (member (char-after pt) weiss-tsc-non-stop-chars)
      (setq pt (1+ pt)))
    pt))

(defun weiss-tsc-previous-point (start)
  "DOCSTRING"
  (interactive)
  (let ((pt start)
        )
    (while (member (char-after pt) weiss-tsc-non-stop-chars)
      (setq pt (- pt 1)))
    pt))

(defun weiss-tsc-ignored-p (node forward)
  "DOCSTRING"
  (interactive)
  (let* ((text (tsc-node-text node))
         (char (string-to-char text)))
    (or
     (member text weiss-tsc-ignored-node-text)
     (and
      (<= (length text) 1)
      (not (weiss-alphabet-t char))
      (if forward
          (member char weiss-tsc-ignored-forward-char)
        (member char weiss-tsc-ignored-backward-char))))))

(defun weiss-tsc-find-node-forward (from to &optional cur-p ignored)
  "DOCSTRING"
  (interactive)
  (let* ((p (or cur-p from))
         (cur
          (tsc-get-descendant-for-position-range
           (tsc-root-node tree-sitter-tree)
           p p)))
    (while (and cur
                (<= p to)
                (or
                 (not (weiss-tsc-node-in cur from to))
                 (and ignored (weiss-tsc-ignored-p cur t))))
      (setq p (weiss-tsc-next-point (+ p 1)))
      (setq cur
            (tsc-get-descendant-for-position-range
             (tsc-root-node tree-sitter-tree)
             p p)))
    (and (<= p to) cur)))

(defun weiss-tsc-in-text ()
  "DOCSTRING"
  (interactive)
  (let ((type  (tsc-node-type (tree-sitter-node-at-pos)))
        )
    (or (string= type "jsx_text")
        (string= type "string")
        (string= type "string_literal")
        (string= type "raw_string_literal")
        (string= type "line_comment")
        )    
    )
  )

(defun weiss-tsc-in-raw-text ()
  "DOCSTRING"
  (interactive)
  (let ((type  (tsc-node-type (tree-sitter-node-at-pos)))
        )
    (or 
     (string= type "raw_string_literal")
     )    
    ))

(defun weiss-tsc-find-node-backward (from to &optional cur-p ignored)
  "DOCSTRING"
  (interactive)
  (let* ((p (or cur-p to))
         (cur
          (tsc-get-descendant-for-position-range
           (tsc-root-node tree-sitter-tree)
           p p)))
    (while (and
            (>= p from)
            (or
             (not (weiss-tsc-node-in cur from to))
             (and ignored (weiss-tsc-ignored-p cur nil))))
      (setq p (weiss-tsc-previous-point (- p 1)))
      (setq cur
            (tsc-get-descendant-for-position-range
             (tsc-root-node tree-sitter-tree)
             p p)))
    (and (>= p from) cur)))

(defun weiss-tsc-node-in (node start end)
  "DOCSTRING"
  (interactive)
  (and
   (>= (tsc-node-start-byte node) from)
   (<= (tsc-node-end-byte node) to)))

(defun weiss-tsc-sort-node (x y)
  "DOCSTRING"
  (interactive)
  (let ((x-beg (tsc-node-start-position x))
        (x-end (tsc-node-end-position x))
        (y-beg (tsc-node-start-position y))
        (y-end (tsc-node-end-position y)))
    (cond
     ((and (> x-beg y-beg) (< x-end y-end))
      (list x y))
     ((and (> y-beg x-beg) (< y-end x-end))
      (list y x))
     (t nil))
    ))

(defun weiss-tsc-min-or-left-node (x y)
  "DOCSTRING"
  (interactive)
  (or (car (weiss-tsc-sort-node x y)) x)
  )

(defun weiss-tsc--continue-find-sib-p (cur sib)
  "DOCSTRING"
  (interactive)
  (and cur (or (not sib) (and (string= (tsc-node-type sib) "jsx_text") (string= (s-trim (tsc-node-text sib)) "")))))

(defun weiss-tsc-next-sib ()
  "DOCSTRING"
  (interactive)
  (let* ((cur (weiss-tsc-find-node-backward (point-min) (point)))
         (sib (tsc-get-next-sibling cur)))
    (while (and cur (not sib) )
      (setq cur (tsc-get-parent cur))
      (setq sib (tsc-get-next-sibling cur))
      (while (and sib  (string= (tsc-node-type sib) "jsx_text") (string= (s-trim (tsc-node-text sib)) ""))
        (setq sib (tsc-get-next-sibling sib)))
      )
    sib))

(defun weiss-tsc-previous-sib ()
  "DOCSTRING"
  (interactive)
  (let* ((cur (weiss-tsc-find-node-forward (point) (point-max)))
         (sib (tsc-get-prev-sibling cur)))
    (while (and cur (or (not sib) (and (eq (tsc-node-type sib) "jsx_text") (eq (s-trim (tsc-node-text sib)) ""))))
      (setq cur (tsc-get-parent cur))
      (setq sib (tsc-get-prev-sibling cur)))
    sib))

(defun weiss-tsc-print-node (node)
  "DOCSTRING"
  (interactive)
  (message "type:%s\ntext:%s" (tsc-node-type node) (tsc-node-text node)))

(defun weiss-test ()
  "DOCSTRING"
  (interactive)
  (weiss-tsc-print-node (tree-sitter-node-at-pos)))

(defun weiss-test ()
  "DOCSTRING"
  (interactive)
  (let ((cur (tree-sitter-node-at-pos))
        )
    (message "--------" )
    (weiss-tsc-print-node cur)
    (message "\n--------\n" )
    (weiss-tsc-print-node (tsc-get-next-sibling cur))    
    (message "--------" )
    )
  )

(defun weiss-test ()
  "DOCSTRING"
  (interactive)
  (weiss-tsc-print-node (tsc-get-descendant-for-position-range  (tsc-root-node tree-sitter-tree) (region-beginning) (region-end))))

(defun weiss-test ()
  "DOCSTRING"
  (interactive)
  (message "[%s]" (s-trim  (tsc-node-text (weiss-tsc-next-sib))))  )

(provide 'weiss-tsc-operations)
