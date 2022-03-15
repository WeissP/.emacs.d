(with-eval-after-load 'ivy
  (with-eval-after-load 'roam
    (add-to-list 'ivy-initial-inputs-alist '(org-roam-find-file . "^"))
    (add-to-list 'ivy-initial-inputs-alist '(org-roam-insert . "^"))
    )
  )

;; parent: org
(provide 'weiss_org-roam_ivy-inital)
