(with-eval-after-load 'cider
  (add-hook 'clojure-mode-hook 'cider-mode)

  (defun weiss-cider-save-and-load ()
    "DOCSTRING"
    (interactive)
    (save-buffer)
    (cider-load-buffer-and-switch-to-repl-buffer)
    )

  (defun weiss-cider-repl-refresh ()
    "DOCSTRING"
    (interactive)
    (save-buffer)
    (cider-ns-refresh)
    (unless (one-window-p)
      (weiss-switch-buffer-or-otherside-frame-without-top)      
      )
    )

  (defun weiss-cider-eval-last-sexp-this-line ()
    "DOCSTRING"
    (interactive)
    (end-of-line)
    (cider-eval-last-sexp)
    )  
  )

;; parent: 
(provide 'weiss_settings<cider)
