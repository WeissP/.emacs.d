(defun weiss-hledger-match-unknown-lines ()
  "DOCSTRING"
  (interactive)
  (list-matching-lines "unknown"))

;; To open files with .journal extension in hledger-mode
(add-to-list 'auto-mode-alist '("\\.journal\\'" . hledger-mode))

(with-eval-after-load 'hledger-mode
  ;; Provide the path to you journal file.
  ;; The default location is too opinionated.
  (setq hledger-jfile (getenv "LEDGER_FILE"))
  (add-to-list 'company-backends 'hledger-company)
  )

;; parent: 
(provide 'weiss_hledger-mode_settings)
