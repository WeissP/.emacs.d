(with-eval-after-load 'org

  (wks-define-key
   org-mode-map ""
   '(("M-i" . org-shiftmetaleft)
     ("M-k" . org-metaup)
     ("M-j" . org-metadown)
     ("M-l" . org-shiftmetaright)
     ("M-o" . org-metaleft)
     ("M-p" . org-metaright)
     ("M-p" . org-metaright)

     ("<shifttab>" . org-shifttab)
     ("-" . +org/dwim-at-point)
     ("&" . org-insert-heading-respect-content)
     ;; ("$" . org-export-dispatch)
     ;; ("C" . org-copy-subtree)
     ("d" . weiss-org-cut-line-or-delete-region)
     ("j" . (weiss-org-next-line (next-line) (deactivate-mark)))
     ("k" . (weiss-org-previous-line (previous-line) (deactivate-mark)))
     ("t" . weiss-org-preview-latex-and-image)
     ;; ("n" . weiss-org-search)
     ("n" . isearch-forward)
     ("x" . weiss-org-exchange-point-or-switch-to-sp)
     ("X" . org-refile)

     ("y a" . weiss-org-screenshot)
     ("y o" . org-noter)
     ("y d" . weiss-org-download-img)
     ("y q" . weiss-set-org-tags)
     ("y s" . org-id-get-create)
     ("y t" . org-todo)
     ("y b" . org-mark-ring-goto)
     ("y <tab>" . org-table-create-with-table\.el)
     ("y j s" . weiss-org-copy-heading-link)

     ("<escape> <escape>" . wks-org-quick-insert-keymap)))

  (wks-define-key
   (current-global-map) "SPC "
   '(("d a" .  weiss-custom-daily-agenda)
     ("d c" .  org-roam-capture)
     ("d t" .  org-todo-list)))

  )

(with-eval-after-load 'org-agenda
  (wks-unset-key org-agenda-mode-map '("9" "-" "SPC"))
  (wks-define-key
   org-agenda-mode-map ""
   '(("-" . xah-backward-punct)
     ("=" . xah-forward-punct)))

  (fset 'org-agenda-done "td"))

(provide 'weiss_keybindings<org)
