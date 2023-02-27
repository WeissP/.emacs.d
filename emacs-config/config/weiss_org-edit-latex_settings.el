(add-hook 'org-mode-hook #'org-edit-latex-mode)
(with-eval-after-load 'org-edit-latex
  (setq org-edit-latex-create-master nil)
)

(provide 'weiss_org-edit-latex_settings)
