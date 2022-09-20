(with-eval-after-load 'eglot
  (wks-define-key
   eglot-mode-map
   ""
   '(
     ("C-c C-a" . eglot-code-actions)
     ("y i" . eglot-code-action-organize-imports)
     ("C-c C-d" . eldoc)
     ("C-c C-M-x r" . eglot-rename)
     ("C-c C-M-x <f5>" . eglot-reconnect)
     ))
  )

(provide 'weiss_eglot_keybindings)
