(with-eval-after-load 'flymake
  (add-hook 'weiss-lint-hook #'flymake-start)

  (defun weiss-flymake-dwim ()
    "DOCSTRING"
    (interactive)
    (if  current-prefix-arg
        (call-interactively 'flymake-show-project-diagnostics)
      (call-interactively 'flymake-show-buffer-diagnostics)))
  )

(provide 'weiss_flymake_settings)
