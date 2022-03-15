(with-eval-after-load 'flycheck-golangci-lint
  ;; (setq flycheck-golangci-lint-disable-linters '("typecheck"))
  ;; (add-hook 'go-mode-hook
  ;;           (lambda()
  ;;             (flycheck-golangci-lint-setup)
  ;;             (setq flycheck-local-checkers
  ;;                   '((lsp . ((next-checkers . (golangci-lint))))))))
  )

;; parent: 
(provide 'weiss_flycheck-golangci-lint_settings)
