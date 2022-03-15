(with-eval-after-load 'csv-mode
  (define-key csv-mode-map [remap weiss-indent] 'csv-align-mode)
  )

;; parent: 
(provide 'weiss_csv-mode_keybindings)
