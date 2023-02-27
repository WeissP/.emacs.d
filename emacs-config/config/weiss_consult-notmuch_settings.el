(with-eval-after-load 'consult-notmuch
  (defun weiss-consult-notmuch-tree ()
    "DOCSTRING"
    (interactive)
    (consult-notmuch--tree (consult-notmuch--search "(not is:unimportant) and")))
  )

(provide 'weiss_consult-notmuch_settings)
