(with-eval-after-load 'ledger-mode
  (wks-define-key
   ledger-mode-map
   ""
   '(("<tab>" . save-buffer)
     ))
  )

(provide 'weiss_ledger-mode_keybindings)
