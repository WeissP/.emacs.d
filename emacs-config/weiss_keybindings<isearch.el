(with-eval-after-load 'isearch
  (wks-define-key
   isearch-mode-map
   ""
   '(("<up>" . isearch-ring-retreat )
     ("<down>" . isearch-ring-advance)
     ("<left>" . isearch-repeat-backward)
     ("<right>" . isearch-repeat-forward)))

  (wks-define-key
   minibuffer-local-isearch-map
   ""
   '(

     ("<left>" . isearch-reverse-exit-minibuffer)
     ("<right>" . isearch-forward-exit-minibuffer)))
  )

;; parent: 
(provide 'weiss_keybindings<isearch)
