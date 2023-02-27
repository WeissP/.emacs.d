(wks-define-key
 (current-global-map)
 "SPC "
 '(("d a" .  weiss-custom-daily-agenda)
   ("d c" .  org-roam-capture)
   ("d t" .  org-todo-list)))

(with-eval-after-load 'org
  (require 'weiss_org_quick-insert)

  (defun weiss-org-return ()
    "DOCSTRING"
    (interactive)
    (deactivate-mark)
    (call-interactively 'org-return))

  (wks-define-key
   org-mode-map ""
   '(("M-i" . org-shiftmetaleft)
     ("M-k" . org-metaup)
     ("M-j" . org-metadown)
     ("M-l" . org-shiftmetaright)
     ("M-o" . org-metaleft)
     ("M-p" . org-metaright)
     ("M-p" . org-metaright)
     ("RET" . weiss-org-return)
     ("<return>" . weiss-org-return)

     ("<shifttab>" . org-shifttab)
     ("-" . +org/dwim-at-point)
     (";" . org-insert-heading-respect-content)
     ;; ("$" . org-export-dispatch)
     ;; ("C" . org-copy-subtree)
     ("d" . weiss-org-cut-line-or-delete-region)
     ("j" . (weiss-org-next-line (next-line) (deactivate-mark)))
     ("k" . (weiss-org-previous-line (previous-line) (deactivate-mark)))
     ("t" . weiss-org-preview-latex-and-image)
     ("x" . weiss-org-exchange-point-or-switch-to-sp)
     ("X" . org-refile)

     ("C-c C-a" . weiss-org-screenshot)
     ("C-c C-M-x i" . weiss-org-insert-pdf-link)
     ("C-c C-M-x e" . weiss-org-export-to-pdf)
     ("C-c C-M-x f" . weiss-org-insert-image)
     ("C-c C-M-x u" . weiss-check-umlaut)
     ("C-c C-o" . org-noter)
     ("y d" . weiss-org-download-img)
     ("y g" . org-goto)
     ("C-c C-q" . weiss-set-org-tags)
     ("C-c C-s" . org-id-get-create)
     ("C-c C-t" . org-todo)
     ("C-c C-b" . org-mark-ring-goto)
     ("y <tab>" . org-table-create-with-table\.el)
     ("y j s" . weiss-org-copy-heading-link)
     ;; ("<f5>" . org-beamer-export-to-pdf)

     ("<escape> <escape>" . wks-org-quick-insert-keymap)))
  )

(with-eval-after-load 'org-agenda
  (wks-unset-key org-agenda-mode-map '("9" "-" "SPC"))
  (wks-define-key
   org-agenda-mode-map ""
   '(("-" . xah-backward-punct)
     ("=" . xah-forward-punct)))

  (fset 'org-agenda-done "td"))

(provide 'weiss_org_keybindings)
