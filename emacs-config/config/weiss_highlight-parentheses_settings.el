(add-hook 'prog-mode-hook #'highlight-parentheses-mode)

(with-eval-after-load 'highlight-parentheses
  (setq
   hl-paren-highlight-adjacent t
   hl-paren-colors '("#E53E3E" "#383a42" "#383a42" "#383a42")
   )
  )

;; parent: ui
(provide 'weiss_highlight-parentheses_settings)
