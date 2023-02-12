(with-eval-after-load 'mu4e
  (setq
   mu4e-sent-folder   "/sent"       ;; folder for sent messages
   mu4e-drafts-folder "/drafts"     ;; unfinished messages
   mu4e-trash-folder  "/trash"      ;; trashed messages
   mu4e-refile-folder "/archive")   ;; saved messages

  (setq mu4e-get-mail-command "mbsync RPTU")
  )

(provide 'weiss_mu4e_settings)
