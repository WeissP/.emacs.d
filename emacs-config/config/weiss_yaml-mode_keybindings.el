(with-eval-after-load 'yaml-mode
  (wks-unset-key yaml-mode-map '("." "-"))
  )

(provide 'weiss_yaml-mode_keybindings)
