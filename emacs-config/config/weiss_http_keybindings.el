(with-eval-after-load 'http-mode
  (wks-define-key  http-mode-map ""
                   '(
                     ("<escape> <escape>" . wks-http-quick-insert-keymap)
                     )
                   )
  )

(with-eval-after-load 'mhtml-mode
  (wks-unset-key mhtml-mode-map '("ß"))
  (wks-define-key mhtml-mode-map ""
                  '(
                    ("<tab>" . weiss-indent)
                    ("y s" . weiss-run-java-spring)
                    ))
  )



;; parent: 
(provide 'weiss_http_keybindings)
