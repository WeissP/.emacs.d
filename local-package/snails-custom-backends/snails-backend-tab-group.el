;; file-bookmark

;;; Require
(require 'snails-core)
;; (require 'bookmark)

;;; Code:


(snails-create-sync-backend
 :name "Tab-Group"

 :candidate-filter (lambda
                     (input)
                     (let ((current-group (weiss-tab-get-current-group-name))
                           candidates)
                       (dolist (group
                                (mapcar 'symbol-name
                                        (seq-filter
                                         (lambda (x) (not (listp x)))
                                         weiss-tab-groups)))
                         (when (and
                                (> (length input) -1)
                                (snails-match-input-p input group))
                           (snails-add-candiate 'candidates group group)))
                       (snails-add-candiate 'candidates
                                            (format "new group: %s" input)
                                            input)
                       (snails-add-candiate 'candidates
                                            (format "unbind group:%s" current-group)
                                            "[unbind group]")
                       candidates))


 :candidate-do (lambda
                 (candidate)
                 (pcase candidate
                   ("[unbind group]" (weiss-tab-unbind-group))
                   (_ (weiss-tab-bind-group candidate)))))

(defun weiss-test ()
  "DOCSTRING"
  (interactive)
  (snails '(snails-backend-tab-group)))

(provide 'snails-backend-tab-group)
;; file-bookmark:1 ends here
