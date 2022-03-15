(with-eval-after-load 'ctrlf
  (let ((extra-bindings
         '((isearch-ring-retreat . ctrlf-next-match)
           (isearch-ring-advance . ctrlf-previous-match))))
    (dolist (x extra-bindings)
      (let ((left (vector 'remap (car x)))
            (right (cdr x)))
        (add-to-list 'ctrlf-minibuffer-bindings `(,left . ,right)))
        ))
    )
)

;; parent: 
(provide 'weiss_ctrlf_keybindings)
