(with-eval-after-load 'json-mode
  (wks-define-key json-mode-map ""
                  '(
                    ("<tab>" . json-mode-beautify)
                    ))
  )

(provide 'weiss_json-mode_keybindings)
