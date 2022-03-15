(with-eval-after-load 'haskell-mode
  (with-eval-after-load 'hasky-stack
    (wks-define-key
     haskell-mode-map
     ""
     '(
       ("y e" . hasky-stack-execute)
       ))
    )
  )

;; parent: 
(provide 'weiss_hasky-stack_settings)
