(with-eval-after-load 'org-noter
  (setq org-noter-notes-window-location
        (pcase emacs-host
          ("arch"
           'vertical-split 
           )
          ("mac"
           'horizontal-split
           )))
  )

(provide 'weiss_org-noter_settings)
