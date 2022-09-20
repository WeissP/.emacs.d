(with-eval-after-load 'citre

  ;; (add-hook 'find-file-hook #'citre-auto-enable-citre-mode)

  (with-eval-after-load 'cc-mode (require 'citre-lang-c))
  (with-eval-after-load 'dired (require 'citre-lang-fileref))

  ;; (dolist (x '(rustic-mode-hook java-mode-hook c++-mode-hook))
  ;;   (add-hook x #'citre-auto-enable-citre-mode)
  ;;   )
  )

;; parent: 
(provide 'weiss_citre_hook)
