(with-eval-after-load 'hledger-mode
  (wks-define-key hledger-mode-map ""
                  '(("C-c C-k" . weiss-hledger-match-unknown-lines))))

;; parent: 
(provide 'weiss_hledger-mode_keybindings)
