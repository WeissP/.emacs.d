;; (with-eval-after-load 'doom-themes
;;   (if weiss-dumped-p 
;;       (enable-theme 'doom-one-light)
;;     (load-theme 'doom-one-light t)
;;     ))

(unless weiss-dumped-p 
  (load-theme 'weiss-light t)    
  )
(enable-theme 'weiss-light)

(setq inhibit-startup-screen t)
(setq word-wrap-by-category t)
;; parent: 
(provide 'weiss_ui_settings)
