(defvar weiss-expand-region-stack nil)

(defun weiss-push-expand-region-stack (p)
  "DOCSTRING"
  (interactive)
  (when (> (length weiss-expand-region-stack) 10)
    (setq weiss-expand-region-stack (butlast weiss-expand-region-stack 10))  
    )
  (push p weiss-expand-region-stack)
  )

(defun weiss-exchange-point-and-select-block-backward ()
  "DOCSTRING"
  (interactive)
  (exchange-point-and-mark)
  (xah-beginning-of-line-or-block)
  )

(defun weiss-expand-region-to-line-beg-or-end ()
  "DOCSTRING"
  (interactive)
  (if (eq (point) (region-beginning))
      (beginning-of-line)
    (end-of-line)
    )
  )

(defun xah-select-current-block ()
  "Select the current block of text between blank lines.

URL `http://ergoemacs.org/emacs/modernization_mark-word.html'
Version 2017-07-02"
  (interactive)
  (progn
    (skip-chars-forward " \n\t")
    (when (re-search-backward "\n[ \t]*\n" nil "move")
      (re-search-forward "\n[ \t]*\n"))
    (push-mark (point) t t)
    (re-search-forward "\n[ \t]*\n" nil "move")))

(defun xah-select-block ()
  "Select the current/next block of text between blank lines.
If region is active, extend selection downward by block.

URL `http://ergoemacs.org/emacs/modernization_mark-word.html'
Version 2019-12-26"
  (interactive)
  (if (region-active-p)
      (re-search-forward "\n[ \t]*\n" nil "move")
    (progn
      (skip-chars-forward " \n\t")
      (when (re-search-backward "\n[ \t]*\n" nil "move")
        (re-search-forward "\n[ \t]*\n"))
      (push-mark (point) t t)
      (re-search-forward "\n[ \t]*\n" nil "move"))))

(defun weiss-region-p ()
  "DOCSTRING"
  (interactive)
  (and (use-region-p) (> (- (region-end) (region-beginning)) 0))
  )

(defun weiss-deactivate-mark ()
  "DOCSTRING"
  (interactive)
  (setq saved-region-selection nil)
  (let (select-active-regions)
    (deactivate-mark)))

(defun weiss-undo-expand-region ()
  "DOCSTRING"
  (interactive)
  (goto-char (pop weiss-expand-region-stack))
  )

(defun weiss-expand-region-by-sexp ()
  "DOCSTRING"
  (interactive)
  (weiss-push-expand-region-stack (point))
  (if (weiss-region-p)    
      (if (eq (point) (region-beginning))
          (call-interactively 'paredit-backward)
        (call-interactively 'paredit-forward))      
    (if current-prefix-arg
        (call-interactively 'paredit-backward)
      (call-interactively 'paredit-forward)
      )
    )        
  )

(defun weiss-contract-region-by-sexp ()
  "DOCSTRING"
  (interactive)
  (if (eq (point) (region-beginning))
      (call-interactively 'paredit-forward)
    (call-interactively 'paredit-backward))
  )

(defun weiss-expand-region-by-word ()
  "expand region word by word on the same side of cursor"
  (interactive)
  (weiss-push-expand-region-stack (point))
  (if (weiss-region-p)    
      (if (eq (point) (region-beginning))
          (backward-word)
        (forward-word))      
    (if current-prefix-arg
        (backward-word)
      (forward-word)
      )
    )
  )

(defun weiss-contract-region-by-word ()
  "expand region word by word on the same side of cursor"
  (interactive)
  (if (eq (point) (region-beginning))
      (forward-word)
    (backward-word))
  ) 

(defun weiss-select-line-downward ()
  "Select current line. If current line is in region && cursor at region-end, extend selection downward by line."
  (interactive)
  (weiss-select-mode-turn-on)
  (if (and (region-active-p)
           (>= (line-beginning-position) (region-beginning))
           (eq (point) (line-end-position)))
      (progn
        (forward-line 1)
        (end-of-line))
    (progn
      (end-of-line)
      (set-mark (line-beginning-position)))))

(defun weiss-select-sexp ()
  "select single sexp first and select the next wenn you call this function again"
  (interactive)
  (if (and (use-region-p)
           (not (ignore-errors (bounds-of-thing-at-point 'list))))
      (progn
        (skip-syntax-forward " <>
          ")
        ;; skip the comment
        (while (string-match "^;+.*" (buffer-substring-no-properties (line-beginning-position) (line-end-position)))
          (next-line))
        (while (ignore-errors (setq bounds (bounds-of-thing-at-point 'list)))
          (goto-char (cdr bounds))
          ))
    (weiss-select-single-sexp)
    )
  )

(defun weiss-select-single-sexp ()
  "select the biggest sexp and copy"
  (interactive)
  ;; It seems like that bounds-of-thing-at-point habe some problems with quote
  ;; (while (looking-at "[ \"]") (forward-char))
  (deactivate-mark)
  (skip-syntax-forward "\" <>
  ")
  (let ((bounds-temp)
        (bounds))
    (while (ignore-errors (setq bounds-temp (bounds-of-thing-at-point 'list)))
      (setq bounds bounds-temp)
      (goto-char (cdr bounds))
      (when (looking-at "[ \"]") (forward-char))
      )
    (push-mark (car bounds) t t)
    (setq mark-active t)
    (kill-new (buffer-substring-no-properties (region-beginning) (region-end)))
    ))

(defun xah-select-text-in-quote ()
  "Select text between the nearest left and right delimiters.
  Delimiters here includes the following chars: '\"<>(){}[]??????????????????????????????????????????????????????????????????????
  This command select between any bracket chars, not the inner text of a bracket. For example, if text is

   (a(b)c???)

   the selected char is ???c???, not ???a(b)c???.

  URL `http://ergoemacs.org/emacs/modernization_mark-word.html'
  Version 2018-10-11"
  (interactive)
  (let (
        ($skipChars "^'\"<>(){}[]????????????????????????????????????????????????????????????????????????????")
        $p1
        )
    (skip-chars-backward $skipChars)
    (setq $p1 (point))
    (skip-chars-forward $skipChars)
    (set-mark $p1)))

(provide 'weiss_select<wks)
