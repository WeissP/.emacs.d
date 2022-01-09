(with-eval-after-load 'snails
  (setq snails-fuz-library-load-status "unload")

  (defun weiss-snails-paste ()
    "paste and convert the paste string in single line"
    (interactive)
    (call-interactively 'xah-paste-or-paste-previous)
    (save-excursion
      (goto-char (point-min))
      (while (re-search-forward "\n" nil t) (replace-match ""))))
  ;; (defvar snails-current-dir nil)
  ;; (defun weiss-snails-get-current-dir ()
  ;;   "get the path of current file"
  ;;   (interactive)
  ;;   (ignore-errors (setq snails-current-dir (expand-file-name default-directory))))
  ;; (advice-add 'snails :before 'weiss-snails-get-current-dir)

  (setq
   snails-show-with-frame nil
   snails-fame-width-proportion 0.8
   snails-default-show-prefix-tips nil
   snails-fuz-library-load-status "unload")

  (require 'snails-backend-command)
  (require 'snails-backend-buffer)
  (require 'snails-backend-projectile)
  (require 'snails-backend-imenu)
  (require 'snails-backend-directory-files)
  (require 'snails-backend-current-buffer)
  (require 'snails-backend-search-pdf)
  (require 'snails-backend-emacs-config)
  (with-eval-after-load 'org-roam (require 'snails-backend-org-roam))
  (require 'snails-backend-file-bookmark)
  (require 'snails-backend-filter-buffer)
  ;; (require 'snails-backend-recentf-weiss)
  (require 'snails-backend-rg-curdir)
  (require 'snails-backend-filter-buffer)
  (require 'snails-backend-preview)
  (require 'snails-backend-recentf-db)
  (require 'snails-backend-tab-group)

  (setq snails-prefix-backends
        '((";"
           '(snails-backend-projectile snails-backend-fd snails-backend-rg-curdir))
          (","
           '(snails-backend-imenu snails-backend-directory-files snails-backend-current-buffer))
          ("=" '(snails-backend-buffer))
          ("?" '(snails-backend-tab-group))
          (":" '(snails-backend-search-pdf))))

  (setq snails-default-backends
        '(snails-backend-preview
          snails-backend-filter-buffer
          snails-backend-recentf-db
          snails-backend-emacs-config
          snails-backend-emacs-config-new))

  (defun weiss-snails-cmds ()
    "DOCSTRING"
    (interactive)
    (snails '(snails-backend-command))
    )

  (with-eval-after-load 'snails-roam
    (setq snails-default-backends
          '(snails-backend-preview
            snails-backend-filter-buffer
            snails-backend-org-roam-new
            snails-backend-recentf-db
            snails-backend-emacs-config
            snails-backend-file-bookmark
            snails-backend-org-roam-link
            snails-backend-org-roam-focusing
            snails-backend-org-roam-uc
            snails-backend-org-roam-project
            snails-backend-org-roam-note
            snails-backend-org-roam-tutorial
            snails-backend-org-roam-all
            snails-backend-emacs-config-new)))

  )

;; parent: 
(provide 'weiss_settings<snails)
