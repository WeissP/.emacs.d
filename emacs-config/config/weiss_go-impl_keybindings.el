(with-eval-after-load 'go-mode
  (wks-define-key go-mode-map "" '(("t i" . go-impl)))
  )

(provide 'weiss_go-impl_keybindings)
