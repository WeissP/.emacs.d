(setq mail-user-agent 'message-user-agent)
(setq user-mail-address "WeissBai@web.de")
(setq user-full-name "Bozhou.Bai")
(setq message-send-mail-function 'smtpmail-send-it
      smtpmail-stream-type 'starttls
      smtpmail-smtp-server "smtp.web.de"
      smtpmail-smtp-service 587)


(provide 'weiss_email_settings)
