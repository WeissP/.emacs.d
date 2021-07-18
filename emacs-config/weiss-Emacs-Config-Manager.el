(add-to-list 'exec-path "~/go/bin")
(defvar snails-emacs-config-path "~/.emacs.d/emacs-config/")
(defvar EmacsConfigManager-path
  (or
   (ignore-errors (executable-find "EmacsConfigManager"))
   "~/go/bin/EmacsConfigManager"))

(defun emacs-config-add-file (module class)
  "DOCSTRING"
  (interactive)
  (shell-command-to-string
   (format "%s add file %s %s" EmacsConfigManager-path module class)))

(defun emacs-config-add-relation(child parent)
  "DOCSTRING"
  (interactive)
  (shell-command
   (format "%s add parent %s %s"
           EmacsConfigManager-path
           child parent)))

(defun emacs-config-get-all-parents (child)
  "DOCSTRING"
  (interactive)
  (shell-command-to-string
   (format "%s get all-parents %s" EmacsConfigManager-path child)))

(defun emacs-config-get-files-by-class (class)
  "DOCSTRING"
  (interactive)
  (seq-filter
   (lambda (x) (> (length x) 1))
   (split-string
    (shell-command-to-string
     (format "%s get files %s" EmacsConfigManager-path class))
    "\n")))

;; (emacs-config-delete-file "ob-clojure" "org")

(defun emacs-config-delete-file (module class)
  "DOCSTRING"
  (interactive)
  (shell-command
   (format "%s delete file %s %s"
           EmacsConfigManager-path
           module class)))

(defun emacs-config-delete-relation (child)
  "DOCSTRING"
  (interactive)
  (shell-command
   (format "%s delete relation %s" EmacsConfigManager-path child)))

(defun weiss-process-provide (filename)
  "DOCSTRING"
  (interactive)
  (file-name-nondirectory (file-name-sans-extension filename)))

(defun weiss-insert-require (log-file name)
  "DOCSTRING"
  (interactive)
  (find-file log-file)
  (goto-char (point-max))
  (insert (format "\n(require '%s)" name)))

(defun weiss-insert-to-log-file (log-file content)
  "DOCSTRING"
  (interactive)
  (find-file log-file)
  (goto-char (point-max))
  (insert content))

(defun weiss-process-git-link (link)
  "process git link as the format of quelpa"
  (interactive)
  (if (string-prefix-p "git@github.com" link)
      (substring link 15 -4)
    link))

(defun weiss-require-config-by-class (class &optional log-file)
  "DOCSTRING"
  (interactive)
  (let ((files (emacs-config-get-files-by-class class)))
    ;; (message "class:%s" class)
    ;; (message "files:%s" files)
    (dolist (file files)
      (if log-file
          (weiss-insert-require log-file
                                (weiss-process-provide file))
        (require (intern (weiss-process-provide file)))))))

(defun weiss-load-module (package-list &optional log-file)
  "`after-dump' means only skip installing package, after-dump-all means skip package and also all configs"
  (interactive)
  (dolist (package package-list)
    (if (listp package)
        (let ((name (car package))
              (plist (cdr package))
              (condition (plist-get (cdr package) :when))
              install-command)
          (when (and
                 (not (plist-get plist :disabled))
                 (or
                  (not condition)
                  (if (listp (eval condition))
                      (eval (eval condition))
                    (eval condition))))
            (weiss-load-module (plist-get plist :first) log-file)

            (weiss-require-config-by-class
             (symbol-name name)
             log-file)

            (setq install-command nil)
            (when (not (plist-get plist :skip-install))
              (cond
               ((plist-get plist :local)
                (ignore))
               ((plist-get plist :skip-install)
                (ignore))
               ((plist-member plist :github)
                (setq install-command
                      `(straight-use-package
                        '(,name
                          :type git
                          :host github
                          :repo ,(weiss-process-git-link
                                  (plist-get plist :github))))))
               ((plist-member plist :file)
                (setq install-command
                      `(straight-use-package
                        '(,name :files
                                ,(plist-get plist :file))))
                )
               ((plist-member plist :straight)
                ;; (message "quelpa: %s" (plist-get plist :quelpa))
                (setq install-command
                      `(straight-use-package ',(plist-get plist :straight))))
               ((plist-member plist :name)
                ;; (message "quelpa: %s" (plist-get plist :quelpa))
                (setq install-command
                      `(straight-use-package ',(plist-get plist :name))))
               ;; ((plist-member plist :name)
               ;;  (message ": %s" (plist-get plist :quelpa))
               ;;  ;; (quelpa (plist-get plist :quelpa))
               ;;  )
               (t (setq install-command `(straight-use-package ',name))))
              (when install-command
                (if log-file
                    (weiss-insert-to-log-file log-file
                                              (format "%s" install-command))
                  (eval install-command)))
              (unless (member name after-dump-packages)
                (if log-file
                    (weiss-insert-require log-file
                                          (symbol-name name))
                  (require name))))
            (weiss-load-module (plist-get plist :then) log-file)))
      ;; (message "load: %s" (symbol-name package))
      (weiss-require-config-by-class (symbol-name package) log-file)
      (if log-file
          (progn
            (weiss-insert-to-log-file log-file
                                      (format "(straight-use-package '%s)" package))
            (weiss-insert-require log-file (symbol-name package)))
        (straight-use-package package)
        (require package))))
  )

;; weiss/emacs-config-modules-ros
(defun weiss-insert-require-to-log-file ()
  "DOCSTRING"
  (interactive)
  (let ((file "/home/weiss/.emacs.d/dumped-packages.el")
        )
    (find-file file)
    (erase-buffer)
    (weiss-load-module weiss/emacs-config-modules file)))

(defun weiss-test ()
  "DOCSTRING"
  (interactive)
  (snails '(snails-backend-emacs-config-test)))

;; (setq weiss/emacs-config-modules '((global  :skip-install t)))
;; (weiss-require-config-by-class "global" "/home/weiss/.emacs.d/dumped-packages.el")
;; (emacs-config-get-files-by-class "global")
(provide 'weiss-Emacs-Config-Manager)
;; (emacs-config-get-files-by-class "")
