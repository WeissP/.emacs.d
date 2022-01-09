(with-eval-after-load 'tab-line
  (wks-define-key
   (current-global-map)
   ""
   '(("C-<tab>" .  weiss-tab-next)
     ("C-S-<iso-lefttab>" .  weiss-tab-prev)
     ("<SPC> t n" . weiss-tab-remove-current-buffer)
     ("<SPC> t r" . weiss-add-buffer-to-tab-group)
     ("<SPC> t s" . weiss-dump-tab-groups)
     ("<SPC> t l" . weiss-load-tab-groups))))

;; parent: 
(provide 'weiss_keybindings<tab-line)
