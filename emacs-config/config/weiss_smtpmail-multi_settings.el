(with-eval-after-load 'smtpmail-multi
  (setq send-mail-function (quote smtpmail-multi-send-it))
  (setq message-send-mail-function (quote smtpmail-multi-send-it))
  
  (setq smtpmail-multi-accounts
        '(
          (webde . ("WeissBai@web.de"
                    "smtp.web.de"
                    587
                    nil
                    starttls nil nil nil))
          (uni-kl . ("bai@rhrk.uni-kl.de"
                     "smtp.uni-kl.de"
                     465
                     nil
                     ssl nil nil nil))
          (cs-uni-kl . ("b_bai19@cs.uni-kl.de"
                        "smtp.uni-kl.de"
                        587
                        nil
                        starttls nil nil nil))
          )
        )
  
  (setq smtpmail-multi-associations  '(("WeissBai@web.de" webde)
                                       ("bai@rhrk.uni-kl.de" uni-kl)
                                       ("b_bai19@cs.uni-kl.de" cs-uni-kl)))
  
  )

(provide 'weiss_smtpmail-multi_settings)
