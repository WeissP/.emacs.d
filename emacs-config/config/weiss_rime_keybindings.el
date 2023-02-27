(define-key global-map (kbd "M-SPC") 'toggle-input-method)
(with-eval-after-load 'rime
  (define-key rime-active-mode-map (kbd "C-<return>") 'weiss-rime-return)
  (define-key rime-active-mode-map (kbd "<return>") 'rime--return)
  (define-key rime-mode-map (kbd "C-n") 'rime-force-enable)
  )

(provide 'weiss_rime_keybindings)
