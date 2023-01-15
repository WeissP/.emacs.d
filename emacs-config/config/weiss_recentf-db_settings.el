(defun weiss-insert-file-to-recentf ()
  "DOCSTRING"
  (interactive)
  (when-let ((name (buffer-file-name)))
    (call-process
     "~/rust/recentf/recentf"
     nil
     0
     t
     "add"
     name
     )
    )  
  )

(add-hook 'find-file-hook 'weiss-insert-file-to-recentf)

;; parent: 
(provide 'weiss_recentf-db_settings)
