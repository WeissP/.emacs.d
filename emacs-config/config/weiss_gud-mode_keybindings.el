(with-eval-after-load 'gud
  (wks-define-key
   gud-mode-map ""
   '(("TAB" . gud-next)
     ("<tab>" . gud-next))))

;; parent: 
(provide 'weiss_gud-mode_keybindings)
