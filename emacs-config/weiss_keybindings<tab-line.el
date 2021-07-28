(with-eval-after-load 'tab-line
  (wks-define-key
   (current-global-map)
   ""
   '(("C-<tab>" .  weiss-tab-next)
     ("C-S-<iso-lefttab>" .  weiss-tab-prev)
     ("<SPC> i r" . weiss-tab-remove-current-buffer)
     ("<SPC> i t" . weiss-add-buffer-to-tab-group))))

;; parent: 
(provide 'weiss_keybindings<tab-line)
