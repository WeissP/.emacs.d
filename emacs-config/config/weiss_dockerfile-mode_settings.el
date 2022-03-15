(with-eval-after-load 'dockerfile-mode
  (setq-mode-local dockerfile-mode completion-ignore-case t)
  (add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode))
  )

;; parent: 
(provide 'weiss_dockerfile-mode_settings)
