;; ctags --languages=c,c++,... --kinds-all='*' --fields='*' --extras='*' -R

(with-eval-after-load 'citre
  (setq
   citre-completion-case-sensitive nil
   citre-project-root-function #'projectile-project-root
   citre-enable-xref-integration t
   )
  )

;; parent: 
(provide 'weiss_settings<citre)
