(with-eval-after-load 'vertico-directory
  (wks-define-key
   vertico-map
   ""
   '(
     ;; ( "RET" . vertico-directory-enter)
     ;; ( "<return>" . vertico-directory-enter)
     ( "DEL" . vertico-directory-delete-char)
     ( "<delete>" . vertico-directory-delete-char)))
  )


(provide 'weiss_vertico-directory_keybindings)
