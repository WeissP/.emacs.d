(setq recentf-executable
      (or (executable-find "recentf") "~/rust/recentf/recentf"))

(defun weiss-insert-file-to-recentf ()
  "DOCSTRING"
  (interactive)
  (ignore-errors
    (when-let ((name (buffer-file-name)))
      (call-process
       recentf-executable
       nil
       0
       t
       "add"
       name
       )
      ))  
  )

(add-hook 'find-file-hook 'weiss-insert-file-to-recentf)

;; parent: 
(provide 'weiss_recentf-db_settings)
