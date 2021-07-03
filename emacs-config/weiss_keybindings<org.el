(with-eval-after-load 'org
  (wks-define-key
   org-mode-map ""
   '(
     ("M-i" . org-shiftmetaleft)
     ("M-k" . org-metaup)
     ("M-j" . org-metadown)
     ("M-l" . org-shiftmetaright)
     ("M-o" . org-metaleft)
     ("M-p" . org-metaright)
     ("M-p" . org-metaright)

     ("<shifttab>" . org-shifttab)
     ("-" . +org/dwim-at-point)
     ("&" . org-insert-heading-respect-content)
     ("$" . org-export-dispatch)
     ;; ("C" . org-copy-subtree)
     ("d" . weiss-org-cut-line-or-delete-region)
     ("j" . (weiss-org-next-line (next-line) (deactivate-mark)))
     ("k" . (weiss-org-previous-line (previous-line) (deactivate-mark)))
     ("y" . weiss-org-preview-latex-and-image)
     ("n" . weiss-org-search)
     ("x" . weiss-org-exchange-point-or-switch-to-sp)
     ("X" . org-refile)

     ("t a" . weiss-org-screenshot)
     ("t o" . org-noter)
     ("t d" . weiss-org-download-img)
     ("t q" . weiss-set-org-tags)
     ("t s" . org-noter-sync-current-note)
     ("t t" . org-todo)
     ("t b" . org-mark-ring-goto)
     ("t <tab>" . org-table-create-with-table\.el)
     ("t j s" . weiss-org-copy-heading-link)

     ("<escape> <escape>" . wks-org-quick-insert-keymap)
     )
   )
  )

(with-eval-after-load 'org-agenda
  (wks-unset-key org-agenda-mode-map '("9" "-" "SPC"))
  (wks-define-key
   org-agenda-mode-map ""
   '(
     ("-" . xah-backward-punct)
     ("=" . xah-forward-punct)                  
     )
   )

  (fset 'org-agenda-done "td")
  )

(provide 'weiss_keybindings<org)