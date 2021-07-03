(with-eval-after-load 'citre
  (dolist (x '(java-mode-hook c++-mode-hook)) 
    (add-hook x #'citre-mode)
    )
  )

;; parent: 
(provide 'weiss_hook<citre)
