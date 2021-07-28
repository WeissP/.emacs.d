;; org-roam
;;; Require
(require 'snails-core)
(require 'org-roam)
(require 'snails-roam)

;;; Code:
(snails-create-sync-backend
 :name
 "ORG-ROAM-TUTORIAL"

 :candidate-filter
 (lambda (input)
   (snails-roam-generate-candidates input '("link" "bookmark") 2)
   )

 :candidate-icon
 (lambda (candidate)
   (snails-render-material-icon "book"))

 :candidate-do
 (lambda (candidate)
   (snails-roam-find-file candidate)))

(snails-create-sync-backend
 :name
 "ORG-ROAM-UC"

 :candidate-filter
 (lambda (input)
   (snails-roam-generate-candidates input '("useful-commands") 2)
   )

 :candidate-icon
 (lambda (candidate)
   (snails-render-material-icon "help"))

 :candidate-do
 (lambda (candidate)
   (snails-roam-find-file candidate)))

(snails-create-sync-backend
 :name
 "ORG-ROAM-NOTE"

 :candidate-filter
 (lambda (input)
   (snails-roam-generate-candidates input '("note") 2)
   )

 :candidate-icon
 (lambda (candidate)
   (snails-render-material-icon "note"))

 :candidate-do
 (lambda (candidate)
   (snails-roam-find-file candidate)))


(snails-create-sync-backend
 :name
 "ORG-ROAM-PROJECT"

 :candidate-filter
 (lambda (input)
   (snails-roam-generate-candidates input '("project") 2)
   )

 :candidate-icon
 (lambda (candidate)
   (snails-render-material-icon "work"))

 :candidate-do
 (lambda (candidate)
   (snails-roam-find-file candidate)))

(snails-create-sync-backend
 :name
 "ORG-ROAM-FOCUSING"

 :candidate-filter
 (lambda (input)
   (snails-roam-generate-candidates input  '("focusing") 1)
   )

 :candidate-icon
 (lambda (candidate)
   (snails-render-material-icon "center_focus_strong"))

 :candidate-do
 (lambda (candidate)
   (snails-roam-find-file candidate)))

(snails-create-sync-backend-with-alt-do
 :name
 "ORG-ROAM-LINK"

 :candidate-filter
 (lambda (input)
   (snails-roam-generate-candidates input  '("link" "bookmark") 1)
   )

 :candidate-icon
 (lambda (candidate)
   (snails-render-material-icon "link"))

 :candidate-do
 (lambda (candidate)
   (snails-roam-find-file candidate))

 :candidate-alt-do
 (lambda (candidate)
   (snails-roam-find-file candidate t))
 )

(defun weiss-complete-emacs-config-modules (s)
  "DOCSTRING"
  (interactive)
  (let (
        (keys (split-string s "="))
        (alist `(
                 ("a" . "abbrevs")
                 ("sn" . "snails")
                 ("ltx" . "latex")
                 ("e" . "edit")
                 ;; ("c" . "completion")
                 ("c" . "counsel")
                 ("l" . "lsp-mode")
                 ("jpt" . "jupyter")
                 ("sh" . "shell-and-terminal")
                 ("f" . "ui=font-lock-face")
                 ("fc" . "flycheck")
                 ("fs" . "flyspell")
                 ("d" . "dired")
                 ("tr" . "translation")
                 ("ro" . "org=org-roam")
                 ("sp" . "org=weiss-org-sp-mode")
                 ("s" . "settings")
                 ("k" . "keybindings")
                 ("m" . "miscs")
                 ))
        modules
        )
    (dolist (x keys) 
      (push (or (cdr (assoc x alist)) x) modules)
      )
    (mapconcat 'identity modules "=") 
    ))

(snails-create-sync-backend-with-alt-do
 :name
 "ORG-ROAM-ALL"

 :candidate-filter
 (lambda (input)
   (snails-roam-generate-candidates input nil 4)
   )

 :candidate-do
 (lambda (candidate)
   ;; (message "candidate: %s" candidate)
   (snails-roam-find-file candidate)
   )

 :candidate-alt-do
 (lambda (candidate)
   (snails-roam-find-file candidate t))
 )

(provide 'snails-backend-org-roam)
