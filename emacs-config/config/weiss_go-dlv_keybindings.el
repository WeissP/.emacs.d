(with-eval-after-load 'go-dlv
  (wks-define-key
   go-mode-map ""
   '(("t f" . dlv-current-func)
     ("t p" . gud-print)
     ("t b" . gud-break)
     ("t d" . gud-remove))))

;; parent: 
(provide 'weiss_go-dlv_keybindings)
