(wks-define-key
 prog-mode-map
 ""
 '(("C-c C-b" . citre-jump-back)
   ("C-c C-p" . citre-peek)))

(with-eval-after-load 'citre
  (wks-define-key
   citre-peek-keymap
   ""
   '(
     ("<down>" . citre-peek-next-line)
     ("<up>" . citre-peek-prev-line)
     ("<left>" . citre-peek-next-definition)
     ("<right>" . citre-peek-prev-definition)
     ("C-c C-p" . citre-peek-through)
     ("C-c C-j" . citre-peek-next-branch)
     ("C-c C-k" . citre-peek-prev-branch)
     ("C-c C-i" . citre-peek-chain-backward)
     ("C-c C-l" . citre-peek-chain-forward)
     ("C-c C-t" . citre-peek-jump)
     ))

  )

;; parent: 
(provide 'weiss_citre_keybindings)
