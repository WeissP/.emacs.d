(with-eval-after-load 'mustache-mode
  (wks-define-key
   mustache-mode-map ""
   '(("<RET>" . weiss-deactivate-mark-and-new-line)))
  )

(provide 'weiss_mustache-mode_keybindings)
