(with-eval-after-load 'lsp-ui
  (define-key lsp-mode-map (kbd "M-d") #'lsp-ui-doc-show)
  )

;; parent: 
(provide 'weiss_lsp-ui_keybindings)
