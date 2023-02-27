(require 'weiss-org-sp_predicate)
(require 'weiss-org-sp_functions)

(defvar weiss-org-sp-mode-map (make-sparse-keymap))

(defun wos--conditional-define-key (keymap key-cmd-list fun)
  (interactive)
  (mapc
   (lambda (cmd-key)
     (let ((key (car cmd-key))
           (cmd (cdr cmd-key))
           )
       (define-key keymap (kbd key)
         `(menu-item "" ,cmd
                     :filter ,fun)
         )
       )
     )
   key-cmd-list)
  )

;; only work in special position
(let ((key-cmd-list '(
                      ("j" . weiss-org-sp-down)
                      ("k" . weiss-org-sp-up)
                      ("i" . weiss-org-sp-left)
                      ("l" . weiss-org-sp-right)
                      ("r" . weiss-org-refile)
                      ("v" . org-paste-special)
                      ("w" . org-narrow-to-subtree)
                      ))
      (fun (lambda (cmd) (interactive) (when (weiss-org-sp--special-p) cmd))))
  (wos--conditional-define-key weiss-org-sp-mode-map key-cmd-list fun)  
  )

;; only work in heading or #+ block begin and there is no active region
(let ((key-cmd-list '(
                      ("c" . weiss-org-sp-copy)
                      ("d" . weiss-org-sp-cut)
                      ))
      (fun (lambda (cmd) (interactive)
             (when (and (not (use-region-p))
                        (or (org-at-heading-p) (looking-at-p weiss-org-sp-sharp-begin))) cmd))))
  (wos--conditional-define-key weiss-org-sp-mode-map key-cmd-list fun)  
  )

;;;###autoload
(define-minor-mode weiss-org-sp-mode
  "weiss-org-sp-mode"
  :keymap weiss-org-sp-mode-map
  )

(provide 'weiss-org-sp)
