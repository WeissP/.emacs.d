(with-eval-after-load 'citre
  (wks-define-key
   citre-peek-keymap
   ""
   '(
     ("<down>" . citre-peek-next-line)
     ("<up>" . citre-peek-prev-line)
     ("<left>" . citre-peek-next-definition)
     ("<right>" . citre-peek-prev-definition)
     ("y j" . citre-peek-next-branch)
     ("y k" . citre-peek-prev-branch)
     ("y i" . citre-peek-chain-backward)
     ("y l" . citre-peek-chain-forward)
     ("y t" . citre-peek-jump)
     ))
  )

;; parent: citre
(provide 'weiss_citre-peek_keybindings)
