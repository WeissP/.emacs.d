(with-eval-after-load 'snails
  (setq snails-fuz-library-load-status "unload")

  (defun weiss-snails-paste ()
    "paste and convert the paste string in single line"
    (interactive)
    (call-interactively 'xah-paste-or-paste-previous)
    (save-excursion
      (goto-char (point-min))
      (while (re-search-forward "\n" nil t) (replace-match ""))))

  (setq
   snails-show-with-frame nil
   snails-fame-width-proportion 0.8
   snails-default-show-prefix-tips nil
   snails-fuz-library-load-status "unload")

  (require 'snails-backend-buffer)
  (require 'snails-backend-search-pdf)
  (require 'snails-backend-emacs-config)
  (with-eval-after-load 'org-roam (require 'snails-backend-org-roam))  
  (require 'snails-backend-filter-buffer)  
  (require 'snails-backend-recentf-db)
  (require 'snails-backend-tab-group)

  (setq snails-prefix-backends
        '(("=" '(snails-backend-buffer))
          ("?" '(snails-backend-file-group snails-backend-tab-group))
          (":" '(snails-backend-search-pdf))))

  (setq snails-default-backends
        '(snails-backend-filter-buffer
          snails-backend-recentf-db
          snails-backend-emacs-configs
          snails-backend-emacs-config-new))


  (defun weiss-test ()
    "DOCSTRING"
    (interactive)
    (snails '(snails-backend-emacs-configs)))

  (with-eval-after-load 'snails-roam
    (setq snails-default-backends
          (append snails-default-backends 
                  '(snails-backend-org-roam-link
                    snails-backend-org-roam-focusing
                    snails-backend-org-roam-uc
                    snails-backend-org-roam-project
                    snails-backend-org-roam-note
                    snails-backend-org-roam-tutorial
                    snails-backend-org-roam-all
                    snails-backend-org-roam-new
                    ))))

  )

;; parent: 
(provide 'weiss_snails_settings)
