(with-eval-after-load 'vertico
  (setq vertico-resize t
        read-file-name-completion-ignore-case t
        read-buffer-completion-ignore-case t)
  (vertico-mode)
)

;; parent: 
(provide 'weiss_vertico_settings)
