(setq mail-user-agent 'sendmail-user-agent)
(setq mail-self-blind t)
(setq mail-archive-file-name (expand-file-name "~/Documents/personal/sent_emails"))
(setq user-full-name "Bozhou Bai")
(setq user-mail-address "bai@rhrk.uni-kl.de")
(setq message-send-mail-function 'smtpmail-send-it
      smtpmail-stream-type 'ssl
      smtpmail-smtp-server "smtp.uni-kl.de"
      smtpmail-smtp-service 465)


(provide 'weiss_email_settings)
