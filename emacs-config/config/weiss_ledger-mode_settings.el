(with-eval-after-load 'ledger-mode
  ;; Required to use hledger instead of ledger itself.
  (setq ledger-mode-should-check-version nil
        ledger-report-links-in-register nil
        ledger-binary-path "hledger")
  (add-to-list 'auto-mode-alist '("\\.journal\\'" . ledger-mode)))

;; parent: 
(provide 'weiss_ledger-mode_settings)
