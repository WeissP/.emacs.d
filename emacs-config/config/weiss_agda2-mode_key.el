(with-eval-after-load 'agda2-mode
  (wks-define-key
   agda2-mode-map
   ""
   '(
     ("t j" . agda2-next-goal)
     ("t k" . agda2-previous-goal)
     ("t ," . agda2-goal-and-context)
     ("t r" . agda2-refine)
     ("t a" . agda2-auto-maybe-all)
     ))
  )

(provide 'weiss_agda2-mode_key)
