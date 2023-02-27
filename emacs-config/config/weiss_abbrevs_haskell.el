(with-eval-after-load 'haskell-mode
  (when (boundp 'haskell-mode-abbrev-table)
    (clear-abbrev-table haskell-mode-abbrev-table))
  (define-abbrev-table 'haskell-mode-abbrev-table
    '(
      ("do" "do\n  ▮" weiss--ahf)
      ("rt" "return ▮" weiss--ahf)
      ("case" "case ▮ of\n  " weiss--ahf)
      ("wh" "where\n  ▮" weiss--ahf)
      )
    )
  )

(provide 'weiss_abbrevs_haskell)
