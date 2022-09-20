(with-eval-after-load 'rustic
  (setq rustic-format-on-save nil
        rustic-lsp-setup-p nil
        rustic-lsp-client nil
        rustic-rustfmt-args "+nightly"
        )  

  (with-eval-after-load 'eglot
    (setq rustic-lsp-format nil
          rustic-lsp-setup-p t
          rustic-lsp-client 'eglot
          )
    )

  (with-eval-after-load 'lspce
    (add-hook 'rustic-mode-hook #'lspce-mode)
    )

  (with-eval-after-load 'lsp-mode
    (setq-default lsp-rust-analyzer-proc-macro-enable t)
    (setq-default lsp-rust-analyzer-diagnostics-disabled ["unresolved-proc-macro" "type-mismatch"])
    (setq rustic-lsp-format t
          rustic-lsp-setup-p t
          rustic-lsp-client 'lsp-mode
          )
    )
  )


(provide 'weiss_rustic_settings)
