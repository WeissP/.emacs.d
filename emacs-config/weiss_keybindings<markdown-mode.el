(with-eval-after-load 'markdown-mode
  (wks-define-key
   markdown-mode-map ""
   '(
     ("y" . markdown-toggle-inline-images)
     )
   )
  )

(provide 'weiss_keybindings<markdown-mode)
