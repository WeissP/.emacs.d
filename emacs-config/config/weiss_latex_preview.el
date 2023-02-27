(with-eval-after-load 'LaTeX-mode
  (with-eval-after-load 'org-mode
    (setq org-latex-create-formula-image-program 'dvipng)
    (plist-put org-format-latex-options :scale 1.5)
    )
  
  (eval-after-load "preview"
    '(add-to-list 'preview-default-preamble "\\PreviewEnvironment{tikzpicture}" t)
    )

  (defun weiss-latex-buffer-preview ()
    "If current-prefix-arg then remove preview, else preview all"
    (interactive)
    (if current-prefix-arg
        (preview-clearout-buffer)
      (let ((text (buffer-substring-no-properties 1 (min 100 (point-max)))))    
        (if (or (string-match "begin{tikzpicture}" text)
                (string-match "begin{forest}" text))
            (let ((buffer-file-name nil))
              (if current-prefix-arg
                  (preview-clearout-buffer)
                (message "%s" "preview-buffer")
                (preview-buffer)))
          (weiss-org-preview-latex-and-image)
          )))
    )
  )


(provide 'weiss_latex_preview)
