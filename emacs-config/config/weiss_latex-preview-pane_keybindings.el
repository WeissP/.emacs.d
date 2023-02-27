(with-eval-after-load 'latex-preview-pane
  (with-eval-after-load 'LaTeX-mode-map
    (wks-define-key LaTeX-mode-map ""
                    '(("C-c C-M-x l" . latex-preview-pane-mode)))

    (wks-define-key latex-preview-pane-mode-map ""
                    '(("t" . latex-preview-pane-update)))
    )
  ;; (wks-define-key latex-mode-map ""
  ;;                 '(("C-c C-M-x l" . latex-preview-pane-mode)))
  )

;; parent: 
(provide 'weiss_latex-preview-pane_keybindings)
