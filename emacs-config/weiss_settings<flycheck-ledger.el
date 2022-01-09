(with-eval-after-load 'flycheck-ledger
  (add-hook 'ledger-mode-hook #'flycheck-mode)
  (setq flycheck-ledger-executable "hledger")
)

;; parent: 
(provide 'weiss_settings<flycheck-ledger)
