(with-eval-after-load 'citre
  (defun company-citre (-command &optional -arg &rest _ignored)
    "Completion backend of Citre.  Execute COMMAND with ARG and IGNORED."
    (interactive (list 'interactive))
    (cl-case -command
      (interactive (company-begin-backend 'company-citre))
      (prefix
       (and
        (bound-and-true-p citre-mode)
        (or (citre-get-symbol) 'stop)))
      (meta (citre-get-property 'signature -arg))
      (annotation (citre-capf--get-annotation -arg))
      (candidates
       (all-completions -arg (citre-capf--get-collection -arg)))
      (ignore-case (not citre-completion-case-sensitive))))

  (setq company-backends
        '((company-capf company-citre :separate)))
  )

;; parent: 
(provide 'weiss_citre_company)
