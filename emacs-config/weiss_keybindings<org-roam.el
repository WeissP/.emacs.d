(with-eval-after-load 'org-roam
  (wks-define-key
   org-mode-map "y "
   '(("i" . org-roam-insert)
     ("r" . org-roam)
     ("j t" . org-roam-tag-add)
     ("j a" . org-roam-alias-add)
     ("j n" . org-roam-capture)
     ("j f" . weiss-roam-add-focusing-tag)
     ("s" . weiss-org-roam-copy-heading-link)))

  (wks-define-key
   (current-global-map)
   "SPC "
   '(("d f" .  org-roam-goto-file)
     ("d =" .  org-roam-dailies-capture-tomorrow)
     ("d !" .  org-roam-dailies-capture-today)
     ("d /" .  org-roam-dailies-capture-date)
     ("d DEL" .  org-roam-dailies-goto-tomorrow)
     ("d &" .  org-roam-dailies-goto-today)
     ("d -" .  org-roam-dailies-goto-yesterday)
     ("d ?" .  org-roam-dailies-goto-date)))

  )

;; parent: org
(provide 'weiss_keybindings<org-roam)
