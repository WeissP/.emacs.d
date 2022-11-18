(with-eval-after-load 'org-noter
  (wks-unset-key org-noter-doc-mode-map '("i"))
  (define-key org-noter-notes-mode-map [remap xref-find-definitions] #'org-noter-sync-current-note)
  (wks-define-key
   org-noter-doc-mode-map
   ""
   '(
     ("x" . (weiss-org-noter-insert-note (org-noter-insert-precise-note t)))
     ))
  )

(provide 'weiss_org-noter_keybindings)
