(with-eval-after-load 'latex-preview-pane
  (wks-define-key latex-mode-map ""
                  '(("C-c C-M-x l" . latex-preview-pane-mode)))
  (wks-define-key LaTeX-mode-map ""
                  '(("C-c C-M-x l" . latex-preview-pane-mode)))

  (wks-define-key latex-preview-pane-mode-map ""
                  '(("t" . latex-preview-pane-update))))

;; parent: 
(provide 'weiss_keybindings<latex-preview-pane)
