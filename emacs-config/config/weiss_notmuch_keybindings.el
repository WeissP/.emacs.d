(with-eval-after-load 'notmuch
  (advice-add 'notmuch-jump-search :before #'disable-wks-vanilla-mode)
  (advice-add 'notmuch-tag-jump :before #'disable-wks-vanilla-mode-interactive)
  (advice-add 'notmuch-jump--make-keymap :before #'disable-wks-vanilla-mode-interactive)

  (wks-unset-key notmuch-hello-mode-map '("j"))
  (wks-define-key
   notmuch-hello-mode-map
   ""
   '(
     ("n" . notmuch-jump-search)          
     ("g" . notmuch-poll-and-refresh-this-buffer)          
     ))
  (wks-define-key
   notmuch-hello-mode-map
   "C-c "
   '(
     ("C-s" . weiss-notmuch-tree)     
     ))

  (wks-unset-key notmuch-search-mode-map '("SPC" "a"))
  (wks-define-key
   notmuch-search-mode-map
   ""
   '(
     ("j" . notmuch-search-next-thread)
     ("k" . notmuch-search-previous-thread)
     ("n" . notmuch-jump-search)     
     ("p" . notmuch-tag-jump)     
     ("g" . notmuch-poll-and-refresh-this-buffer)          
     ))
  (wks-define-key
   notmuch-search-mode-map
   "C-c "
   '(
     ("C-s" . weiss-notmuch-tree)     
     ("C-a" . notmuch-search-archive-thread)
     ))

  (wks-unset-key notmuch-show-mode-map '("SPC" "$" "j" "k" "l" "a" "n" "h"))
  (wks-define-key
   notmuch-show-mode-map
   ""
   '(
     ("p" . notmuch-tag-jump)     
     ("c r" . xah-copy-line-or-region)     
     ("t" . notmuch-show-toggle-message)     
     ("RET" . goto-address-at-point)     
     ("g" . notmuch-poll-and-refresh-this-buffer)          
     ))

  (wks-unset-key notmuch-tree-mode-map '("SPC" "$" "j" "k" "a" "n"))
  (wks-define-key
   notmuch-tree-mode-map
   ""
   '(
     ("j" . notmuch-tree-next-matching-message)
     ("k" . notmuch-tree-prev-matching-message)
     ("l" . notmuch-tree-filter)
     ("n" . notmuch-jump-search)     
     ("p" . notmuch-tag-jump)     
     ("." . weiss-notmuch-read)     
     ("g" . notmuch-poll-and-refresh-this-buffer)          
     ))
  (wks-define-key
   notmuch-tree-mode-map
   "C-c "
   '(
     ("C-s" . weiss-notmuch-tree)     
     ("C-a" . notmuch-tree-archive-thread)
     ))
  )

(provide 'weiss_notmuch_keybindings)
