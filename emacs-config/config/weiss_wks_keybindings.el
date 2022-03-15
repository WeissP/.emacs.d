(wks-define-key
 prog-mode-map ""
 '(("<tab>" . weiss-indent)
   ("<RET>" . weiss-deactivate-mark-and-new-line)
   ;; ("<right>" . right-char)
   ;; ("<left>" . left-char)
   ))

(wks-define-key
 text-mode-map ""
 '(("<RET>" . weiss-deactivate-mark-and-new-line)))

(wks-define-key
 (current-global-map)
 ""
 '(("M-i" . wks-vanilla-mode-disable)
   ("<backtab>" . weiss-indent)
   ("<S-delete>" . (weiss-insert-single-slash (insert "\\")))
   ("M-DEL" . (weiss-insert-single-vertical-bar (insert "|")))
   ("<f5>" . revert-buffer)
   ("M-e" . eldoc)
   ("C-n" . recenter-top-bottom)
   ("<dead-circumflex>" . (weiss-insert-grave (insert "^")))
   ("<left>" . scroll-up)
   ;; ("<down>" . scroll-up)
   ("<right>" . scroll-down)
   ;; ("<up>" . scroll-down)
   ("<escape> <up>" . text-scale-increase)
   ("<escape> <down>" . text-scale-decrease)))

(global-unset-key (kbd "<escape>"))
(with-eval-after-load 'weiss_wks_quick-insert
  (wks-define-key
   (current-global-map)
   ""
   '(("<escape>" . wks-global-quick-insert-keymap)
     ("<escape> ," . previous-buffer)
     ("<escape> ." . next-buffer))))

(wks-unset-key help-mode-map '("h"))
(with-eval-after-load 'debugger-mode
  (wks-unset-key debugger-mode-map '("h" "j")))
(wks-unset-key messages-buffer-mode-map '("h"))

(with-eval-after-load 'image-mode
  (wks-unset-key image-mode-map '("SPC" "a" "s"))
  (wks-define-key
   image-mode-map ""
   '(("j" . next-line)
     ("k" . previous-line)
     ("i" . left-char)
     ("l" . right-char)
     ("C-+" .  image-increase-size)
     ("C--" .  image-decrease-size))))

(with-eval-after-load 'man
  (wks-unset-key Man-mode-map '("k" "n" "s")))

(with-eval-after-load 'view
  (wks-unset-key view-mode-map '("SPC" "w" "n")))





(global-unset-key (kbd "y"))
(wks-define-key
 (current-global-map)
 ""
 `(("S-<dead-grave>" . weiss-open-line-and-indent)
   ("_" . weiss-open-line-and-indent)
   ("ß" . save-buffer)
   (";" . weiss-expand-region-by-word)
   ("|" . weiss-puni-backward-sexp)
   ("$" . weiss-delete-other-window)
   ("?" . grammatical-edit-match-paren)

   ("," . xah-backward-left-bracket)
   ("-" . mark-defun)
   ("=" . xah-shrink-whitespaces)
   ("." . xah-forward-right-bracket)
   (":" . weiss-exchange-point-or-beginning-of-line)
   ("/" . rotate-text)
   ("@" . weiss-mark-brackets)

   ;; ("1" .  scroll-down)
   ;; ("2" .  scroll-up)
   ;; ("3" .  weiss-delete-other-window)
   ;; ("4" .  split-window-below)
   ;; ("5" .  weiss-test)
   ;; ("6" .  mark-defun)
   ;; ("7" .  xah-select-text-in-quote)
   ;; ("8" .  (wks-C-c-C-e (execute-kbd-macro ,(kbd "C-c C-e"))))
   ;; ("9" .  weiss-switch-to-otherside-top-frame)
   ;; ("0" .  weiss-switch-buffer-or-otherside-frame-without-top)

   ("a" . weiss-split-or-switch-window)
   ("b" . xah-toggle-letter-case)
   ("c" . xah-copy-line-or-region)
   ("C" . weiss-kill-append-with-comma)
   ("d" . weiss-puni-kill-line)
   ("e" . weiss-delete-backward-with-region)
   ("f" . wks-vanilla-mode-enable)
   ("g" . weiss-universal-argument)
   ("h" . weiss-select-line-downward)
   ("i" . weiss-left-key)
   ("j" . weiss-down-key)
   ("k" . weiss-up-key)
   ("l" . weiss-right-key)
   ("m" . weiss-backward-up-list)
   ("n" . isearch-forward)
   ("o" . weiss-expand-region-by-sexp)
   ("O" . weiss-contract-region-by-word)
   ("p" . weiss-indent)
   ("P" . weiss-contract-region-by-sexp)
   ("q" . weiss-temp-insert-mode)
   ("r" . weiss-delete-forward-with-region)
   ("s" . snails)

   ("y /" . puni-slurp-forward)
   ("y f" . weiss-flycheck-diwm)
   ("y <right>" . transpose-sexps)
   ("y <left>" . move-sexp-left)

   ("u" . undo)
   ("v" . xah-paste-or-paste-previous)
   ("V" .  weiss-paste-with-linebreak)
   ("w" . wks-repeat-command)
   ("x" . weiss-comment-dwim)
   ("t" . weiss-delete-or-add-parent-sexp)
   ("z" . split-window-below)
   ("<end>" . weiss-simulate-c-g)
   ("SPC" . wks-leader-keymap)
   ("<deletechar>" . wks-leader-keymap)

   ("C-M-S-s-j" . weiss-switch-buffer-or-otherside-frame-without-top)
   ("C-M-S-s-k" . weiss-switch-to-same-side-frame)
   ("C-M-S-s-l" . weiss-switch-to-otherside-top-frame)))

(wks-trans-keys
 '(("y c" . "C-c C-c")
   ("y d" . "C-c C-d")
   ("y e" . "C-c C-e")
   ("y k" . "C-c C-k")
   ("y l" . "C-c C-l")
   ("y o" . "C-c C-o")
   ("y u" . "C-c '")
   ("y t" . "C-c C-t")
   ("y n" . "C-c C-n")
   ("y r" . "C-c C-r")
   ("y q" . "C-c C-q")
   ("y a" . "C-c C-a")
   ("y y" . "C-c C-M-x")
   ("y x b" . "C-x C-a C-b")
   ("y x p" . "C-x C-a C-p")
   ("y x r" . "C-x C-a C-r")))

(provide 'weiss_wks_keybindings)
