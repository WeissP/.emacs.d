(with-eval-after-load 'dired
  (wks-unset-key
   dired-mode-map
   (mapcar 'number-to-string (number-sequence 0 9))
   )
  (wks-unset-key
   dired-mode-map
   '("SPC" "g" "n" "=" "!" "a" "$" "y")
   )

  (wks-define-key
   dired-mode-map "SPC l"
   '(
     ("r" . dired-toggle-read-only)
     ("v" . weiss-dired-single-handed-mode)
     )
   )

  (wks-define-key
   dired-mode-map "<deletechar> l"
   '(
     ("r" . dired-toggle-read-only)
     ("v" . weiss-dired-single-handed-mode)
     )
   )

  (wks-define-key
   dired-mode-map "g"
   '(
     ("a" . (weiss-dired-find-audio-todos (find-file "~/Downloads/my_tmp/todos/")))
     ("d" . (weiss-dired-find-downloads (find-file "~/Downloads")))
     ("v" . (weiss-dired-find-Vorlesungen (find-file "~/Documents/Vorlesungen")))
     ("m" . (weiss-dired-find-media (find-file "/run/media/weiss")))
     ("p" . (weiss-dired-find-backup (find-file "/run/media/weiss/Seagate_Backup/videos/porn/")))
     ("h" . (weiss-dired-find-home (find-file "~/")))
     ("t" . (weiss-dired-find-telega (find-file "~/.telega/cache/")))
     ("e" . (weiss-dired-find-emacs-config (find-file "~/.emacs.d")))
     )
   )

  (wks-define-key
   dired-mode-map ""
   '(
     ("RET" . dired-find-file)
     ("," . beginning-of-buffer)
     ("." . end-of-buffer)
     (";" . dired-maybe-insert-subdir)
     ("-" . revert-buffer)
     ("8" .  dired-hide-details-mode)
     ("=" .  dired-sort-toggle-or-edit)
     ("A" .  hydra-dired-filter-actress/body)
     ("c" .  dired-do-copy)
     ("C" .  weiss-dired-rsync)
     ("d" .  dired-do-delete)
     ("D" .  weiss-dired-dragon-files)
     ("f" .  (weiss-dired-toggle-wdired (dired-toggle-read-only)(wks-vanilla-mode-enable)))
     ("j" .  dired-next-line)
     ("h" .  dired-omit-mode)
     ("k" .  dired-previous-line)
     ("i" .  (weiss-dired-find-up-dir (find-alternate-file "..")))
     ("l" .  dired-find-alternate-file)
     ("L" .  dired-do-symlink)
     ("m" .  dired-mark)
     ("o" .  xah-open-in-external-app)
     ("p" .  peep-dired)
     ("q" .  quit-window)
     ("r" .  dired-do-rename)
     ("s" . snails)
     ("S" .  hydra-dired-quick-sort/body)
     ("t" .  dired-toggle-marks)
     ("u" .  dired-unmark)
     ("U" .  (weiss-dired-unmark-all-and-revert (dired-unmark-all-marks) (revert-buffer)))
     ("v" .  weiss-dired-git-clone)
     ("x" .  dired-do-flagged-delete)
     ("y v" .  weiss-dired-merge-videos)
     ("z" .  dired-do-compress)
     ("Z" .  dired-do-compress-to)
     ) )
  )

;; parent: 
(provide 'weiss_dired_keybindings)
