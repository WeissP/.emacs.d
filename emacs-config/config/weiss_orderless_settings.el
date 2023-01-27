(with-eval-after-load 'orderless
  (setq orderless-component-separator 'orderless-escapable-split-on-space)
  (setq completion-styles '(orderless basic)
        completion-category-overrides '((file (styles basic partial-completion))))
  )

;; parent: 
(provide 'weiss_orderless_settings)
