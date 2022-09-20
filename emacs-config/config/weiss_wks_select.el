(defun weiss-str-indices (str p)
  "DOCSTRING"
  (interactive)
  (-as-> str l
         (split-string l  "")
         (-map-indexed
          (lambda (i x)
            `(,i .
                 ,(funcall p (string-to-char x))))
          l)
         (-filter #'cdr l)
         (-map #'car l)))

(defun weiss-indices-of-char (str char)
  "DOCSTRING"
  (interactive)
  (let ((indices nil)
        (i (cl-position char str)))
    (while i
      (push i indices)
      (setq i (cl-position char str :start (1+ (car  indices)))))
    indices))

(defun weiss-split-text (str)
  "DOCSTRING"
  (interactive)
  (cl-flet
      ((new-list
        (in p)
        (let ((l (weiss-str-indices str p))
              (start 0)
              (end (1+ (length str)))
              )
          (append
           (list in)
           (and
            (> (car l) (1+ start))
            (list start))
           l
           (and
            (< (car l) (- end 1))
            (list end)))
          )))
    (cond
     ((and (string-prefix-p "\"" str) (string-suffix-p "\"" str))
      (list nil 1 (length str)))
     ((string-match " " str)
      (new-list nil (lambda (x) (eq x 32))))
     ((string-match "-" str)
      (new-list nil (lambda (x) (eq x 45))))
     ((string-match "_" str)
      (new-list nil (lambda (x) (eq x 95))))
     ((string-match "/" str)
      (new-list nil (lambda (x) (eq x 47))))
     ((-any?
       (lambda (x)
         (let ((c (string-to-char x)))
           (and (>= c 65) (<= c 90))))
       (split-string str ""))
      (new-list t
                (lambda (c)
                  (and (>= c 65) (<= c 90)))))
     (t (ignore)))))

(defun weiss-split-region (&optional idx)
  "DOCSTRING"
  (interactive)
  (let* ((rb (region-beginning))
         (re (region-end))
         (backward (eq (point) rb))
         (indices-raw
          (weiss-split-text (buffer-substring-no-properties rb re)))
         (offset-left (if (car indices-raw) -1 0))
         (offset-right -1)
         (indices (if backward (cdr indices-raw) (reverse (cdr indices-raw))))
         (i))
    (message "indices: %s" indices)
    (setq i
          (cond
           ((< (length indices) 2)
            nil)
           ((= (length indices) 2)
            0)
           (idx idx)
           (t
            (min
             (-
              (weiss-read-num
               (-map
                (lambda (i) (+ rb i offset-left))
                (if backward
                    (-drop-last 1 indices)
                  (-drop 1 indices))))
              1)
             (- (length indices) 2)))))

    (when i
      (if backward
          (weiss-mark
           (+ rb offset-left (nth i indices))
           (+ rb offset-right (nth (1+ i) indices)))
        (weiss-mark
         (+ rb offset-right (nth i indices))
         (+ rb offset-left (nth (1+ i) indices)))))))

(defun weiss-split-region-first ()
  "DOCSTRING"
  (interactive)
  (weiss-split-region 0))

(defvar weiss-expand-region-stack nil)

(defun weiss-push-expand-region-stack (p)
  "DOCSTRING"
  (interactive)
  (when (> (length weiss-expand-region-stack) 10)
    (setq weiss-expand-region-stack
          (butlast weiss-expand-region-stack 10)))
  (push p weiss-expand-region-stack))

(defun weiss-exchange-point-and-select-block-backward ()
  "DOCSTRING"
  (interactive)
  (exchange-point-and-mark)
  (xah-beginning-of-line-or-block))

(defun weiss-expand-region-to-line-beg-or-end ()
  "DOCSTRING"
  (interactive)
  (if (eq (point) (region-beginning))
      (beginning-of-line)
    (end-of-line)))

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
  (and
   (use-region-p)
   (> (- (region-end) (region-beginning)) 0)))

(defun weiss-deactivate-mark ()
  "DOCSTRING"
  (interactive)
  (setq saved-region-selection nil)
  (let (select-active-regions) (deactivate-mark)))

(defun weiss-undo-expand-region ()
  "DOCSTRING"
  (interactive)
  (goto-char (pop weiss-expand-region-stack)))

(defun weiss-expand-region-by-sexp ()
  "DOCSTRING"
  (interactive)
  (weiss-push-expand-region-stack (point))
  (if (weiss-region-p)
      (if (eq (point) (region-beginning))
          (call-interactively 'weiss-backward-sexp)
        (call-interactively 'weiss-forward-sexp))
    (if current-prefix-arg
        (call-interactively 'weiss-backward-sexp)
      (call-interactively 'weiss-forward-sexp))))

(defun weiss-contract-region-by-sexp ()
  "DOCSTRING"
  (interactive)
  (if (eq (point) (region-beginning))
      (call-interactively 'weiss-puni-backward-sexp)
    (call-interactively 'weiss-puni-backward-sexp)))

(defun weiss-expand-region-by-word ()
  "expand region word by word on the same side of cursor"
  (interactive)
  (weiss-push-expand-region-stack (point))
  (if (weiss-region-p)
      (if (eq (point) (region-beginning))
          (backward-word)
        (forward-word))
    (if current-prefix-arg (backward-word) (forward-word))))

(defun weiss-contract-region-by-word ()
  "expand region word by word on the same side of cursor"
  (interactive)
  (if (eq (point) (region-beginning))
      (forward-word)
    (backward-word)))

(defun weiss-select-line-downward ()
  "Select current line. If current line is in region && cursor at region-end, extend selection downward by line."
  (interactive)
  (weiss-select-mode-turn-on)
  (if (and
       (region-active-p)
       (>= (line-beginning-position) (region-beginning))
       (eq (point) (line-end-position)))
      (progn (forward-line 1) (end-of-line))
    (progn (end-of-line) (set-mark (line-beginning-position)))))

(defun weiss-select-sexp ()
  "select single sexp first and select the next wenn you call this function again"
  (interactive)
  (if (and
       (use-region-p)
       (not (ignore-errors (bounds-of-thing-at-point 'list))))
      (progn
        (skip-syntax-forward " <>
          ")
        ;; skip the comment
        (while (string-match "^;+.*"
                             (buffer-substring-no-properties
                              (line-beginning-position)
                              (line-end-position)))
          (next-line))
        (while (ignore-errors
                 (setq bounds (bounds-of-thing-at-point 'list)))
          (goto-char (cdr bounds))))
    (weiss-select-single-sexp)))

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
    (while (ignore-errors
             (setq bounds-temp (bounds-of-thing-at-point 'list)))
      (setq bounds bounds-temp)
      (goto-char (cdr bounds))
      (when (looking-at "[ \"]") (forward-char)))
    (push-mark (car bounds) t t)
    (setq mark-active t)
    (kill-new
     (buffer-substring-no-properties (region-beginning) (region-end)))))

(defun xah-select-text-in-quote ()
  "Select text between the nearest left and right delimiters.
  Delimiters here includes the following chars: '\"<>(){}[]“”‘’‹›«»「」『』【】〖〗《》〈〉〔〕（）
  This command select between any bracket chars, not the inner text of a bracket. For example, if text is

   (a(b)c▮)

   the selected char is “c”, not “a(b)c”.

  URL `http://ergoemacs.org/emacs/modernization_mark-word.html'
  Version 2018-10-11"
  (interactive)
  (let (($skipChars "^'\"<>(){}[]“”‘’‹›«»「」『』【】〖〗《》〈〉〔〕（）〘〙")
        $p1)
    (skip-chars-backward $skipChars)
    (setq $p1 (point))
    (skip-chars-forward $skipChars)
    (set-mark $p1)))

(provide 'weiss_wks_select)
