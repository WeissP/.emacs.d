(with-eval-after-load 'weiss-org-sp
  (advice-add 'xah-open-file-at-cursor
              :before
              (lambda () (interactive)
                (ignore-errors
                  (when (or (weiss-org-sp--at-property-p)
                            (looking-at weiss-org-sp-sharp-begin))
                    (re-search-forward ":tangle " (line-end-position) t)
                    ))
                ))

  (add-hook 'org-mode-hook
            (lambda ()
              (if (eq major-mode 'org-mode)
                  (weiss-org-sp-mode 1)
                (weiss-org-sp-mode -1)                           
                )))
  )

(provide 'weiss_weiss-org-sp_settings)
