(with-eval-after-load 'doom-themes
  (if weiss-dumped-p 
    (enable-theme 'doom-one-light)
  (load-theme 'doom-one-light t)
  ))

(setq inhibit-startup-screen t)

;; parent: 
(provide 'weiss_settings<ui)
