(with-eval-after-load 'gotest
  (wks-define-key
   go-mode-map ""
   '(("C-c C-t t" . weiss-go-save-and-test)))
  (wks-unset-key go-test-mode-map '("h")))

;; parent: 
(provide 'weiss_keybindings<gotest)
