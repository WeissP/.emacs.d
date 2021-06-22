(defun wks-insert-mode-enable ()
  "DOCSTRING"
  (interactive)
  (wks-insert-mode 1)
  )

(defun wks-insert-mode-disable ()
  "DOCSTRING"
  (interactive)
  (wks-insert-mode -1)
  )

(defun wks-insert-mode-init ()
  "DOCSTRING"
  (interactive)
  (wks-insert-mode-enable)
  )

(dolist (x '(snails-mode-hook minibuffer-setup-hook)) 
  (add-hook x #'wks-insert-mode-enable)  
  )

(define-minor-mode wks-insert-mode
  "insert mode"
  :keymap  
  (let ((keymap (make-sparse-keymap)))
    (wks-define-key
     keymap ""
     '(
       ("a" . self-insert-command)
       ("b" . self-insert-command)
       ("c" . self-insert-command)
       ("d" . self-insert-command)
       ("e" . self-insert-command)
       ("f" . self-insert-command)
       ("g" . self-insert-command)
       ("h" . self-insert-command)
       ("i" . self-insert-command)
       ("j" . self-insert-command)
       ("k" . self-insert-command)
       ("l" . self-insert-command)
       ("m" . self-insert-command)
       ("n" . self-insert-command)
       ("o" . self-insert-command)
       ("p" . self-insert-command)
       ("q" . self-insert-command)
       ("r" . self-insert-command)
       ("s" . self-insert-command)
       ("t" . self-insert-command)
       ("u" . self-insert-command)
       ("v" . self-insert-command)
       ("w" . self-insert-command)
       ("x" . self-insert-command)
       ("y" . self-insert-command)
       ("z" . self-insert-command)       
       ("<spc>" . self-insert-command)       
       )
     )
    keymap
    )
  (if wks-insert-mode
      (progn
        (add-to-ordered-list 'emulation-mode-map-alists
					         `((wks-insert-mode . ,wks-insert-mode-map)))
        (set-cursor-color wks-vanilla-mode-cursor-color)
        )
    (set-cursor-color wks-command-mode-cursor-color)
    )
  )

(provide 'weiss_insert-mode<wks)
