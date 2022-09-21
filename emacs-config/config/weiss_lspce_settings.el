(add-to-list 'load-path "~/.emacs.d/site-lisp/lspce/")

(with-eval-after-load 'lspce
  (setq lspce-server-programs `(("rustic-mode"  "rust-analyzer" "" "")
                                ("python-mode" "pyright-langserver" "--stdio" "")
                                ))
  )

(provide 'weiss_lspce_settings)
