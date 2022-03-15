(add-hook 'python-mode-hook #'flycheck-mode)
;; (add-hook 'java-mode-hook #'flycheck-mode)
;; (add-hook 'clojure-mode-hook #'flycheck-mode)
(setq
 ;; Only check while saving and opening files
 flycheck-check-syntax-automatically
 '(mode-enabled save)
 ;; flycheck-temp-prefix ".flycheck"
 ;; flycheck-emacs-lisp-load-path 'inherit
 )

(defvar-local flycheck-local-checkers nil)
(defun +flycheck-checker-get(fn checker property)
  (or
   (alist-get property (alist-get checker flycheck-local-checkers))
   (funcall fn checker property)))
(advice-add 'flycheck-checker-get :around '+flycheck-checker-get)

(defun weiss-flycheck-diwm ()
  "DOCSTRING"
  (interactive)
  (if (and lsp-mode current-prefix-arg)
      (call-interactively 'lsp-ui-flycheck-list)
    (call-interactively 'flycheck-list-errors)))

(provide 'weiss_flycheck_settings)
