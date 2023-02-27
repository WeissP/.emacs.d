(with-eval-after-load 'tab-line
  (defun weiss-tab-highlight-selected-tab (tab _tabs face buffer-p selected-p)
    "DOCSTRING"
    (interactive)
    (when selected-p
      (setf face `(:inherit (tab-line-tab-special ,face))))
    face)
  (add-to-list 'tab-line-tab-face-functions 'weiss-tab-highlight-selected-tab)
  )

(provide 'weiss_tab-line_face)
