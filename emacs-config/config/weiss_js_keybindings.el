(with-eval-after-load 'js-format
  (wks-define-key js-mode-map ""
                  '(
                    ("<tab>" . js-format-buffer)
                    ))
  )

;; parent: 
(provide 'weiss_js_keybindings)
