(with-eval-after-load 'wdired
  (wks-define-key
   wdired-mode-map ""
   '(
     ("C-q" . weiss-exit-wdired-mode)
     )
   )
  )

;; parent: dired
(provide 'weiss_wdired_keybindings)
