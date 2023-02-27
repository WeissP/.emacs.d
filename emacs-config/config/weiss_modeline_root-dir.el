(defvar weiss-mode-line-projectile-root-dir nil)
(make-variable-buffer-local 'weiss-mode-line-projectile-root-dir)
(defun weiss-mode-line-get-root-dir ()
  "get the parent dir of the projectile root"
  (setq
   weiss-mode-line-projectile-root-dir
   (cond
    ((file-remote-p default-directory)
     "🏠Remote"            
     )
    ((featurep 'project)
     (if-let ((r (ignore-errors (caddr (project-current)))))      
         (if (< (length r) 1) 
             ""
           (concat
            "🏠"
            (substring (file-relative-name r (file-name-directory (substring r 0 -1)))
                       0 -1))
           )             
       ""
       ))
    (t  "")         
    )        
   )
  )

(add-hook 'find-file-hook 'weiss-mode-line-get-root-dir)

;; parent: ui
(provide 'weiss_modeline_root-dir)
