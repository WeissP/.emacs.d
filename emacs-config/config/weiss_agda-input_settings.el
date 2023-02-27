(defun weiss-init-agda-input ()
  "DOCSTRING"
  (interactive)
  (require 'agda-input)
  (set-input-method "Agda")
  )

(with-eval-after-load 'agda-input
  (setq agda-input-user-translations '(("++" "⧺") ("<=" "≼") ))
)

(provide 'weiss_agda-input_settings)
