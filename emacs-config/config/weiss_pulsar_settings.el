(with-eval-after-load 'pulsar
  (pulsar-setup)

  (customize-set-variable
   'pulsar-pulse-functions ; Read the doc string for why not `setq'
   '(recenter-top-bottom
     weiss-split-or-switch-window
     switch-to-buffer
     goto-line
     ))  

  (add-function :after after-focus-change-function (lambda () (when (frame-focus-state) (pulsar-pulse-line))))

  (setq pulsar-pulse t)
  (setq pulsar-delay 0.055)
  (setq pulsar-iterations 10)
  (setq pulsar-face 'pulsar-magenta)
  )

(provide 'weiss_pulsar_settings)
