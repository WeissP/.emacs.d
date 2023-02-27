(with-eval-after-load 'go-mode
  (wks-define-key
     go-mode-map ""
     '(("C-c C-t t" . weiss-go-save-and-test))))

(with-eval-after-load 'gotest
  (wks-unset-key go-test-mode-map '("h")))

;; parent: 
(provide 'weiss_gotest_keybindings)
