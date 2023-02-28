;; filter-buffer

;; [[file:../emacs-config.org::*filter-buffer][filter-buffer:1]]
;;; Require
(require 'snails-core)

;;; Code:

(setq snails-backend-filter-buffer-blacklist
      (list
       snails-input-buffer
       snails-content-buffer
       "<none>.tex"
       "frag-master.tex"
       "_region_.tex"
       " tq-temp-epdfinfo"
       ;; " *code-conversion-work*"
       ;; " *Echo Area "
       ;; " *Minibuf-"
       ;; " *Custom-Work*"
       ;; " *pyim-page-tooltip-posframe-buffer*"
       ;; " *load"
       ;; " *server"
       ;; " *snails tips*"
       ;; "*eaf*"
       ;; " *company-box-"
       ;; " *emacsql"
       ;; " *org-src-fontification:"
       ;; " *which-key"
       ;; " *counsel"
       ;; " *temp file*"
       ;; "*dashboard*"
       ;; "*straight-process*"
       ;; " *telega-server*"
       ;; "*tramp/"
       ;; " *Org todo*"
       ;; " *popwin dummy*"
       ))

(setq snails-backend-filter-buffer-whitelist
      (list
       "*scratch*"
       "*Messages*"
       "backup_"
       "*gud-test*"
       "*Telega Root*"
       "*SQL: Postgres*"
       "*ein:"
       "*cider-repl"))

(setq snails-backend-filter-buffer-blacklist-RegEx
      (list
       ;; "\*....\-....\-....\-....\-....\-....\-...."
       "\*.*"
       "Ʀ.*\.org"))

(defun snails-backend-filter-buffer-whitelist-buffer (buf)
  (let ((r nil))
    (dolist (whitelist-buf snails-backend-filter-buffer-whitelist r)
      (when (string-prefix-p whitelist-buf (buffer-name buf))
        (setq r t)))))

(defun snails-backend-filter-buffer-not-blacklist-buffer (buf)
  (catch 'failed
    (dolist (backlist-buf snails-backend-filter-buffer-blacklist)
      (when (string-prefix-p backlist-buf (buffer-name buf))
        (throw 'failed nil)))
    t))

(defun snails-backend-filter-buffer-not-blacklist-buffer-RegEx (buf)
  (catch 'failed
    (dolist (backlist-buf snails-backend-filter-buffer-blacklist-RegEx)
      (when (string-match backlist-buf (buffer-name buf))
        (throw 'failed nil)))
    t))

(defun weiss-buffer-name-limit (str limit-number)
  "DOCSTRING"
  (interactive)
  (if (> (length str) limit-number)
      (substring str 0 limit-number)
    str))

(defun filter--check-if-mode (buf mode)
  "Check if buf is in some mode. mode is a string"
  (interactive)
  (string-match mode
                (format "%s" (with-current-buffer buf major-mode))))

(snails-create-sync-backend
 :name "FILTER-BUFFER"

 :candidate-filter (lambda
                     (input)
                     (let (candidates)
                       ;; (let ((rest-buffer-list (cdr (buffer-list))))
                       ;; (dolist (buf rest-buffer-list)
                       (catch 'search-end
                         (dolist (buf (buffer-list))
                           (when (and
                                  (not (string=
                                        (buffer-name snails-start-buffer)
                                        (buffer-name buf)))
                                  (or
                                   (and
                                    (snails-backend-filter-buffer-whitelist-buffer buf)
                                    (snails-match-input-p input (buffer-name buf)))
                                   (and
                                    (snails-backend-filter-buffer-not-blacklist-buffer buf)
                                    (snails-backend-filter-buffer-not-blacklist-buffer-RegEx buf)
                                    (or
                                     (string-equal input "")
                                     (snails-match-input-p input (buffer-name buf))
                                     (and
                                      (filter--check-if-mode buf "eaf")
                                      (snails-match-input-p input
                                                            (concat "eaf "
                                                                    (buffer-name buf))))
                                     (and
                                      (filter--check-if-mode buf "dired")
                                      (snails-match-input-p input
                                                            (concat "di "
                                                                    (buffer-name buf))))))))
                             (snails-add-candiate 'candidates
                                                  (buffer-name buf)
                                                  (buffer-name buf)))
                           (when (> (length candidates) 10) (throw 'search-end nil))))
                       (snails-sort-candidates input candidates 1 1)
                       candidates))

 :candidate-icon (lambda (candidate) (snails-render-buffer-icon candidate))

 :candidate-do (lambda (candidate) (switch-to-buffer candidate)))

(provide 'snails-backend-filter-buffer)



;;; snails-backend-filter-buffer.el ends here
;; filter-buffer:1 ends here
