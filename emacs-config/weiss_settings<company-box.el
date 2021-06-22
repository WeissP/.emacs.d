(with-eval-after-load 'company-box
  (add-hook 'company-mode-hook #'company-box-mode)

  (setq company-box-enable-icon nil)
  (setq company-box-doc-enable nil)
  (set-face-attribute 'company-tooltip-mouse nil :inherit nil :background nil :foreground nil)
  )

(provide 'weiss_settings<company-box)
