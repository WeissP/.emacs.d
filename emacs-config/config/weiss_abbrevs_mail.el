(when (boundp 'mail-mode-abbrev-table)
  (clear-abbrev-table mail-mode-abbrev-table))

(setq weiss-mail-abbrevs
      '(
        ("de" "Guten Tag,\n▮\n\nVielen Dank im Voraus!\n\nmit freundlichen Grüßen,\nBozhou Bai\n" weiss--ahf)    
        ("en" "Hello,\n▮\nThanks in advance!\n\nRegards,\nBozhou Bai\n" weiss--ahf)    
        ("exam" "Hello,\nI would like to register the following exam:\n\nName: ▮\nExam Date: \nExaminer: \nSection:\n\nThanks in advance!\n\nRegards,\nBozhou Bai" weiss--ahf)    
        )
      )

(define-abbrev-table 'mail-mode-abbrev-table weiss-mail-abbrevs)
(define-abbrev-table 'message-mode-abbrev-table weiss-mail-abbrevs)






(provide 'weiss_abbrevs_mail)


