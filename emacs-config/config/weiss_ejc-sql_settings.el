(with-eval-after-load 'ejc-sql
  (setq clomacs-httpd-default-port 8090
        ejc-sql-separator ";"
        ) 

  (require 'ejc-company)
  (setq ejc-complete-on-dot nil)  
  (setq-mode-local
   sql-mode
   company-backends
   '(ejc-company-backend))

  (add-hook 'ejc-sql-minor-mode-hook
            (lambda ()
              (ejc-eldoc-setup)  ;; no width limit
              (ejc-set-column-width-limit nil)))

  (advice-add 'ejc-cancel-query :before #'weiss-select-mode-turn-off)

  (ejc-create-connection
   "digivine"
   :classpath "[/home/weiss/.m2/repository/postgresql/postgresql/9.3-1102.jdbc41/postgresql-9.3-1102.jdbc41.jar]"
   :password ""
   :user "weiss"
   :port "5432"
   :host "localhost"
   :dbname "digivine"
   :dbtype "postgresql")
  )

(provide 'weiss_ejc-sql_settings)
