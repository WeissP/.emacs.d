(defun weiss-extract-bangou (s)
  "DOCSTRING"
  (string-match "[a-zA-Z]\\{3,5\\}-?[0-9]\\{3\\}" s)
  (ignore-errors (match-string 0 s))
  )

(defun weiss-json-to-yaml ()
  "DOCSTRING"
  (interactive)
  (let* (
         (source-path (buffer-file-name))
         (dest-path (concat (file-name-sans-extension source-path) ".yaml"))
         (yq (executable-find "yq"))
         )
    (find-file dest-path)
    ;; (message "dest-path: %s" dest-path)
    (if yq
        (call-process
         yq
         nil
         t
         t
         "-P"
         "."
         source-path
         )
      (message "program yq is not found")
      )
    )
  )

(defun weiss-alphabet-t (char)
  "DOCSTRING"
  (interactive)
  (and
   (eq (char-syntax char) ?w)
   (or (> char ?9) (< char ?1))))

(defvar weiss-num-char-alist
  (cl-mapcar
   (lambda (a b) `(,(string-to-char b) . ,a))
   (number-sequence 1 9)
   '("m" "," "." "j" "k" "l" "u" "i" "o")))

(defface weiss-num-overlay-face
  '((t (:foreground "#e45649" :background "#f0f0f0" :weight bold)))
  "Default face for number overlay")

(defvar weiss-num-overlay nil)

(defun weiss-reset-num-overlays (&rest args)
  "DOCSTRING"
  (interactive)
  (when weiss-num-overlay
    (-each weiss-num-overlay #'delete-overlay)
    (setq weiss-num-overlay nil)))

(add-hook 'deactivate-mark-hook 'weiss-reset-num-overlays)
(advice-add 'keyboard-quit :before #'weiss-reset-num-overlays)

(defun weiss-read-num (&optional ps)
  "DOCSTRING"
  (interactive)
  (weiss-reset-num-overlays)
  (let (c)
    (when ps
      (setq weiss-num-overlay
            (-map
             (lambda (p) (make-overlay p (1+ p) nil t))
             ps))
      (-each-indexed weiss-num-overlay
        (lambda (i ov)
          (overlay-put ov 'display (number-to-string (1+ i)))
          (overlay-put ov 'face 'weiss-num-overlay-face)))
      )
    (setq c (read-char "num: "))
    (weiss-reset-num-overlays)
    (if-let ((found (assoc c weiss-num-char-alist))
             )
        (cdr found)
      0)))

(defun weiss-get-parent-path (path)
  "DOCSTRING"
  (interactive)
  (let ((path (file-name-directory path))
        )
    (-as-> path v
           (directory-file-name v)
           (file-name-directory v)
           (length v)
           (substring path v (length path))
           (s-chop-suffix "/" v))))

;; https://github.com/megakorre/maps/blob/master/maps.el
(defun weiss-plist-merge (plist-a plist-b)
  (->>
   plist-b
   (-partition 2)
   (-remove
    (lambda (pair) (plist-get plist-a (car pair))))
   (-flatten-n 1 )
   (-concat plist-a )))

(defun minibuffer-directory--completing-file-p ()
  "Return non-nil when completing file names. Comes from vertico-directory"
  (eq 'file
      (completion-metadata-get
       (completion-metadata
        (buffer-substring
         (minibuffer-prompt-end)
         (max (minibuffer-prompt-end) (point)))
        minibuffer-completion-table
        minibuffer-completion-predicate)
       'category)))

(defun minibuffer-directory-up ()
  "Delete directory before point.  Comes from vertico-directory"
  (interactive)
  (if (and
       (eq (char-before) ?/)
       (minibuffer-directory--completing-file-p))
      (progn
        (goto-char (1- (point)))
        (if (eq (char-before) ?~)
            (progn
              (delete-region (1- (point)) (point-max))
              (insert (expand-file-name "~/")))
          (when (search-backward "/" (minibuffer-prompt-end) t)
            (delete-region (1+ (point)) (point-max))
            t))
        (goto-char (point-max)))
    (delete-char -1)))

;; https://emacs.stackexchange.com/questions/19877/how-to-evaluate-elisp-code-contained-in-a-string
(defun weiss-read-from-string (string)
  (eval
   (car (read-from-string (format "(progn %s)" string)))))

(defun weiss-find-definition (&optional other-window-p)
  "DOCSTRING"
  (interactive "P")
  (let (current-prefix-arg)
    (if other-window-p
        (call-interactively 'xref-find-references)
      (call-interactively 'xref-find-definitions))))

(defun weiss-find-definition ()
  "DOCSTRING"
  (interactive)
  ;; (call-interactively 'xref-find-definitions-other-window)
  (call-interactively 'xref-find-definitions))



(defun async-shell-command-no-window (command)
  (interactive)
  (let ((display-buffer-alist
         (list
          (cons
           "\\*Async Shell Command\\*.*"
           (cons #'display-buffer-no-window nil)))))
    (async-shell-command command)))

(defmacro +measure-time-1 (&rest body)
  "Measure the time it takes to evaluate BODY."
  `(let ((time (current-time)))
     ,@body
     (message "%.03fms" (* 1000 (float-time (time-since time))))))

(defmacro +measure-time (&rest body)
  "Measure the time it takes to evalutae BODY, repeat 10 times."
  `(let ((time (current-time))
         (n 10))
     (dotimes (_ n) ,@body)
     (message "%.03fms"
              (/ (* (float-time (time-since time)) 1000) n))))

;; (+measure-time (format-mode-line mode-line-format))


(defun weiss-blank-p (s)
  "DOCSTRING"
  (interactive)
  (ignore-errors (string-match-p "\\`\\s-*$" s)))

(defun weiss-line-empty-p ()
  "https://emacs.stackexchange.com/questions/16792/easiest-way-to-check-if-current-line-is-empty-ignoring-whitespace"
  (interactive)
  (weiss-blank-p (thing-at-point 'line))
  ;; (ignore-errors (string-match-p "\\`\\s-*$"))
  )

(defun weiss-simulate-c-g ()
  "DOCSTRING"
  (interactive)
  (setq unread-command-events (listify-key-sequence "\C-g")))

(defun weiss-is-today ()
  "return `t' if now is before 4AM"
  (< (string-to-number (format-time-string "%H")) 4))

;; comes from https://stackoverflow.com/questions/14489848/emacs-name-of-current-local-keymap
(defun keymap-symbol (keymap)
  "Return the symbol to which KEYMAP is bound, or nil if no such symbol exists."
  (catch 'gotit
    (mapatoms
     (lambda (sym)
       (and
        (boundp sym)
        (eq (symbol-value sym) keymap)
        (not (eq sym 'keymap))
        (throw 'gotit sym))))))

;; undo-collapse comes from
;; https://emacs.stackexchange.com/questions/7558/how-to-collapse-undo-history
(defun undo-collapse-begin ()
  "push a mark that do nothing to the undo list"
  (push (list 'apply 'identity nil) buffer-undo-list))

(defun undo-collapse-end ()
  "Collapse undo history until a matching marker."
  (let ((marker (list 'apply 'identity nil)))
    (cond
     ((equal (car buffer-undo-list) marker)
      (setq buffer-undo-list (cdr buffer-undo-list))
      ;; (message "success, car")
      )
     (t
      (let ((l buffer-undo-list)
            (limit 0))
        (while (and (not (equal (cadr l) marker)))
          (setq limit (1+ limit))
          (cond
           ((null (cdr l))
            (error "undo-collapse-end with no matching marker"))
           ((null (cadr l))
            (setf (cdr l) (cddr l)))
           (t (setq l (cdr l)))))
        (setf (cdr l) (cddr l)))))))


(defmacro with-undo-collapse (&rest body)
  "Execute body, then collapse any resulting undo boundaries."
  (declare (indent 0))
  (let ((buffer-var (make-symbol "buffer")))
    `(let ((,buffer-var
            (current-buffer)))
       (unwind-protect
           (progn (undo-collapse-begin) ,@body)
         (with-current-buffer ,buffer-var (undo-collapse-end))))))


(defun read-char-picky (prompt chars &optional inherit-input-method seconds)
  "Read characters like in `read-char-exclusive', but if input is
  not one of CHARS, return nil.  CHARS may be a list of characters,
  single-character strings, or a string of characters."
  (let ((chars
         (mapcar
          (lambda (x)
            (if (characterp x) x (string-to-char x)))
          (append chars nil)))
        (char
         (read-char-exclusive prompt inherit-input-method seconds)))
    (when (memq char chars) (char-to-string char))))

(defun weiss-read-char-picky-from-list (picky-list)
  "Get the inputed number and return the nth element of list"
  (interactive)
  (let ((ra "")
        (rb ""))
    (nth
     (-
      (string-to-number
       (read-char-picky
        (dotimes (i (length picky-list) ra)
          (setq ra (format "%s %s:%s" ra (1+ i) (nth i picky-list))))
        (dotimes (i (length picky-list) rb)
          (setq rb (format "%s%s" rb (1+ i))))))
      1)
     picky-list)))

(defun weiss-gen-random-string (len)
  "DOCSTRING"
  (interactive)
  (if (= len 0)
      ""
    (concat
     (format "%c" (+ 97 (random 25)))
     (weiss-gen-random-string (1- len)))))

(defun weiss-test ()
  "DOCSTRING"
  (interactive)
  (with-output-to-temp-buffer
      (concat "*" (weiss-gen-random-string 8))
    (print "asdf")))

(defun weiss-call-process (exe &rest args)
  "DOCSTRING"
  (interactive)
  (let ((b
         (generate-new-buffer
          (concat "*" (weiss-gen-random-string 8)))))
    (apply 'call-process exe nil b t args)
    (display-buffer b)))

(defun weiss-start-process (proc-name command)
  "DOCSTRING"
  (interactive)
  (let* ((name (concat "process:" proc-name))
         (b (generate-new-buffer name))
         ;; (default-directory "/")
         )
    (start-process-shell-command proc-name b command)
    (display-buffer b)))

(defun weiss-eval-last-sexp-this-line()
  "eval last sexp this line"
  (interactive)
  (end-of-line)
  (call-interactively 'eval-last-sexp))

(defun weiss-universal-argument ()
  "Simulate C-u"
  (interactive)
  (if current-prefix-arg
      (call-interactively 'universal-argument-more)
    (universal-argument)))

(defun weiss-show-all-major-mode ()
  "Show all major mode and it's parent mode"
  (interactive)
  (let ((mode major-mode)
        parents)
    (while mode
      (setq parents
            (cons mode parents)
            mode
            (get mode 'derived-mode-parent)))
    (message "%s" (reverse parents))))

(defun xah-show-kill-ring ()
  "Insert all `kill-ring' content in a new buffer named *copy history*.

URL `http://ergoemacs.org/emacs/emacs_show_kill_ring.html'
Version 2019-12-02"
  (interactive)
  (let (($buf (generate-new-buffer "*copy history*")))
    (progn
      (switch-to-buffer $buf)
      (funcall 'fundamental-mode)
      (dolist (x kill-ring )
        (insert x "\n\nhh=============================================================================\n\n"))
      (goto-char (point-min)))))

(defun weiss-refresh ()
  "let flycheck refresh"
  (interactive)
  (save-buffer)
  (when flycheck-mode (flycheck-buffer)))

(defun weiss-call-kmacro-multi-times ()
  "DOCSTRING"
  (interactive)
  (let ((times
         (string-to-number
          (read-string (format "Repeat Times: ") nil nil nil))))
    (dotimes (i times) (next-line) (call-last-kbd-macro))))


(defun weiss-execute-buffer ()
  "If the current buffer is elisp mode, then eval-buffer, else quickrun"
  (interactive)
  (save-buffer)
  (cond
   ((or
     (eq major-mode 'xah-elisp-mode)
     (eq major-mode 'emacs-lisp-mode))
    (eval-buffer))
   ((string=
     (file-name-directory (buffer-file-name))
     "~/KaRat/datenbank/")
    (message "compile: %s"
             (shell-command-to-string "javac -Werror -cp '.:commons-io-2.8.0.jar' QuizzesSearch.java"))
    (message "output: %s"
             (shell-command-to-string "java -cp postgresql-42.2.18.jar:commons-io-2.8.0.jar:. QuizzesSearch")))
   ((string-prefix-p "~/KaRat/datenbank/KaRat-Quizzes/"
                     (file-name-directory (buffer-file-name)))
    ;; (message ": %s" 123)
    (message "%s"
             (shell-command-to-string "go run ~/KaRat/datenbank/KaRat-Quizzes/main.go -tomlPath=~/KaRat/datenbank/KaRat-Quizzes/input.toml")))
   ((string-prefix-p "~/Documents/Vorlesungen/bachelorarbeit/JODA-Web"
                     (file-name-directory (buffer-file-name)))
    (message "%s"
             (shell-command-to-string "go run ~/Documents/Vorlesungen/bachelorarbeit/JODA-Web/cmd/joda-web/main.go")))
   ((and
     (eq major-mode 'go-mode)
     (not (string= weiss-mode-line-projectile-root-dir "nil")))
    (let ((compilation-read-command)
          )
      (call-interactively 'projectile-run-project)))
   (t (quickrun))))


(defun weiss--execute-kbd-macro (kbd-macro)
  "Execute KBD-MACRO."
  (when-let ((cmd (key-binding (read-kbd-macro kbd-macro))))
    (call-interactively cmd)))

(defun weiss-test ()
  "DOCSTRING"
  (interactive)
  (when (use-region-p)

    ))

(defun weiss-test (beg end)
  (interactive "@r")
  (narrow-to-region beg end)
  (dolist (x
           '(("←" . "<-")
             ("—" . "--")
             ("’" . "'")
             ("∶∶" . "::")
             ("⇒" . "=>")
             ("→" . "->")))
    (weiss-replace-text x))
  (widen))

(defun weiss-replace-text (old-new)
  "DOCSTRING"
  (interactive)
  (goto-char (point-min))
  (while (re-search-forward (car old-new) nil t)
    (replace-match (cdr old-new)))
  (goto-char (point-min)))

(provide 'weiss_wks_misc-function)
