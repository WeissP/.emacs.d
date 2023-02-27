(add-hook 'org-mode-hook #'emojify-mode)
(with-eval-after-load 'emojify
  (setq emojify-emoji-styles '(unicode github))
  )

(provide 'weiss_emojify_settings)
