(with-eval-after-load 'tex-mode
  (wks-unset-key latex-mode-map '("$"))

  (wks-define-key
   latex-mode-map ""
   '(("<escape> <escape>" . wks-latex-quick-insert-keymap)
     ("<tab>" . weiss-indent)
     ("t" . weiss-org-preview-latex-and-image))
   )
  (wks-unset-key LaTeX-mode-map '("$"))

  (wks-define-key
   LaTeX-mode-map ""
   '(("<escape> <escape>" . wks-latex-quick-insert-keymap)
     ("<tab>" . weiss-indent)
     ("t" . weiss-org-preview-latex-and-image))
   ))

(with-eval-after-load 'LaTeX-mode
  (wks-unset-key LaTeX-mode-map '("$"))

  (wks-define-key
   LaTeX-mode-map ""
   '(("<escape> <escape>" . wks-latex-quick-insert-keymap)
     ("<tab>" . weiss-indent)
     ("t" . weiss-org-preview-latex-and-image))
   ))

(provide 'weiss_keybindings<latex)
