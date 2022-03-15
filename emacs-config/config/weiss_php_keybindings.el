(with-eval-after-load 'web-mode
  (wks-define-key
   web-mode-map ""
   '(
     ("<tab>" . weiss-indent)
     ("TAB" . weiss-indent)
     ))
  )

;; parent: 
(provide 'weiss_php_keybindings)
