(with-eval-after-load 'weiss_after-dump-misc
  (add-hook 'python-mode-hook '(lambda ()
                                 (face-remap-add-relative
                                  'font-lock-variable-name-face
                                  '((:foreground "#383a42" :underline t))
                                  font-lock-variable-name-face)
                                 (face-remap-add-relative
                                  'default
                                  '((:weight normal))
                                  )))
  
  )

;; parent: ui
(provide 'weiss_python<font-lock-face)
