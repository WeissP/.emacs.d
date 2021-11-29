(with-eval-after-load 'go-dlv
  (wks-define-key
   go-mode-map ""
   '(("t f" . dlv-current-func)
     ("t p" . gud-print)
     ("t b" . gud-break))))

;; parent: 
(provide 'weiss_keybindings<go-dlv)
