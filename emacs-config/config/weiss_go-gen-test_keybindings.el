(with-eval-after-load 'go-mode
  (wks-define-key go-mode-map "" '(("C-c C-t g" . go-gen-test-dwim))))

(provide 'weiss_go-gen-test_keybindings)
