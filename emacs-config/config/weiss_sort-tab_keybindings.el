(with-eval-after-load 'sort-tab
  (wks-define-key
   (current-global-map)
   ""
   '(("C-<tab>" .  sort-tab-select-next-tab)
     ("C-S-<iso-lefttab>" .  sort-tab-select-prev-tab)
     ("<SPC> i r" . sort-tab-close-current-tab))))

;; parent: 
(provide 'weiss_sort-tab_keybindings)
