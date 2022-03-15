(setq
 org-export-allow-bind-keywords t
 org-export-with-sub-superscripts nil
 org-export-preserve-breaks nil
 org-export-with-creator nil
 org-export-with-author t
 org-export-with-section-numbers 3
 org-export-with-smart-quotes t
 org-export-with-toc nil
 org-export-with-latex "imagemagick"
 org-export-with-date nil
 )

(defun weiss-org-export-to-pdf ()
  "DOCSTRING"
  (interactive)
  (deactivate-mark)
  (ignore-errors 
    (call-interactively 'save-buffer))
  (org-latex-export-to-pdf))

(with-eval-after-load 'org
  ;; Enable markdown backend
  (add-to-list 'org-export-backends 'md)
  )

(provide 'weiss_org_export)
