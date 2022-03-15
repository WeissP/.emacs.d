(with-eval-after-load 'lsp-haskell
  (add-hook 'haskell-mode-hook #'lsp)
  (setq haskell-literate-mode-hook nil)
  (add-hook 'haskell-literate-mode-hook #'lsp)
  (setq lsp-haskell-formatting-provider "brittany")
  ;; (setq lsp-haskell-server-path "/usr/bin/haskell-language-server-8.10.4")
  (setq lsp-haskell-ghcide-on nil)
  )

;; parent: 
(provide 'weiss_lsp-mode_lsp-haskell)
