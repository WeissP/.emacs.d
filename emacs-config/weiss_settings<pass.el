(defun weiss-pass-gen-info (beg end)
  "DOCSTRING"
  (interactive "@r")
  (thread-first
      (buffer-substring-no-properties beg end)
    (string-trim-left "http.?://")
    (string-trim-right "/.*")
    ((lambda (x)
       (format "user: \nurl: *%s/*\nautotype: user :tab pass" x)))
    (insert))
  (delete-region beg end)
  (search-backward "user:")
  (forward-char 6))
;; parent: 
(provide 'weiss_settings<pass)
(defun weiss-test () "DOCSTRING" (interactive))
