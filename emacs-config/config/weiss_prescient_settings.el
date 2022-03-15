(setq prescient-filter-method '(literal regexp initialism fuzzy))
(with-eval-after-load 'prescient
  (prescient-persist-mode 1)
  )

;; parent: counsel
(provide 'weiss_prescient_settings)
