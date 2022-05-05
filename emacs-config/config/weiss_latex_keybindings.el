(with-eval-after-load 'tex-mode
  (wks-unset-key LaTeX-mode-map '("$" "_"))

  (wks-define-key
   latex-mode-map ""
   '(("<escape> <escape>" . wks-latex-quick-insert-keymap)
     ("<tab>" . weiss-indent)
     ("t" . weiss-latex-preview)
     ("<RET>" . weiss-deactivate-mark-and-new-line))
   )
  (wks-unset-key LaTeX-mode-map '("$" "_"))

  (wks-define-key
   LaTeX-mode-map ""
   '(("<escape> <escape>" . wks-latex-quick-insert-keymap)
     ("<tab>" . weiss-indent)
     ("t" . weiss-latex-preview)
     ("<RET>" . weiss-deactivate-mark-and-new-line))
   ))

(with-eval-after-load 'LaTeX-mode
  (wks-unset-key LaTeX-mode-map '("$" "_"))

  (wks-define-key
   LaTeX-mode-map ""
   '(("<escape> <escape>" . wks-latex-quick-insert-keymap)
     ("<tab>" . weiss-indent)
     ("t" . weiss-latex-preview)
     ("<RET>" . weiss-deactivate-mark-and-new-line))
   ))

(provide 'weiss_latex_keybindings)
