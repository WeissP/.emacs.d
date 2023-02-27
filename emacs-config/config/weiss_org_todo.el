(with-eval-after-load 'org
  (setq
   org-todo-keywords '((sequence "INPROGRESS(i)" "TODO(t)" "WAITING(w)" "|" "DONE(d)" "CANCELLED(c@)"))
   org-log-done 'time
   )
  )

(provide 'weiss_org_todo)
