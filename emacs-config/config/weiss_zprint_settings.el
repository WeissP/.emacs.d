(with-eval-after-load 'zprint
  ;; (add-hook 'clojure-mode-hook 'zprint-mode)
  (defun zprint-with-arg (arg)
    "DOCSTRING"
    (interactive)
    (let* ((contents (buffer-string))
           (orig-buf (current-buffer))
           (formatted-contents
            (with-temp-buffer
              (insert contents)
              (let ((buf (current-buffer))
                    (retcode
                     (call-process-region
                      (point-min)
                      (point-max)
                      zprint-bin-path
                      t
                      (current-buffer)
                      nil
                      arg)))
                (if (zerop retcode)
                    (with-current-buffer orig-buf
                      (replace-buffer-contents buf))
                  (error "zprint failed: %s"
                         (string-trim-right (buffer-string))))))))))

  ;; (defun zprint ()
  ;;   "DOCSTRING"
  ;;   (interactive)
  ;;   (zprint-with-arg "{:style :indent-only}")
  ;;   )

  (defun zprint-community ()
    "Reformat code using zprint."
    (interactive)
    (zprint-with-arg "{:style :community}"))
  )

;; parent: cider
(provide 'weiss_zprint_settings)
