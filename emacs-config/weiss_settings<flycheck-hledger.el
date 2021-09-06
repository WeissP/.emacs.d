(with-eval-after-load 'flycheck-hledger
  ;; (require 'flycheck-hledger)
  (setq flycheck-hledger-strict nil)
  (add-hook 'hledger-mode-hook #'flycheck-mode)
)

;; parent: 
(provide 'weiss_settings<flycheck-hledger)
