(add-hook 'dired-mode-hook (lambda () (interactive)
                             (dired-hide-details-mode 1)
                             ;; (dired-collapse-mode)
                             (dired-utils-format-information-line-mode)
                             ;; (all-the-icons-dired-mode)
                             (dired-omit-mode)
                             (setq dired-auto-revert-buffer 't)
                             ))

(with-eval-after-load 'dired
  (defun weiss-dired-merge-videos ()
    "merge videos by its lexicographical order"
    (interactive)
    (let* ((input-file (concat user-emacs-directory ".temp/videomerger"))
           (videos (dired-get-marked-files nil nil nil nil t))
           (new-name (read-string  "new video name: "  (format "%s" (file-name-nondirectory (car videos)))))
           (cmd (format "ffmpeg -f concat -safe 0 -i %s -c copy '%s%s'"  input-file (file-name-directory (car videos)) new-name) )
           )
      (if (file-exists-p new-name)
          (message "new-name: %s already exists!" new-name)
        (with-temp-buffer
          (insert (mapconcat (lambda (x) (format "file '%s'" x)) videos "\n"))
          (sort-lines nil (point-min) (point-max))
          (write-region (point-min) (point-max) input-file))
        (weiss-start-process "ffmpeg_merge" cmd)
        )
      ))

  (setq
   dired-dwim-target t
   dired-recursive-deletes 'always
   dired-recursive-copies (quote always)
   dired-auto-revert-buffer t
   dired-omit-files "\\`[.]?#\\|\\`[.][.]?\\'|\\|.*aria2$\\|^.*frag-master.*$\\|^my_tmp$\\|^\\."
   dired-listing-switches "-altGh"
   )
  )

(provide 'weiss_dired_settings)
