(with-eval-after-load 'vertico-directory
  (add-hook 'rfn-eshadow-update-overlay-hook #'vertico-directory-tidy)
  )

(provide 'weiss_vertico-directory_settings)
