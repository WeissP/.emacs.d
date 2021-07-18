;;; Require
(require 'snails-core)

;;; Code:
(defvar snails-emacs-config-new-length 1)

(snails-create-async-backend
 :name
 "EMACS-CONFIG"

 :build-command
 (lambda (input)
   (when (and EmacsConfigManager-path
              (> (length input) 1))
     (append '("EmacsConfigManager" "get" "fuzzy") (split-string input  " "))
     )
   )

 :candidate-filter
 (lambda (candidate-list)
   (let (candidates)
     (dolist (candidate candidate-list)
       (snails-add-candiate 'candidates candidate candidate)
       )
     candidates))

 :candidate-icon
 (lambda (candidate)
   (snails-render-file-icon candidate))

 :candidate-do
 (lambda (candidate)
   (find-file (concat snails-emacs-config-path candidate))))

(snails-create-sync-backend
 :name
 "EMACS-CONFIG-NEW"

 :candidate-filter
 (lambda (input)
   (when (> (length input) snails-emacs-config-new-length)
     (let ((candidates)
           )
       (snails-add-candiate 'candidates input input)       
       )
     )
   ) 

 :candidate-do
 (lambda (candidate)
   (let* (
          (input-list (weiss-complete-emacs-config-module-names candidate))
          (module (nth 0 input-list))
          (class (nth 1 input-list))
          (parent (and (= (length input-list) 3)
                       (nth 2 input-list)))
          (filename (shell-command-to-string
                     (format "%s add file %s %s"
                             (executable-find "EmacsConfigManager")
                             module class
                             )))
          )
     (message "input-list: %s" input-list)
     (message "parent: %s" parent)
     (find-file (concat snails-emacs-config-path filename))
     (insert (format "(with-eval-after-load '%s\n\n)\n\n;; parent: %s\n(provide '%s)"
                     class
                     (emacs-config-get-all-parents class)
                     (substring filename 0 -3)))
     (goto-char (point-min))
     (when parent
       (message ": %s" "starting add")
       (emacs-config-add-relation class parent)
       )
     )
   ))

(defun weiss-complete-emacs-config-module-names (s)
  "DOCSTRING"
  (interactive)
  (let* (
         (keys (split-string s " "))
         (module (car keys))
         (classes (split-string (nth 1 keys) "<"))
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
                  ("f" . "font-lock-face")
                  ("fc" . "flycheck")
                  ("fs" . "flyspell")
                  ("d" . "dired")
                  ("tr" . "translation")
                  ("ro" . "org-roam")
                  ("sp" . "weiss-org-sp-mode")
                  ("s" . "settings")
                  ("k" . "keybindings")
                  ("m" . "misc")
                  ("w" . "wks")
                  ("q" . "quick-insert")
                  ))
         res class parent 
         )
    (setq res `(,module ,(car classes) ,(and (> (length classes) 1)
                                             (nth 1 classes))))
    (mapcar
     (lambda (x) (or (cdr (assoc x alist)) x))
     res)
    ))

;; (wks-define-key
;;  (current-global-map)
;;  ""
;;  '(
;;    ("@" . weiss-test)
;;    ("-" . weiss-switch-to-otherside-top-frame)
;;    )
;;  )
;; (wks-define-key
;;  dired-mode-map
;;  ""
;;  '(
;;    ("@" . weiss-test)
;;    ("-" . weiss-switch-to-otherside-top-frame)
;;    )
;;  )
(provide 'snails-backend-emacs-config)
;;; snails-backend-emacs-config.el ends here


