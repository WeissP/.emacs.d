(with-eval-after-load 'notmuch
  (defun weiss-notmuch-tree (&optional query query-context target buffer-name
			                           open-target unthreaded parent-buffer oldest-first)
    "Always set oldest-first to t"
    (interactive)
    (unless query
      (setq query (notmuch-read-query (concat "Notmuch "
					                          (if unthreaded "unthreaded " "tree ")
					                          "view search: "))))
    (notmuch-tree query query-context target buffer-name
		          open-target unthreaded parent-buffer t)
    )

  (setq notmuch-saved-searches
        `(
          (:name " " :query "tag:unread AND is:inbox AND NOT is:unimportant" :key ,(kbd "n") :search-type tree :sort-order oldest-first)
          (:name " " :query "tag:unread AND is:inbox AND is:unimportant AND NOT is:newsletter" :key ,(kbd "u") :search-type tree :sort-order oldest-first)
          (:name " " :query "is:newsletter" :key ,(kbd "r") :search-type tree :count-query "is:newsletter AND is:unread" :sort-order newest-first)
          (:name " RPTU" :query "tag:RPTU AND is:inbox AND NOT is:unimportant" :key ,(kbd "i r") :search-type tree :sort-order newest-first)
          (:name " RPTU_CS" :query "tag:RPTU_CS AND is:inbox AND NOT is:unimportant" :key ,(kbd "i c") :search-type tree :sort-order newest-first)
          (:name " WebDE" :query "tag:WebDE AND is:inbox AND NOT is:unimportant" :key ,(kbd "i w") :search-type tree :sort-order newest-first)
          (:name " 163" :query "tag:163 AND is:inbox AND NOT is:unimportant" :key ,(kbd "i m") :search-type tree :sort-order newest-first)
          (:name " Gmail" :query "tag:gmail AND is:inbox AND NOT is:unimportant" :key ,(kbd "i g") :search-type tree :sort-order newest-first)
          ))

  (setq notmuch-show-empty-saved-searches t)

  (defun weiss-notmuch-read ()
    "DOCSTRING"
    (interactive)
    (notmuch-tree-tag (list "-unread"))
    )

  (defun weiss-notmuch-next (&rest args)
    "DOCSTRING"
    (interactive)
    (call-interactively 'notmuch-tree-next-matching-message)  
    )
  (advice-add 'weiss-notmuch-read :after #'weiss-notmuch-next)

  )

(provide 'weiss_notmuch_settings)
