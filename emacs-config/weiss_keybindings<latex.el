(with-eval-after-load 'tex-mode
  (wks-unset-key LaTeX-mode-map '("$" "_"))

  (wks-define-key
   latex-mode-map ""
   '(("<escape> <escape>" . wks-latex-quick-insert-keymap)
     ("<tab>" . weiss-indent)
     ("t" . preview-document))
   )
  (wks-unset-key LaTeX-mode-map '("$" "_"))

  (wks-define-key
   LaTeX-mode-map ""
   '(("<escape> <escape>" . wks-latex-quick-insert-keymap)
     ("<tab>" . weiss-indent)
     ("t" . preview-document))
   ))

(with-eval-after-load 'LaTeX-mode
  (wks-unset-key LaTeX-mode-map '("$" "_"))

  (wks-define-key
   LaTeX-mode-map ""
   '(("<escape> <escape>" . wks-latex-quick-insert-keymap)
     ("<tab>" . weiss-indent)
     ("t" . preview-document))
   ))

(provide 'weiss_keybindings<latex)
