(add-hook 'after-init-hook
          (lambda ()
            (ignore-errors
              (unless (server-running-p)
                (server-mode)))))

;; parent: 
(provide 'weiss_server_settings)
