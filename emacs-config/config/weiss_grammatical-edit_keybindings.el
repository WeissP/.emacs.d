(with-eval-after-load 'grammatical-edit
  (define-key grammatical-edit-mode-map
    (kbd "(")
    'grammatical-edit-open-round)
  (define-key grammatical-edit-mode-map
    (kbd "[")
    'grammatical-edit-open-bracket)
  (define-key grammatical-edit-mode-map
    (kbd "{")
    'grammatical-edit-open-curly)
  (define-key grammatical-edit-mode-map
    (kbd ")")
    'grammatical-edit-close-round)
  (define-key grammatical-edit-mode-map
    (kbd "]")
    'grammatical-edit-close-bracket)
  (define-key grammatical-edit-mode-map
    (kbd "}")
    'grammatical-edit-close-curly)
  (define-key grammatical-edit-mode-map
    (kbd "=")
    'grammatical-edit-equal)

  (define-key grammatical-edit-mode-map
    (kbd "%")
    'grammatical-edit-match-paren)
  (define-key grammatical-edit-mode-map
    (kbd "\"")
    'grammatical-edit-double-quote)

  (define-key grammatical-edit-mode-map
    (kbd "SPC")
    'grammatical-edit-space)
  (define-key grammatical-edit-mode-map
    (kbd "RET")
    'grammatical-edit-newline)

  (define-key grammatical-edit-mode-map
    (kbd "M-o")
    'grammatical-edit-backward-delete)
  (define-key grammatical-edit-mode-map
    (kbd "C-d")
    'grammatical-edit-forward-delete)
  (define-key grammatical-edit-mode-map
    (kbd "C-k")
    'grammatical-edit-kill)

  (define-key grammatical-edit-mode-map
    (kbd "M-\"")
    'grammatical-edit-wrap-double-quote)
  (define-key grammatical-edit-mode-map
    (kbd "M-[")
    'grammatical-edit-wrap-bracket)
  (define-key grammatical-edit-mode-map
    (kbd "M-{")
    'grammatical-edit-wrap-curly)
  (define-key grammatical-edit-mode-map
    (kbd "M-(")
    'grammatical-edit-wrap-round)
  (define-key grammatical-edit-mode-map
    (kbd "M-)")
    'grammatical-edit-unwrap)

  (define-key grammatical-edit-mode-map
    (kbd "M-p")
    'grammatical-edit-jump-right)
  (define-key grammatical-edit-mode-map
    (kbd "M-n")
    'grammatical-edit-jump-left)
  (define-key grammatical-edit-mode-map
    (kbd "M-:")
    'grammatical-edit-jump-out-pair-and-newline))

;; parent: 
(provide 'weiss_grammatical-edit_keybindings)
