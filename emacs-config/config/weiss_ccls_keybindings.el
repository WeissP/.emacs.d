(with-eval-after-load 'ccls
  (wks-unset-key c-mode-map '("," "/"))
  (wks-unset-key c++-mode-map '("," "/"))
  )

;; parent: lsp-mode
(provide 'weiss_ccls_keybindings)
