(with-eval-after-load 'org
  (setq
   org-export-allow-bind-keywords t
   org-export-with-sub-superscripts nil
   org-export-preserve-breaks t
   org-export-with-creator nil
   org-export-with-author t
   org-export-with-section-numbers 5
   org-export-with-smart-quotes t
   org-export-with-toc nil
   org-export-with-latex "imagemagick"
   org-export-with-date nil
   org-latex-caption-above nil
   )

  (defun weiss-org-export-to-pdf ()
    "DOCSTRING"
    (interactive)
    (deactivate-mark)
    (ignore-errors 
      (call-interactively 'save-buffer))
    (org-latex-export-to-pdf))
  )

(provide 'weiss_org_export)
