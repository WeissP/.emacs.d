(with-eval-after-load 'agda2-mode
  (when (boundp 'agda2-mode-abbrev-table)
    (clear-abbrev-table agda2-mode-abbrev-table))

  (define-abbrev-table 'agda2-mode-abbrev-table
    '(
      ("with" "with ▮... | xx " weiss--ahf)
      ))
  )

(provide 'weiss_abbrevs_agda-mode)

