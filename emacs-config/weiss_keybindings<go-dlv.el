(with-eval-after-load 'go-dlv
  (wks-define-key go-mode-map "" '(("t f" . dlv-current-func))))

;; parent: 
(provide 'weiss_keybindings<go-dlv)
