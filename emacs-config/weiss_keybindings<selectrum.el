(with-eval-after-load 'selectrum
  (wks-define-key
   selectrum-minibuffer-map
   ""
   '(("C-<return>" . selectrum-submit-exact-input)
     ("<backspace>" . selectrum-up-directory))))

;; parent: 
(provide 'weiss_keybindings<selectrum)
