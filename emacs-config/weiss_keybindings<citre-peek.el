(with-eval-after-load 'citre
  (wks-define-key
   citre-peek-keymap
   ""
   '(
     ("<down>" . citre-peek-next-line)
     ("<up>" . citre-peek-prev-line)
     ("<left>" . citre-peek-next-definition)
     ("<right>" . citre-peek-prev-definition)
     ("t j" . citre-peek-next-branch)
     ("t k" . citre-peek-prev-branch)
     ("t i" . citre-peek-chain-backward)
     ("t l" . citre-peek-chain-forward)
     ("t t" . citre-peek-jump)
     ))
  )

;; parent: citre
(provide 'weiss_keybindings<citre-peek)
