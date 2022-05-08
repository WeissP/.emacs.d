(with-eval-after-load 'citre
  (setq
   citre-completion-case-sensitive nil
   citre-project-root-function #'projectile-project-root
   citre-enable-xref-integration nil
   )
  )

;; parent: 
(provide 'weiss_citre_settings)
