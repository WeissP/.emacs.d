(wks-define-key
 (current-global-map)
 "SPC "
 '(
   ("l p" .  ejc-get-temp-editor-buffer)
   ))

(with-eval-after-load 'ejc-sql  
  (wks-define-key
   sql-mode-map
   "SPC "
   '(
     ("j t" .  ejc-describe-table)
     ))

  (wks-unset-key ejc-sql-mode-keymap '("."))

  (wks-unset-key sql-mode-map '("t"))
  (wks-define-key
   sql-mode-map ""
   '(
     ("<backtab>" . weiss-indent-paragraph)
     ("t c" . ejc-connect)
     ("t e" . ejc-get-temp-editor-buffer)
     ("t t" . ejc-describe-table)
     )
   )
  )

(provide 'weiss_ejc-sql_keybindings)
