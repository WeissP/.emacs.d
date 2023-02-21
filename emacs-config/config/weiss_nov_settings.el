(with-eval-after-load 'nov
  (add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode))

  (defun weiss-nov-setup ()
    "DOCSTRING"
    (interactive)
    (setq nov-text-width t)
    ;; (set-background-color "#f8fd80")
    ;; (set-background-color "#eddd6e")
    (set-background-color "#edd1b0")
    (face-remap-add-relative 'variable-pitch :family "FZPingXianYaSongS-R-GB"
                             :height 1.5)

    
    (setq visual-fill-column-center-text t)
    (setq visual-fill-column-width (floor (/ (window-total-width) 1.2)))
    ;; (visual-line-mode)
    (visual-fill-column-mode)
    ;; (call-interactively 'visual-fill-column-mode)
    )

  (add-hook 'nov-mode-hook 'weiss-nov-setup)

  )

(provide 'weiss_nov_settings)
