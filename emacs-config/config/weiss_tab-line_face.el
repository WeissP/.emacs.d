(with-eval-after-load 'weiss_after-dump-misc
  (set-face-attribute 'tab-line-tab-current nil  :box nil :foreground "#383a42" :background "wheat")
  (set-face-attribute 'tab-line-tab-inactive-alternate nil  :box nil :foreground "#383a42" :background nil)
  (set-face-attribute 'tab-line-tab-inactive nil  :box nil :foreground "#383a42" :background nil)
  (set-face-attribute 'tab-line-tab nil  :box nil  :foreground "#383a42" :background nil )


  (defun weiss-tab-highlight-selected-tab (tab _tabs face buffer-p selected-p)
    "DOCSTRING"
    (interactive)
    (when selected-p
      (setf face `(:inherit (tab-line-tab-special ,face))))
    face)
  (add-to-list 'tab-line-tab-face-functions 'weiss-tab-highlight-selected-tab))

;; parent: 
(provide 'weiss_tab-line_face)
