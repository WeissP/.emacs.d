(with-eval-after-load 'mct
  (define-key minibuffer-local-filename-completion-map (kbd "DEL") #'my-backward-updir)
  )

(provide 'weiss_mct_keybindings)
