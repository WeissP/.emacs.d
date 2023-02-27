(wks-define-key
 (current-global-map)
 "SPC "
 '(("d f" .  org-roam-goto-file)
   ("d =" .  org-roam-dailies-capture-tomorrow)
   ("d :" .  org-roam-dailies-capture-today)
   ("d /" .  org-roam-dailies-capture-date)
   ("d DEL" .  org-roam-dailies-goto-tomorrow)
   ("d &" .  org-roam-dailies-goto-today)
   ("d -" .  org-roam-dailies-goto-yesterday)
   ("d ?" .  org-roam-dailies-goto-date)))

(with-eval-after-load 'org
  (wks-define-key
   org-mode-map "C-c "
   '(("C-i" . org-roam-node-insert)
     ))

  (wks-define-key
   org-mode-map "y j "
   '(
     ("t" . org-roam-tag-add)
     ("a" . org-roam-alias-add)
     ("n" . org-roam-capture)
     ("f" . weiss-roam-add-focusing-tag)
     ("TAB" . org-roam-buffer-toggle)
     ))
  )

;; parent: org
(provide 'weiss_org-roam_keybindings)
