(with-eval-after-load 'python
  (wks-define-key
   python-mode-map ""
   '(
     ("8" . weiss-execute-buffer-python)
     ("y e" . weiss-ein-execute-all-cells-above-inclusively)
     )
   )
  )

(provide 'weiss_python_keybindings)
