(defvar wks-switch-state-hook nil)

(setq wks-vanilla-mode-map (make-sparse-keymap))
(set-keymap-parent wks-vanilla-mode-map wks-vanilla-keymap)

(wks-define-key
 wks-vanilla-mode-map
 ""
 '(("<end>" . wks-vanilla-mode-disable)
   ("ß" . self-insert-command)
   ("`" . self-insert-command)
   ("S-<dead-grave>" . (weiss-insert-backquote (insert "`")))
   ("<left>" . left-char)
   ("<right>" . right-char)
   ;; ("<down>" . next-line)
   ;; ("<up>" . previous-line)
   ))

(defvar wks-vanilla-black-list '(citre-create-tags-file))

(defun wks-vanilla-bind-keymap ()
  "DOCSTRING"
  (interactive)
  (setq-local wks-vanilla-mode-map
              (cond
               ((eq major-mode 'snails-mode)
                wks-snails-vanilla-mode-map)
               (t wks-vanilla-mode-map))))

(defun wks-vanilla-mode-enable ()
  "DOCSTRING"
  (interactive)
  (deactivate-mark)
  (cond
   (current-prefix-arg (insert " ") (left-char))
   ((derived-mode-p 'prog-mode)
    (if (and
         (ignore-errors (weiss-line-empty-p))
         (not (member major-mode '(sql-mode))))
        (ignore-errors (indent-according-to-mode)))))
  (wks-vanilla-bind-keymap)
  (wks-vanilla-mode 1))

(defun wks-vanilla-mode-disable ()
  "DOCSTRING"
  (interactive)
  (wks-vanilla-mode -1))

(defun wks-vanilla-mode-init ()
  "DOCSTRING"
  ()
  (wks-vanilla-mode-enable))

(defun wks-vanilla-mode-auto-enable (&rest args)
  "DOCSTRING"
  (interactive)
  ;; (message "last-command: %s" last-command)
  ;; (message "real-last-command: %s" real-last-command)
  ;; (message "this-command: %s" this-command)
  ;; (message "real-this-command: %s" real-this-command)
  (unless (member real-this-command wks-vanilla-black-list)
    (wks-vanilla-mode 1)
    (wks-vanilla-bind-keymap)))

(dolist (x '(snails-mode-hook minibuffer-setup-hook))

  (add-hook x #'wks-vanilla-mode-auto-enable))

(defun weiss-command-mode-p ()
  "DOCSTRING"
  (interactive)
  (not wks-vanilla-mode))

(define-minor-mode wks-vanilla-mode
  "insert mode"
  :keymap wks-vanilla-mode-map
  (if wks-vanilla-mode
      (progn
        (setq minor-mode-overriding-map-alist
              (assq-delete-all 'wks-vanilla-mode minor-mode-overriding-map-alist))
        (push
         `(wks-vanilla-mode . ,wks-vanilla-mode-map)
         minor-mode-overriding-map-alist)
        (run-hooks 'wks-switch-state-hook))
    (run-hooks 'wks-switch-state-hook)))

;; parent: 
(provide 'weiss_wks_wks-vanilla-mode)