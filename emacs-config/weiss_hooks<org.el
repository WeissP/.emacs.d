(add-hook 'org-indent-mode-hook
          (lambda()
            ;; WORKAROUND: Prevent text moving around while using brackets
            ;; @see https://github.com/seagle0128/.emacs.d/issues/88
            (make-variable-buffer-local 'show-paren-mode)
            (setq show-paren-mode nil)))

(add-hook 'org-mode-hook
          (lambda ()
            (if (eq major-mode 'org-mode)
                (weiss-org-sp-mode 1)
              (weiss-org-sp-mode -1)                           
              )
            (make-local-variable 'company-minimum-prefix-length)
            (setq company-minimum-prefix-length 4)
            (iimage-mode)
            (emojify-mode)
            (visual-line-mode)
            (eldoc-mode -1)
            (org-appear-mode)
            ))

(provide 'weiss_hooks<org)
