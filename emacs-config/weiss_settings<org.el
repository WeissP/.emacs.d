(defvar weiss/org-file-path "/home/weiss/Documents/OrgFiles/")
(defvar weiss/org-img-path "/home/weiss/Documents/Org-roam/Bilder/")
(defun weiss--get-org-file-path (path)
  "get org-file path according to weiss/org-file-path"
  (interactive)
  (concat weiss/org-file-path path))

(setq
 ;; org-stored-links t
 org-startup-with-inline-images t
 org-src-preserve-indentation t
 org-directory weiss/org-file-path
 org-extend-today-until 4
 org-cycle-max-level 15
 org-catch-invisible-edits 'smart)

;; parent: 
(provide 'weiss_settings<org)
