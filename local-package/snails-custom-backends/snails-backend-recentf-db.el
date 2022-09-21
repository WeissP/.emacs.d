;;; Require
(require 'snails-core)

(defun snails-backend-recentf-root ()
  "Find projectile root."
  (if (file-remote-p (snails-start-buffer-dir))
      ;; "/ssh:lamp@scilab-0019.cs.uni-kl.de:/home"
      (snails-start-buffer-dir)
    (when (ignore-errors (require 'projectile))
      ;; (message "snails-start-buffer-dir:%s"
      ;;          (snails-start-buffer-dir))
      ;; (message "%s" (projectile-project-root (snails-start-buffer-dir)))
      (or (projectile-project-root (snails-start-buffer-dir)) "nil"))))

(snails-create-async-backend
 :name "RECENTF-DB"

 :build-command (lambda
                  (input)
                  (when (> (length input) 1)
                    (append
                     '("~/rust/recentf/recentf"
                       "prefixed-search"
                       )
                     (split-string input  " ")
                     )
                    ))

 :candidate-filter (lambda
                     (candidate-list)
                     (let (candidates)
                       (dolist (candidate candidate-list)
                         (let* ((l (split-string candidate "』𝔰𝔢𝔭『"))
                                (show (weiss-reduce-file-path (car l)))
                                (value (nth 1 l)))
                           (when value
                             (snails-add-candiate 'candidates show value))))
                       candidates))

 :candidate-do (lambda (candidate) (find-file candidate)))

(defun weiss-test ()
  "DOCSTRING"
  (interactive)
  (snails '(snails-backend-recentf-db)))

(provide 'snails-backend-recentf-db)
