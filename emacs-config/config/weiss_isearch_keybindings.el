(with-eval-after-load 'isearch
  (wks-define-key
   isearch-mode-map
   ""
   '(("<up>" . isearch-ring-retreat )
     ("<down>" . isearch-ring-advance)
     ("<right>" . isearch-repeat-backward)
     ("<left>" . isearch-repeat-forward)))

  (wks-define-key
   minibuffer-local-isearch-map
   ""
   '(

     ("<left>" . isearch-reverse-exit-minibuffer)
     ("<right>" . isearch-forward-exit-minibuffer)))
  )

;; parent: 
(provide 'weiss_isearch_keybindings)
