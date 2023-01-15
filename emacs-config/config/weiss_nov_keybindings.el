(with-eval-after-load 'nov
  (wks-unset-key nov-mode-map '("SPC" "l" "<end>" "i"))
  (wks-unset-key nov-button-map '("SPC" "l" "<end>" "i"))

  (wks-define-key
   nov-mode-map ""
   '(("<down>" . nov-scroll-up)
     ("<up>" . nov-scroll-down)     
     ("," . nov-history-back)     
     ("." . nov-history-forward)     
     ))
  )

(provide 'weiss_nov_keybindings)
