(with-eval-after-load 'projectile
  (projectile-register-project-type 'go '("go.mod")
                                    :compile "go build"
                                    :test "go test"
                                    :run "go run main.go")
  (projectile-global-mode 1)
  )

;; parent: 
(provide 'weiss_projectile_settings)
