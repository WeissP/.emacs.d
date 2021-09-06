(with-eval-after-load 'cider-mode
  ;; resolve the conflict between lsp and cider
  (add-hook 'cider-mode-hook
            (lambda ()
              (add-to-list 'minor-mode-overriding-map-alist
                           (assoc 'cider-mode minor-mode-map-alist))))

  (define-key cider-mode-map [remap weiss-eval-last-sexp-this-line] 'weiss-cider-eval-last-sexp-this-line)
  (define-key cider-mode-map [remap eval-defun] 'cider-eval-defun-at-point)
  (define-key cider-mode-map [remap eval-region] 'cider-eval-region)
  (define-key cider-mode-map [remap xref-find-definitions] 'cider-find-var)

  (wks-define-key
   cider-mode-map
   ""
   `(("C-c C-c" . cider-interrupt)
     ("y r" . cider-switch-to-repl-buffer)
     ("y s" . cider-repl-set-ns)
     ("y j" . cider-jack-in)
     ("-" . weiss-cider-save-and-load)
     ("y b" . cider-pop-back)
     ("C-c C-M-x <f5>" . cider-restart)
     ("C-c C-M-x c" . weiss-cider-connect-babashka)
     ("C-c C-M-x s" . cider-connect-sibling-clj)
     ("C-c C-M-x x" . cider-run)
     ("SPC , i" . cider-eval-last-sexp-to-repl)
     ("SPC , p" . cider-eval-list-at-point)
     ("SPC , f" . cider-pprint-eval-defun-at-point)))

  (wks-unset-key cider-repl-mode-map '(","))
  (wks-define-key
   cider-repl-mode-map
   ""
   '(;; cider-repl-backward-input
     ("<up>" . cider-repl-previous-input)
     ("<down>" . cider-repl-next-input)))

  (wks-unset-key cider-stacktrace-mode-map '("j"))
  (wks-define-key
   cider-stacktrace-mode-map
   ""
   '(("J" . cider-stacktrace-toggle-java)))

  (wks-unset-key cider-docview-mode-map '("j"))
  (wks-define-key
   cider-docview-mode-map
   ""
   '(("J" . cider-stacktrace-toggle-java))))

;; parent: 
(provide 'weiss_keybindings<cider)
