(with-eval-after-load 'gotest
  (defun weiss-go-save-and-test ()
    "DOCSTRING"
    (interactive)
    (save-buffer)
    (call-interactively 'go-test-current-test)
    )
  )

;; parent: 
(provide 'weiss_gotest_settings)
