(with-eval-after-load 'agda2-mode
  (require 'agda-input)
  (setq-mode-local agda2-mode completion-ignore-case t)
  (setq agda-input-user-translations '(("++" "⧺") ("<=" "≼") ))
  ;; update settings
  (agda-input-setup)
  )
(provide 'weiss_agda2-mode_settings)
