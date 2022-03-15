(with-eval-after-load 'embark
  (wks-define-key
   minibuffer-local-completion-map
   ""
   '(("TAB" . minibuffer-force-complete)
     ("<down>" . minibuffer-force-complete)
     ("C-M-S-s-j" . toggle-between-minibuffer-and-embark-collect-completions)
     ("DEL" . minibuffer-directory-up))))

;; parent: 
(provide 'weiss_embark_keybindings)
