(with-eval-after-load 'peep-dired
  (setq
   peep-dired-cleanup-on-disable t
   peep-dired-ignored-extensions nil
   peep-dired-max-size (* 10 1024 1024)))

;; parent: 
(provide 'weiss_peep-dired_settings)
