(defun weiss-insert-file-to-recentf ()
  "DOCSTRING"
  (interactive)
  (call-process
   "/home/weiss/weiss/recentf/recentf"
   nil
   0
   t
   "add"
   (buffer-file-name)
   )
  )
;; (weiss-call-process "/home/weiss/weiss/recentf/recentf" "prefixed-search" "txt")
(defun recentf-db-add-bookmark (new-priority)
  "DOCSTRING"
  (interactive (list (read-string (format "set new priority(current value is %s): " (recentf-db-get-priority)) )))
  (call-process
   "/usr/bin/bb"
   nil
   0
   ;; '(:file "/home/weiss/Downloads/log.txt")
   "-f"
   "/home/weiss/clojure/recentf-db/insert.clj"
   (buffer-file-name)
   new-priority          
   )
  )

(defun recentf-db-get-priority ()
  "DOCSTRING"
  (interactive)
  (string-to-number
   (shell-command-to-string (format
                             "/usr/bin/bb -f '/home/weiss/clojure/recentf-db/get-priority.clj' '%s'"
                             (buffer-file-name))))
  )


(add-hook 'find-file-hook 'weiss-insert-file-to-recentf)

;; parent: 
(provide 'weiss_recentf-db_settings)
