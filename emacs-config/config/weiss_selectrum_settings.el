;; (defun selectrum-directory--completing-file-p ()
;;   "Return non-nil when completing file names. Comes from vertico-directory"
;;   (eq 'file
;;       (completion-metadata-get
;;        (completion-metadata
;;         (buffer-substring
;;          (minibuffer-prompt-end)
;;          (max (minibuffer-prompt-end) (point)))
;;         minibuffer-completion-table
;;         minibuffer-completion-predicate)
;;        'category)))

(defun selectrum-directory-up ()
  "Delete directory before point.  Comes from vertico-directory"
  (interactive)
  (if (and
       (eq (char-before) ?/)
       (selectrum-directory--completing-file-p))
      (progn
        (goto-char (1- (point)))
        (if (eq (char-before) ?~)
            (progn
              (delete-region (1- (point)) (point-max))
              (insert (expand-file-name "~/"))
              )
          (when (search-backward "/" (minibuffer-prompt-end) t)
            (delete-region (1+ (point)) (point-max))
            t))
        (goto-char (point-max))
        )
    (delete-char -1)))

(with-eval-after-load 'selectrum (selectrum-mode +1))

;; parent: 
(provide 'weiss_selectrum_settings)
