(with-eval-after-load 'citre
  (wks-define-key
   (current-global-map)
   ""
   '(("y b" . citre-jump-back)
     ("y p" . citre-peek)))

  (wks-define-key
   citre-peek-keymap
   ""
   '(
     ("<down>" . citre-peek-next-line)
     ("<up>" . citre-peek-prev-line)
     ("<left>" . citre-peek-next-definition)
     ("<right>" . citre-peek-prev-definition)
     ("y p" . citre-peek-through)
     ("y j" . citre-peek-next-branch)
     ("y k" . citre-peek-prev-branch)
     ("y i" . citre-peek-chain-backward)
     ("C-c C-l" . citre-peek-chain-forward)
     ("C-c C-t" . citre-peek-jump)
     ))

  )

;; parent: 
(provide 'weiss_citre_keybindings)
