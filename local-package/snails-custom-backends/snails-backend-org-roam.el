;; org-roam
;;; Require
(require 'snails-core)
(require 'org-roam)
(require 'snails-roam)

;;; Code:

(defvar org-roam-link-query
  (vconcat snails-roam-file-and-tags-query (snails-roam-filter-by-tags '("link" "bookmark"))))

(defvar org-roam-focusing-query
  (vconcat snails-roam-file-and-tags-query (snails-roam-filter-by-tags '("focusing"))))

(defvar org-roam-project-query
  (vconcat snails-roam-file-and-tags-query (snails-roam-filter-by-tags '("project"))))

(defvar org-roam-note-query
  (vconcat snails-roam-file-and-tags-query (snails-roam-filter-by-tags '("note"))))

(defvar org-roam-tutorial-query
  (vconcat snails-roam-file-and-tags-query (snails-roam-filter-by-tags '("tutorial"))))

(defvar org-roam-emacs-config-query
  (vconcat snails-roam-file-and-tags-query (snails-roam-filter-by-tags '("emacs")) (snails-roam-filter-by-tags '("dotfiles"))))

(defvar org-roam-uc-query
  (vconcat snails-roam-file-and-tags-query (snails-roam-filter-by-tags '("useful-commands"))))


(snails-create-sync-backend
 :name
 "ORG-ROAM-TUTORIAL"

 :candidate-filter
 (lambda (input)
   (snails-roam-generate-candidates input org-roam-tutorial-query 2)
   )

 :candidate-icon
 (lambda (candidate)
   (snails-render-material-icon "book"))

 :candidate-do
 (lambda (candidate)
   (find-file candidate)))

(snails-create-sync-backend
 :name
 "ORG-ROAM-UC"

 :candidate-filter
 (lambda (input)
   (snails-roam-generate-candidates input org-roam-uc-query 2)
   )

 :candidate-icon
 (lambda (candidate)
   (snails-render-material-icon "help"))

 :candidate-do
 (lambda (candidate)
   (find-file candidate)))

(snails-create-sync-backend
 :name
 "ORG-ROAM-NOTE"

 :candidate-filter
 (lambda (input)
   (snails-roam-generate-candidates input org-roam-note-query 2)
   )

 :candidate-icon
 (lambda (candidate)
   (snails-render-material-icon "note"))

 :candidate-do
 (lambda (candidate)
   (find-file candidate)))


(snails-create-sync-backend
 :name
 "ORG-ROAM-PROJECT"

 :candidate-filter
 (lambda (input)
   (snails-roam-generate-candidates input org-roam-project-query 2)
   )

 :candidate-icon
 (lambda (candidate)
   (snails-render-material-icon "work"))

 :candidate-do
 (lambda (candidate)
   (find-file candidate)))

(snails-create-sync-backend
 :name
 "ORG-ROAM-FOCUSING"

 :candidate-filter
 (lambda (input)
   (snails-roam-generate-candidates input org-roam-focusing-query 1)
   )

 :candidate-icon
 (lambda (candidate)
   (snails-render-material-icon "center_focus_strong"))

 :candidate-do
 (lambda (candidate)
   (find-file candidate)))

(snails-create-sync-backend-with-alt-do
 :name
 "ORG-ROAM-LINK"

 :candidate-filter
 (lambda (input)
   (snails-roam-generate-candidates input org-roam-link-query 1)
   )

 :candidate-icon
 (lambda (candidate)
   (snails-render-material-icon "link"))

 :candidate-do
 (lambda (candidate)
   (weiss-roam-find-file candidate))

 :candidate-alt-do
 (lambda (candidate)
   (find-file candidate))
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
   (snails-roam-generate-candidates input snails-roam-file-and-tags-query 4)
   )

 :candidate-do
 (lambda (candidate)
   (weiss-roam-find-file candidate))

 :candidate-alt-do
 (lambda (candidate)
   (find-file candidate))
 )

(provide 'snails-backend-org-roam)
