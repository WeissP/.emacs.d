(with-eval-after-load 'rustic
  (wks-define-key
   rustic-mode-map ""
   '(("C-c C-t t" . rustic-cargo-current-test)))
  )

(provide 'weiss_rustic_keybindings)
