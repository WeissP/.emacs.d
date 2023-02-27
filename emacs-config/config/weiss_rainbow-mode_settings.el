(add-hook 'prog-mode #'rainbow-mode)

(with-eval-after-load 'rainbow-mode
  (setq
   rainbow-html-colors nil
   rainbow-html-colors nil
   rainbow-r-colors nil
   rainbow-x-colors nil
   rainbow-ansi-colors nil
   rainbow-latex-colors nil
   rainbow-r-colors-alist nil
   )
  )

;; parent: 
(provide 'weiss_rainbow-mode_settings)
