(with-eval-after-load 'sql
  ;; (wks-unset-key sql-mode-map '("y"))
  ;; (wks-define-key
  ;;  sql-mode-map ""
  ;;  '(
  ;;    ("<backtab>" . weiss-indent-paragraph)
  ;;    ("t" . weiss-sql-send-paragraph-or-region)
  ;;    )
  ;;  )

  (wks-unset-key sql-interactive-mode-map '("o"))
  (wks-define-key
   sql-interactive-mode-map
   ""
   '(
     ("<up>" . comint-previous-input)
     ))
  )

;; parent: 
(provide 'weiss_sql_keybindings)
