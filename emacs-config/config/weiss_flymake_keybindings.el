(with-eval-after-load 'flymake
  (wks-define-key
   (current-global-map)
   ""
   '(
     ("y f" . weiss-flymake-dwim)
     ("y <down>" . flymake-goto-next-error)
     ("y <up>" . flymake-goto-prev-error)
     ))
  )

(provide 'weiss_flymake_keybindings)
