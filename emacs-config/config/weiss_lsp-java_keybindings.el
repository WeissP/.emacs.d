(with-eval-after-load 'lsp-java
  (wks-unset-key java-mode-map '("," "/" ";"))

  (wks-define-key
   java-mode-map "y"
   '(
     ;; ("t" . lsp-java-generate-to-string)
     ("s" . weiss-run-java-spring)
     ("F" . weiss-format-current-java-dir)
     ("j" . weiss-add-javadoc)
     ("e" . lsp-java-generate-equals-and-hash-code)
     ("o" . lsp-java-generate-overrides)
     ("g" . lsp-java-generate-getters-and-setters)             
     ))
  )

;; parent: lsp-mode
(provide 'weiss_lsp-java_keybindings)
