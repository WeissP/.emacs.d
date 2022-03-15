(with-eval-after-load 'flycheck-hledger
  ;; (require 'flycheck-hledger)
  (setq flycheck-hledger-strict nil)
  (add-hook 'ledger-mode-hook #'flycheck-mode)
)

;; parent: 
(provide 'weiss_flycheck-hledger_settings)
