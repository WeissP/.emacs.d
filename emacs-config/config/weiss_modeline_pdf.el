(with-eval-after-load 'pdf-tools
  ;; comes from doom-modeline
  (defvar-local weiss-mode-line-pdf-pages nil)
  (defun weiss-mode-line-update-pdf-pages ()
    "Update PDF pages."
    (setq weiss-mode-line-pdf-pages
          (format "  P%d/%d "
                  (eval `(pdf-view-current-page))
                  (pdf-cache-number-of-pages))))
  (add-hook 'pdf-view-change-page-hook #'weiss-mode-line-update-pdf-pages)
  ;; (remove-hook 'pdf-view-mode #'weiss-mode-line-update-pdf-pages)

  (defun weiss-mode-line-pdf-mode ()
    "DOCSTRING"
    (interactive)
    (setq mode-line-format
          `(
            "   "
            "%e" mode-line-buffer-identification "   " 
            " "
            weiss-mode-line-pdf-pages
            "   "
            (vc-mode vc-mode)
            "  " mode-line-misc-info mode-line-end-spaces
            )
          ))
  (add-hook 'pdf-view-change-page-hook #'weiss-mode-line-pdf-mode)  
  )

;; parent: ui
(provide 'weiss_modeline_pdf)
