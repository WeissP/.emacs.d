(require 'snails-core)

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
                 (require 'tab-line)
                 (pcase candidate
                   ("[unbind group]" (weiss-tab-unbind-group))
                   (_ (weiss-tab-bind-group candidate)))))

(snails-create-sync-backend
 :name "File-Group"

 :candidate-filter (lambda
                     (input)
                     (let ((current-group (weiss-tab-get-current-group-name))
                           candidates)
                       (unless weiss-file-groups 
                         (weiss-load-file-groups))
                       (dolist (group
                                (mapcar 'symbol-name
                                        (seq-filter
                                         (lambda (x) (not (listp x)))
                                         weiss-file-groups)))
                         (when (and
                                (> (length input) -1)
                                (snails-match-input-p input group))
                           (snails-add-candiate 'candidates group group)))
                       candidates))


 :candidate-do (lambda
                 (candidate)
                 (require 'tab-line)
                 (weiss-load-file-group-to-tab candidate)
                 (weiss-tab-bind-group candidate)))

(provide 'snails-backend-tab-group)

