(with-eval-after-load 'org
  (wks-define-key
   org-mode-map ""
   '(
     ("C-c C-M-x l" . weiss-org-ref-insert-labels)
     ("C-c C-M-x c" . org-ref-insert-link))))

(provide 'weiss_org-ref_keybindings)
