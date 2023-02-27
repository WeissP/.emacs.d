(with-eval-after-load 'eshell-mode
  (when (boundp 'eshell-mode-abbrev-table)
    (clear-abbrev-table eshell-mode-abbrev-table))

  (define-abbrev-table 'eshell-mode-abbrev-table
    '(
      ("mm" "module load maple/latest")
      )
    )
  )

(provide 'weiss_abbrevs_eshell)
