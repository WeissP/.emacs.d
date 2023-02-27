(add-hook 'company-mode-hook #'company-box-mode)
(with-eval-after-load 'company-box
  (setq company-box-enable-icon nil)
  (setq company-box-doc-enable nil)
  (setq company-box-show-single-candidate t)
  )

(provide 'weiss_company-box_settings)
