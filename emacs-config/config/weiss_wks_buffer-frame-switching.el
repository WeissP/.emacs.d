(defvar weiss-min-window-width 80)

(defun weiss-new-frame ()
  "make new frame on the same side of current frame or on the other side with prefix-arg"
  (interactive)
  (make-frame default-frame-alist)
  )

(defun weiss-one-window-p ()
  "DOCSTRING"
  (interactive)
  (one-window-p)
  ;; (equal (length (cl-remove-if #'window-dedicated-p (window-list))) 1)
  )

(defun weiss-split-or-delete-window ()
  "DOCSTRING"
  (interactive)
  (if (weiss-one-window-p)
      (call-interactively 'split-window-below)
    (weiss-delete-other-window))
  )

(defun weiss-split-or-switch-window ()
  "DOCSTRING"
  (interactive)
  (if (weiss-one-window-p)
      (call-interactively 'split-window-below)
    (other-window 1))
  )

(defun weiss-split-window-dwim ()
  "DOCSTRING"
  (interactive)
  (if (>= (window-total-width) (* 2 weiss-min-window-width)) 
      (call-interactively 'split-window-right)
    (call-interactively 'split-window-below)    
    )
  )

(defun weiss-delete-other-window ()
  "If the current buffer ist org src file, switch between maximize window size(but not delete other windows) and half window size, else delete other windows"
  (interactive)
  (if (string-prefix-p "*Org Src " (buffer-name))
      (if (<
           (/ (frame-height) (nth 1 (window-edges)))
           3)
          (maximize-window)
        (balance-windows))
    (delete-other-windows))
  )



(provide 'weiss_wks_buffer-frame-switching)
