(with-eval-after-load 'nov
  (wks-unset-key nov-mode-map '("SPC" "l" "<end>" "i" "a"))
  (wks-unset-key nov-button-map '("SPC" "l" "<end>" "i"))

  (defun nov-scroll-lines ()
    "DOCSTRING"
    (floor (/ (window-total-height) 3)))

  (defun weiss-test ()
    "DOCSTRING"
    (interactive)
    (nov-scroll-up 5 )  )

  (wks-define-key
   nov-mode-map ""
   '(("<down>" . (weiss-nov-scroll-up (nov-scroll-up (nov-scroll-lines))))
     ("<up>" . nov-scroll-down)     
     ("," . nov-history-back)     
     ("." . nov-history-forward)     
     ))
  )

(provide 'weiss_nov_keybindings)
