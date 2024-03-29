(column-number-mode 1)

(setq-default mode-line-format
              `(
                " "
                (:eval (if wks-vanilla-mode
                           (concat "<"
                                   (propertize "I" 'face
                                               '(:foreground "red" :weight bold))
                                   ">"
                                   )
                         "<C>"
                         ))
                "   "
                mode-line-mule-info mode-line-modified mode-line-remote
                "   "
                (,line-number-mode "L%l/")
                (,line-number-mode weiss-mode-line-buffer-line-count)
                (,column-number-mode (5 " C%c "))        
                ;; weiss-mode-line-flycheck-errors
                "   "
                weiss-mode-line-projectile-root-dir
                "   "
                "%e" mode-line-buffer-identification "   " 
                ;; weiss-mode-line-git
                (vc-mode vc-mode)
                "  " mode-line-modes mode-line-misc-info mode-line-end-spaces
                ))

;; parent: ui
(provide 'weiss_modeline_settings)

