(setq weiss-mail-abbrevs
      '(
        ("de" "Guten Tag,\n▮\n\nVielen Dank im Voraus!\n\nmit freundlichen Grüßen,\nBozhou Bai\n" weiss--ahf)    
        ("en" "Hello,\n▮\nThanks in advance!\n\nRegards,\nBozhou Bai\n" weiss--ahf)    
        ("exam" "Hello,\nI would like to register the following exam:\n\nName: ▮\nExam Date: \nExaminer: \nSection:\n\nThanks in advance!\n\nRegards,\nBozhou Bai 413125" weiss--ahf)    
        )
      )

(with-eval-after-load 'mail-mode
  (when (boundp 'mail-mode-abbrev-table)
    (clear-abbrev-table mail-mode-abbrev-table))
  (define-abbrev-table 'mail-mode-abbrev-table weiss-mail-abbrevs)
  )

(with-eval-after-load 'message-mode
  (when (boundp 'message-mode-abbrev-table)
    (clear-abbrev-table message-mode-abbrev-table))
  (define-abbrev-table 'message-mode-abbrev-table weiss-mail-abbrevs)
  )

(provide 'weiss_abbrevs_mail)


