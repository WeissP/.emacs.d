(wks-define-key
 (current-global-map)
 ""
 '(("n" . consult-line)
   ))

(wks-define-key
 wks-leader-keymap  ""
 '(
   ("i f" .  consult-find)
   ("i v" .  consult-yank-pop)
   ("i i" .  consult-imenu)
   ("i m i" .  consult-imenu-multi)

   ("k l" .  consult-goto-line)
   )
 )



(provide 'weiss_consult_keybindings)
