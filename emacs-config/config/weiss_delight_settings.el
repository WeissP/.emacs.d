(with-eval-after-load 'delight
  (delight
   '(
     (company-mode " 🅰 " company)
     (company-box-mode nil company-box)
     (anzu-mode nil anzu)
     (hl-line-mode nil hl-line)
     (hi-lock-mode nil hi-lock)
     (highlight-parentheses-mode nil highlight-parentheses)
     (super-save-mode nil super-save)
     (eldoc-mode nil eldoc)
     (gcmh-mode nil gcmh)
     (which-key-mode nil which-key)
     (projectile-mode nil projectile)
     (color-outline-mode nil color-outline)
     (all-the-icons-dired-mode nil all-the-icons-dired)
     (dired-omit-mode nil dired-omit)
     (subword-mode nil subword)
     (sqlind-minor-mode nil sqlind-minor)
     (buffer-face-mode nil buffer-face)
     (org-indent-mode nil org-indent)
     (org-edit-latex-mode nil org-edit-latex)
     (org-fancy-priorities-mode nil org-fancy-priorities)
     (visual-line-mode nil visual-line)
     (abbrev-mode nil "abbrev")
     (rainbow-mode nil rainbow)
     (buffer-face-mode nil face-remap)
     (emacs-lisp-mode nil :major)
     (lisp-interaction-mode nil :major)
     (org-mode nil :major)
     ))
  )

(provide 'weiss_delight_settings)