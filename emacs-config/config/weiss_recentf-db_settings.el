(defun weiss-insert-file-to-recentf ()
  "DOCSTRING"
  (interactive)
  (call-process
   "~/weiss/recentf/recentf"
   nil
   0
   t
   "add"
   (buffer-file-name)
   )
  )

(add-hook 'find-file-hook 'weiss-insert-file-to-recentf)

;; parent: 
(provide 'weiss_recentf-db_settings)
