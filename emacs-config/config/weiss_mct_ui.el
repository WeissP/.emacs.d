(with-eval-after-load 'mct
  ;; (set-face-attribute 'mct-stripe nil :background "gainsboro" :foreground "black")
  ;; (add-hook 'completion-list-mode-hook (lambda () (setq-local global-hl-line-mode nil)))
  (setq mct-apply-completion-stripes t)
  (setq mct-hide-completion-mode-line t)
  (setq mct-show-completion-line-numbers nil)
  )

(provide 'weiss_mct_ui)
