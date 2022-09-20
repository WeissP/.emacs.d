(with-eval-after-load 'weiss_after-dump-misc
  (defun weiss-tab-highlight-selected-tab (tab _tabs face buffer-p selected-p)
    "DOCSTRING"
    (interactive)
    (when selected-p
      (setf face `(:inherit (tab-line-tab-special ,face))))
    face)
  (add-to-list 'tab-line-tab-face-functions 'weiss-tab-highlight-selected-tab))

;; parent: 
(provide 'weiss_tab-line_face)
