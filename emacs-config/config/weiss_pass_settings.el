(with-eval-after-load 'pass
  (defun weiss-pass-gen-info (beg end)
    "DOCSTRING"
    (interactive "@r")
    (thread-first
      (buffer-substring-no-properties beg end)
      (string-trim-left "http.?://")
      (string-trim-right "/.*")
      ((lambda (x)
         (format "username: \nurl: *%s/*\nautotype: username :tab pass" x)))
      (insert))
    (delete-region beg end)
    (search-backward "username:")
    (forward-char 10))
  )

(provide 'weiss_pass_settings)

