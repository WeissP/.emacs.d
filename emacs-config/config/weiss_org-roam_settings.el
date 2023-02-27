(setq
 org-roam-v2-ack t
 org-roam-tag-separator ";"
 org-roam-directory "~/Documents/Org-roam/"
 org-roam-dailies-directory "daily/"
 org-agenda-files `(,(concat org-roam-directory org-roam-dailies-directory))
 )

(with-eval-after-load 'org
  (require 'org-roam)
  )

(with-eval-after-load 'org-roam
  (org-roam-setup)
  (require 'org-roam-protocol)
  )



(provide 'weiss_org-roam_settings)
