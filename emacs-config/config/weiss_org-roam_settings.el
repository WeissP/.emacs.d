(setq
 org-roam-v2-ack t
 org-roam-tag-separator ";"
 org-roam-directory "/home/weiss/Documents/Org-roam/"
 org-roam-dailies-directory "daily/"
 org-agenda-files `(,(concat org-roam-directory org-roam-dailies-directory))
 )

(with-eval-after-load 'org-roam
  (org-roam-setup)
  (require 'org-roam-protocol)
  )

;; parent: org
(provide 'weiss_org-roam_settings)
