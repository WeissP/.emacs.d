(with-eval-after-load 'lsp-mode
  (define-key lsp-mode-map (kbd "M-p") #'lsp-describe-thing-at-point)
  (define-key lsp-mode-map [remap xref-find-definitions] #'lsp-find-definition)
  (define-key lsp-mode-map [remap xref-find-references] #'lsp-find-references)

  (wks-define-key
   lsp-mode-map ""
   '(("C-c C-a" . lsp-execute-code-action)
     ("y i" . lsp-organize-imports)
     ("C-c C-d" . lsp-describe-thing-at-point)
     ("C-c C-M-x r" . lsp-rename)
     ("C-c C-M-x <f5>" . lsp-workspace-restart)))

  ;; (defmacro wks-lsp-bindkey (mode)
  ;;   `(with-eval-after-load ',(intern mode)
  ;;      (wks-define-key
  ;;       ,(intern (format "%s-map" mode)) ""
  ;;       '(
  ;;         ("y a" . lsp-execute-code-action)
  ;;         ("y i" . lsp-organize-imports)
  ;;         ("y d" . lsp-describe-thing-at-point)
  ;;         ("t" . lsp-rename)
  ;;         )
  ;;       )
  ;;      )
  ;;   )

  ;; (dolist (x '("go-mode" "python-mode" "java-mode"))
  ;;   `(wks-lsp-bindkey ,x)
  ;;   )
  )

(provide 'weiss_lsp-mode_keybindings)
