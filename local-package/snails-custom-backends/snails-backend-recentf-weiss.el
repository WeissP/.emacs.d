;; recentf-weiss

;; [[file:../emacs-config.org::*recentf-weiss][recentf-weiss:1]]
(require 'snails-core)
(require 'recentf)

;;; Code:

(recentf-mode 1)

(snails-create-sync-backend
 :name
 "RECENTF-WEISS"

 :candidate-filter
 (lambda (input)
   (let (candidates)
     (dolist (file recentf-list)
       (when (and
              (> (length input) 1)
              (snails-match-input-p input file)
              )
         (snails-add-candiate 'candidates (weiss-reduce-file-path file) file))
       )
     (snails-sort-candidates input candidates 1 1)
     ))

 :candidate-icon
 (lambda (candidate)
   (snails-render-file-icon candidate))

 :candidate-do
 (lambda (candidate)
   (find-file candidate)))

(provide 'snails-backend-recentf-weiss)



;;; snails-backend-recentf-weiss.el ends here
;; recentf-weiss:1 ends here
