(with-eval-after-load 'citre
  (let ((key-command '(
                       ("t t" . citre-jump)
                       ("t b" . citre-jump-back)
                       ("t p" . citre-peek)
                       )))
    (wks-define-key java-mode-map "" key-command)
    (wks-define-key c++-mode-map "" key-command)
    )

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

;; parent: 
(provide 'weiss_keybindings<citre)
