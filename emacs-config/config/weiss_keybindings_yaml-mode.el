(with-eval-after-load 'yaml-mode
  (wks-unset-key yaml-mode-map '("." "-"))
  )

(provide 'weiss_keybindings_yaml-mode)
