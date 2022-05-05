(with-eval-after-load 'vertico
  (setq
   vertico-resize t
   read-file-name-completion-ignore-case t
   read-buffer-completion-ignore-case t
   vertico-scroll-margin 0
   ;; (setq vertico-count 20)

   ;; Grow and shrink the Vertico minibuffer
   ;; (setq vertico-resize t)

   ;; Optionally enable cycling for `vertico-next' and `vertico-previous'.
   ;; (setq vertico-cycle t))
   )
  (vertico-mode)
  )

;; parent: 
(provide 'weiss_vertico_settings)
