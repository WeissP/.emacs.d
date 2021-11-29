(with-eval-after-load 'mhtml-mode
  (wks-define-key
   mhtml-mode-map ""
   '(("SPC &" . sgml-skip-tag-forward))))

;; parent: 
(provide 'weiss_keybindings<mhtml-mode)
