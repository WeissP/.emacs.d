(with-eval-after-load 'dante
  (wks-define-key dante-mode-map ""
                  '(
                    ("SPC , e" . dante-eval-block)
                    ))
  )

(provide 'weiss_dante_keybindings)
