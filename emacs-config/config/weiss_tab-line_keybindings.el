(wks-define-key
 (current-global-map)
 ""
 '(("C-<tab>" .  weiss-tab-next)
   ("C-S-<iso-lefttab>" .  weiss-tab-prev)
   ("<SPC> t r" . weiss-tab-remove-current-buffer)
   ("<SPC> t n" . weiss-add-buffer-to-tab-group)
   ("<SPC> t d" . weiss-dump-tab-groups)
   ("<SPC> t l" . weiss-load-file-groups)))

;; parent: 
(provide 'weiss_tab-line_keybindings)
