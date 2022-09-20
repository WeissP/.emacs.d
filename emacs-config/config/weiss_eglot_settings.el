(with-eval-after-load 'eglot
  (add-to-list 'eglot-ignored-server-capabilities :documentHighlightProvider)
  (setq-default eglot-workspace-configuration '((:rust-analyzer . (:diagnostics (:disabled ["unresolved-proc-macro" "type-mismatch"]))))  )
  )

(provide 'weiss_eglot_settings)
