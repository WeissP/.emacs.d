(dolist (x
         '(prog-mode-hook conf-mode-hook eshell-mode-hook org-mode-hook))
  (add-hook x #'company-mode))

(with-eval-after-load 'company
  (add-hook 'company-mode-hook #'company-tng-mode)
  (setq
   company-tng-auto-configure nil
   company-frontends
   '(company-tng-frontend
     company-pseudo-tooltip-frontend
     company-echo-metadata-frontend)
   company-begin-commands
   '(self-insert-command
     delete-backward-char
     org-self-insert-command
     org-delete-backward-char
     weiss-disable-abbrev-and-activate-insert-mode
     kill-line
     weiss-delete-forward-with-region
     weiss-delete-backward-with-region
     weiss-cut-line-or-delete-region
     delete-backward-char
     weiss-before-insert-mode)
   company-idle-delay 0.1
   company-tooltip-limit 10
   company-tooltip-align-annotations t
   company-tooltip-width-grow-only t
   company-tooltip-idle-delay 0.1
   company-minimum-prefix-length 3
   company-dabbrev-downcase nil
   company-abort-manual-when-too-short t
   company-require-match nil
   company-global-modes
   '(not dired-mode dired-sidebar-mode)
   company-tooltip-margin 1)

  ;; (setq company-backends '((company-capf company-citre :separate)))

  (setq-mode-local
   org-mode
   company-backends
   '(company-bbdb company-semantic company-cmake company-clang company-files
                  (company-dabbrev-code company-gtags company-etags company-keywords)
                  company-oddmuse company-dabbrev))

  (setq-mode-local
   agda2-mode
   company-backends
   '(company-bbdb company-semantic company-cmake company-clang company-files
                  (company-dabbrev-code company-gtags company-etags company-keywords)
                  company-oddmuse company-dabbrev))

  (setq-mode-local
   nix-mode
   company-backends
   '(
     company-nixos-options
     company-nix
     company-dabbrev company-bbdb company-oddmuse company-eclim company-semantic company-xcode company-cmake company-capf company-files
     (company-dabbrev-code company-gtags company-etags company-keywords))
   )

  (defun weiss-company-select-next-or-toggle-main-frame ()
    "DOCSTRING"
    (interactive)
    (if wks-vanilla-mode
        (company-complete-common-or-cycle 1)
      (weiss-switch-to-otherside-top-frame)))
  (defun weiss-company-select-previous-other-window ()
    "DOCSTRING"
    (interactive)
    (if wks-vanilla-mode
        (company-select-previous)
      (weiss-switch-buffer-or-otherside-frame-without-top)))
  )

(provide 'weiss_company_settings)
