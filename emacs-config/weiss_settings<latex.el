(with-eval-after-load 'org
  (add-to-list 'load-language-list '(latex . t))
  )

(with-eval-after-load 'latex
  (setq-mode-local
   latex-mode
   company-backends
   '(company-bbdb company-semantic company-cmake company-clang company-files
                  (company-dabbrev-code company-gtags company-etags company-keywords)
                  company-oddmuse company-dabbrev))
  (add-hook 'LaTeX-mode-hook #'company-mode)
  )

;; parent: 
(provide 'weiss_settings<latex)
