(with-eval-after-load 'go-mode
  (setq-mode-local go-mode completion-ignore-case t)
  ;; Env vars
  (with-eval-after-load 'exec-path-from-shell
    (exec-path-from-shell-copy-envs
     '("GOPATH" "GO111MODULE" "GOPROXY")))

  (setq gofmt-command "gofumpt")
  (setq gofmt-args nil)
  (setq go-command "go1.18beta1"))

(provide 'weiss_go-mode_settings)
