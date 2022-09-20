(with-eval-after-load 'tree-sitter
  (global-tree-sitter-mode)

  ;; (tree-sitter-load 'elisp "elisp")
  ;; (add-to-list 'tree-sitter-major-mode-language-alist '(emacs-lisp-mode . elisp))

  ;; (tree-sitter-load 'sql "sql")
  ;; (add-to-list 'tree-sitter-major-mode-language-alist '(sql-mode . sql))

  ;; (tree-sitter-load 'org "org")
  ;; (add-to-list 'tree-sitter-major-mode-language-alist '(org-mode . org))

  (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode)

  (with-eval-after-load 'rustic
    (add-hook 'rustic-mode-hook
              (lambda ()
                (add-function :before-while tree-sitter-hl-face-mapping-function
                              (lambda (capture-name)
                                (not (string= capture-name "keyword"))))))
    ))

;; parent: 
(provide 'weiss_tree-sitter_settings)
