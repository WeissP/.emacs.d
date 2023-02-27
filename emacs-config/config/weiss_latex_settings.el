(with-eval-after-load 'latex
  (with-eval-after-load 'org
    (add-to-list 'load-language-list '(latex . t)))

  (setq reftex-label-alist
        '(("algorithm"   ?a "alg:"  "~\\ref{%s}" nil ("algo" "algorithm"   "algo.") -2)
          ))

  (setq reftex-ref-macro-prompt nil)
  (add-hook 'LaTeX-mode-hook #'reftex-mode)
  
  (setq-mode-local
   latex-mode
   company-backends
   '(company-bbdb company-semantic company-cmake company-clang company-files
                  (company-dabbrev-code company-gtags company-etags company-keywords)
                  company-oddmuse company-dabbrev))
  (add-hook 'LaTeX-mode-hook #'company-mode)

  (defun weiss-latex-preview()
    (interactive)
    "if current prefix arg, then remove all latex preview, else display all of them."
    (if current-prefix-arg
        (preview-clearout-buffer)
      (preview-buffer)))

  (defun weiss-latex-to-pdf ()
    "DOCSTRING"
    (interactive)
    (call-interactively 'save-buffer)
    (TeX-master-file nil nil t)  ;; call to ask if necessary
    (TeX-command "LaTeX" #'TeX-master-file))

  (defun weiss-insert-label ()
    "DOCSTRING"
    (interactive)
    (reftex-reference )
    )
  )

;; parent: 
(provide 'weiss_latex_settings)
