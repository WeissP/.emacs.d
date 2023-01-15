(with-eval-after-load 'nov
  (add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode))

  (defun weiss-nov-setup ()
    "DOCSTRING"
    (interactive)
    ;; (set-background-color "#f8fd80")
    ;; (set-background-color "#eddd6e")
    (set-background-color "#edd1b0")
    (face-remap-add-relative 'variable-pitch :family "FZPingXianYaSongS-R-GB"
                             :height 1.3)
    )

  (add-hook 'nov-mode-hook 'weiss-nov-setup)

  )

(provide 'weiss_nov_settings)
