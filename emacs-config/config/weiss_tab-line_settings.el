;; (name . group)
(defconst weiss-tab-groups-file "~/.emacs.d/tab-groups.el")
(defvar weiss-tab-groups nil)
(defvar weiss-file-groups nil)

;; (frame . name)
(defvar weiss-tab-group-name-per-frame nil)

(defun weiss-load-file-groups ()
  "DOCSTRING"
  (interactive)
  (ignore-errors (load weiss-tab-groups-file)))


(defun weiss-tab-bind-group (group-name)
  "DOCSTRING"
  (interactive "sGroup Name: ")
  (let ((elem `(,(selected-frame) . ,group-name))
        )
    (weiss-tab-unbind-group)
    (if weiss-tab-group-name-per-frame
        (add-to-list 'weiss-tab-group-name-per-frame elem)
      (push elem weiss-tab-group-name-per-frame))
    (unless (plist-member weiss-tab-groups (intern group-name))
      (setq weiss-tab-groups
            (plist-put weiss-tab-groups (intern group-name) nil)))))

(defun weiss-tab-get-current-group-name ()
  "DOCSTRING"
  (interactive)
  (cdr (assoc (selected-frame) weiss-tab-group-name-per-frame)))

(defun weiss-tab-unbind-group ()
  "DOCSTRING"
  (interactive)
  ;; (message "unbind: %s" (selected-frame))
  (assq-delete-all (selected-frame) weiss-tab-group-name-per-frame))

(defun weiss-tab-to-file-groups (tab-groups)
  "DOCSTRING"
  (interactive)
  (-map-indexed
   (lambda (idx elem)
     (if (eq (% idx 2) 0)
         elem
       (when elem
         (mapcar (lambda (x) (buffer-file-name x)) elem))))
   tab-groups))

(defun weiss-load-file-group-to-tab (key)
  "DOCSTRING"
  (interactive)
  (thread-last key
               (intern)
               (plist-get weiss-file-groups )
               (mapcar 'find-file-noselect)
               (plist-put weiss-tab-groups (intern key))
               (setq weiss-tab-groups)))

(defun weiss-file-groups-to-file (file-groups)
  "DOCSTRING"
  (interactive)
  (write-region
   (format
    "\n(setq weiss-file-groups '%s)"
    (-map-indexed
     (lambda (idx elem)
       (if (eq (% idx 2) 0)
           (format "%s" elem)
         (if elem
             (format
              "(%s)"
              (mapconcat (lambda (x) (format "\"%s\"" x)) elem " "))
           "nil")))
     file-groups))
   nil weiss-tab-groups-file))

(defun weiss-dump-tab-groups ()
  "DOCSTRING"
  (interactive)
  (weiss-load-file-groups)
  (->
   weiss-tab-groups
   (weiss-tab-to-file-groups )
   (weiss-plist-merge  weiss-file-groups)
   (weiss-file-groups-to-file))
  (weiss-load-file-groups))

(defun weiss-add-buffer-to-tab-group ()
  "DOCSTRING"
  (interactive)
  (if-let ((group-name (weiss-tab-get-current-group-name))
           )
      (let* ((name-symbol (intern group-name))
             (b (current-buffer))
             (g (plist-get weiss-tab-groups name-symbol)))
        (setq weiss-tab-groups
              (plist-put weiss-tab-groups name-symbol
                         (add-to-list 'g b))))
    (message "Please first bind current frame to a group!")))

(defun weiss-tab-remove-current-buffer ()
  "DOCSTRING"
  (interactive)
  (let ((n (intern (weiss-tab-get-current-group-name)))
        (g (weiss-tab-get-current-group)))
    (setq
     weiss-tab-groups
     (plist-put weiss-tab-groups n
                (seq-filter
                 (lambda (x)
                   (and
                    (buffer-live-p x)
                    (not (eq (current-buffer) x))))
                 g)))))

(defun weiss-tab-remove-killed-buffer ()
  "DOCSTRING"
  (interactive)
  (setq weiss-tab-groups
        (mapcar
         (lambda (e)
           (if (listp e)
               (seq-filter
                (lambda (x)
                  (and
                   (buffer-live-p x)
                   (not (eq (current-buffer) x))))
                e)
             e))
         weiss-tab-groups)))

(add-hook 'kill-buffer-hook #'weiss-tab-remove-killed-buffer)

(defun weiss-tab-next ()
  "DOCSTRING"
  (interactive)
  (let* ((g (weiss-tab-get-current-group))
         (first-elem (car g))
         (last-elem (car (last g)))
         (b (current-buffer)))
    (cond
     ((eq b last-elem)
      (switch-to-buffer first-elem))
     ((member (current-buffer) g)
      (tab-line-switch-to-next-tab))
     (t (switch-to-buffer first-elem)))))

(defun weiss-tab-prev ()
  "DOCSTRING"
  (interactive)
  (let* ((g (weiss-tab-get-current-group))
         (first-elem (car g))
         (last-elem (car (last g)))
         (b (current-buffer)))
    (cond
     ((eq b first-elem)
      (switch-to-buffer last-elem))
     ((member (current-buffer) g)
      (tab-line-switch-to-prev-tab))
     (t (switch-to-buffer last-elem)))))

(defun weiss-tab-get-current-group ()
  "DOCSTRING"
  (interactive)
  (when-let ((name (weiss-tab-get-current-group-name)))
    (plist-get weiss-tab-groups (intern name))))

(defun weiss-tab-line-tabs-function ()
  "DOCSTRING"
  (interactive)
  (if-let ((r (weiss-tab-get-current-group)))
      r
    '("no group")))

(with-eval-after-load 'tab-line
  (setq tab-line-tabs-function 'weiss-tab-get-current-group)
  (global-tab-line-mode)
  )

;; parent: 
(provide 'weiss_tab-line_settings)
