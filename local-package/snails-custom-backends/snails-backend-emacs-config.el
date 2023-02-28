;;; Require
(require 'snails-core)

;;; Code:
(add-to-list 'exec-path "~/.cargo/bin/")

(defvar snails-emacs-config-new-length 1)
(snails-create-sync-backend
 :name
 "EMACS CONFIGS"
 :candidate-filter
 (lambda (input)
   (when (> (length input) 0)
     (let ((candidates)
           )
       (dolist (file
                (directory-files weiss/configs-dir nil)
                candidates
                )
         (when (and (> (length file) 6) 
                    (or
                     (string-equal input "")
                     (snails-match-input-p input (substring file 6)))
                    )
           (snails-add-candiate 'candidates file (concat weiss/configs-dir file))
           ))
       )     
     ))

 :candidate-icon
 (lambda (candidate)
   (snails-render-file-icon candidate))

 :candidate-do
 (lambda (candidate)
   (snails-find-file candidate)))


(snails-create-sync-backend
 :name "EMACS-CONFIG-NEW"

 :candidate-filter (lambda
                     (input)
                     (when (> (length input) snails-emacs-config-new-length)
                       (let ((candidates)
                             )
                         (snails-add-candiate 'candidates input input))))

 :candidate-do (lambda
                 (candidate)
                 (-let
                     [(pkg module full)
                      (weiss-complete-emacs-config-module-names candidate)
                      ]
                   (setq full (format "weiss_%s_%s" pkg module))
                   (find-file
                    (concat weiss/configs-dir full ".el"))
                   (insert
                    (format "(with-eval-after-load '%s\n\n)\n\n(provide '%s)" pkg full))
                   (goto-char (point-min)))))

(defun weiss-complete-emacs-config-module-names (s)
  "DOCSTRING"
  (interactive)
  (-let
      [((pkg module)
        alist
        res class parent)
       (list
        (split-string s " ")
        '(("a" . "abbrevs")
          ("sn" . "snails")
          ("ltx" . "latex")
          ("e" . "edit")
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
          ("q" . "quick-insert")))
       ]
    (list (or (cdr (assoc pkg alist)) pkg) (or (cdr (assoc module alist)) module))))

(provide 'snails-backend-emacs-config)
;;; snails-backend-emacs-config.el ends here



