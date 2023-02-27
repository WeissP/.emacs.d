(add-to-list 'auto-mode-alist '("\\.[pP][dD][fF]\\'" . pdf-view-mode))
(add-hook 'pdf-annot-list-mode-hook #'hide-mode-line-mode)

(with-eval-after-load 'pdf-view
  (require 'pdf-tools)
  (setq-default pdf-view-display-size 'fit-page
                pdf-view-use-scaling t
                pdf-view-use-imagemagick nil)

  ;; Sets up `pdf-tools-enable-minor-modes', `pdf-occur-global-minor-mode' and
  ;; `pdf-virtual-global-minor-mode'.
  (pdf-tools-install-noverify)

  (defun weiss-pdf-view-previous-page-quickly ()
    (interactive)
    (pdf-view-previous-page-command 5))

  (defun weiss-pdf-view-next-page-quickly ()
    (interactive)
    (pdf-view-next-page-command 5))

  (setq weiss-pdf-size-factor 1.10)

  (defun weiss-pdf-view-enlarge ()
    (interactive)
    (pdf-view-enlarge weiss-pdf-size-factor))

  (defun weiss-pdf-view-shrink ()
    (interactive)
    (pdf-view-shrink weiss-pdf-size-factor))

  (defun weiss-pdf-mode-setup()
    (interactive)
    (setq-local cursor-type nil)
    (pdf-annot-minor-mode)
    )
  (add-hook 'pdf-view-mode-hook 'weiss-pdf-mode-setup)
  )

;; parent: 
(provide 'weiss_pdf-tools_settings)
