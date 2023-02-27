(add-hook 'org-mode-hook #'org-appear-mode)
(with-eval-after-load 'org-appear
  (setq
   org-appear-autolinks t
   org-appear-trigger 'always
   )
)

(provide 'weiss_org-appear_settings)
