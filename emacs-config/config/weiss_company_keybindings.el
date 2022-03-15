(with-eval-after-load 'company
  (wks-define-key
   company-active-map ""
   '(;; ("<tab>" . company-complete-common-or-cycle)
     ;; ("TAB" . company-complete-common-or-cycle)
     ;; ("<right>" . company-complete-common-or-cycle)
     ;; ("@" . company-complete-common-or-cycle)
     ("<down>" . company-complete-common-or-cycle)
     ("C-M-S-s-j" . weiss-company-select-next-or-toggle-main-frame)
     ("C-M-S-s-k" .
      (weiss-company-select-previous
       (company-complete-common-or-cycle -1)))
     ;; ("<escape>" . nil)
     ;; ("<return>" . nil)
     ;; ("RET" . nil)
     ;; ("SPC" . nil)
     ))

  (wks-unset-key company-active-map
                 '("<escape>" "RET" "<return>" "SPC" "<tab>" "TAB"))

  ;; (define-key company-active-map (kbd "<tab>") #'company-complete-common-or-cycle)
  ;; (define-key company-active-map (kbd "TAB") #'company-complete-common-or-cycle)
  ;; (define-key company-active-map (kbd "9") #'weiss-company-select-next-or-toggle-main-frame)
  ;; (define-key company-active-map (kbd "8") #'(lambda () (interactive) (company-complete-common-or-cycle -1)))
  ;; (define-key company-active-map (kbd "<escape>") nil)
  ;; (define-key company-active-map (kbd "RET") nil)
  ;; (define-key company-active-map (kbd "<return>") nil)
  ;; (define-key company-active-map (kbd "SPC") nil)
  )

(provide 'weiss_company_keybindings)
