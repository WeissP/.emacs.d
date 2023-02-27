(defvar weiss/org-file-path "~/Documents/OrgFiles/")
(defvar weiss/org-img-path "~/Documents/Org-roam/Bilder/")
(defun weiss--get-org-file-path (path)
  "get org-file path according to weiss/org-file-path"
  (interactive)
  (concat weiss/org-file-path path))

(with-eval-after-load 'org
  (setq
   ;; org-stored-links t
   org-imenu-depth 10
   org-startup-with-inline-images nil
   org-src-preserve-indentation t
   org-directory weiss/org-file-path
   org-extend-today-until 4
   org-cycle-max-level 15
   org-catch-invisible-edits 'smart
   org-latex-prefer-user-labels t
   org-goto-interface 'outline-path-completion
   )
  )

;; parent: 
(provide 'weiss_org_settings)
