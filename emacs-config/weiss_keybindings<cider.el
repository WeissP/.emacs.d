(with-eval-after-load 'cider-mode
  (define-key cider-mode-map [remap weiss-eval-last-sexp-this-line] 'weiss-cider-eval-last-sexp-this-line)
  (define-key cider-mode-map [remap eval-defun] 'cider-eval-defun-at-point)
  (define-key cider-mode-map [remap eval-region] 'cider-eval-region)
  (define-key cider-mode-map [remap xref-find-definitions] 'cider-find-var)

  (wks-define-key
   cider-mode-map
   ""
   `(
     ("C-c C-c" . cider-interrupt)
     ("t r" . cider-switch-to-repl-buffer)
     ("t s" . cider-repl-set-ns)
     ("t j" . cider-jack-in)
     ("-" . weiss-cider-save-and-load)
     ("t b" . cider-pop-back)
     ("SPC , p" . cider-eval-last-sexp-to-repl)
     ))

  (wks-unset-key cider-repl-mode-map '(","))
  (wks-define-key
   cider-repl-mode-map
   ""
   '(
     ;; cider-repl-backward-input
     ("<up>" . cider-repl-previous-input)
     ("<down>" . cider-repl-next-input)
     ))

  (wks-unset-key cider-stacktrace-mode-map '("j"))
  (wks-define-key
   cider-stacktrace-mode-map
   ""
   '(
     ("J" . cider-stacktrace-toggle-java)
     ))
  )

;; parent: 
(provide 'weiss_keybindings<cider)
