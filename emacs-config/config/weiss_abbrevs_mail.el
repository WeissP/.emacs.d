(when (boundp 'mail-mode-abbrev-table)
  (clear-abbrev-table mail-mode-abbrev-table))

(define-abbrev-table 'mail-mode-abbrev-table
  '(
    ("de" "Guten Tag,\n▮\n\nVielen Dank im Voraus!\n\nmit freundlichen Grüßen,\nBozhou Bai\n" weiss--ahf)    
    ))

(provide 'weiss_abbrevs_mail)


