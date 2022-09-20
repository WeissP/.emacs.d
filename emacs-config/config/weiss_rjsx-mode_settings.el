(with-eval-after-load 'rjsx-mode
  ;; (add-to-list 'auto-mode-alist '("app\\.js\\'" . rjsx-mode))
  ;; (add-to-list 'auto-mode-alist '("index\\.js\\'" . rjsx-mode))
  (add-hook 'rjsx-mode-hook #'eglot)
  )

(provide 'weiss_rjsx-mode_settings)
