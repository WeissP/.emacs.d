(defvar snails-emacs-config-path "~/.emacs.d/emacs-config/config/")
(defvar EmacsConfigManager-path
  (or
   (ignore-errors (executable-find "emacs_config_finder"))
   "~/.cargo/bin/emacs_config_finder"))

(defvar emacs-config-disabled-pkg-per-host
  '(("arch without roam" . (org-roam snails-roam))))

(defun emacs-config-disabled-per-host-p (pkg)
  "DOCSTRING"
  (interactive)
  (let ((black-list
         (cdr (assoc emacs-host emacs-config-disabled-pkg-per-host))))
    (member pkg black-list)))

(defun emacs-config-get-all-parents (child)
  "DOCSTRING"
  (interactive)
  (shell-command-to-string
   (format "%s get all-parents %s" EmacsConfigManager-path child)))

(defun emacs-config-get-files-by-class (class)
  "DOCSTRING"
  (interactive)
  (seq-filter
   (lambda (x) (string-prefix-p (concat "weiss_" class "_") x))
   (directory-files snails-emacs-config-path)))

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
  ;; (message "class: %s" class)
  ;; (when (cl-search "display" class) (message "class: %s" file))
  (let ((files (emacs-config-get-files-by-class class)))
    (dolist (file files)
      ;; (when (cl-search "display" file) (message "file: %s" file))
      (if log-file
          (weiss-insert-require log-file
                                (weiss-process-provide file))
        (require (intern (weiss-process-provide file)))))))

(defun weiss-load-module (package-list &optional log-file)
  (interactive)
  (dolist (package package-list)
    (if (listp package)
        (let ((name (car package))
              (plist (cdr package))
              (condition (plist-get (cdr package) :when))
              install-command after-dump-p)
          (when (and
                 (not (plist-get plist :disabled))
                 (not (emacs-config-disabled-per-host-p name))
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
            (cond
             ((plist-get plist :local)
              (ignore)
              )
             ((plist-member plist :github)
              (setq install-command
                    `(straight-use-package
                      '(,name
                        :type git
                        :host github
                        :repo ,(weiss-process-git-link
                                (plist-get plist :github))))))
             ((plist-member plist :gitlab)
              (setq install-command
                    `(straight-use-package
                      '(,name
                        :type git
                        :host gitlab
                        :repo ,(weiss-process-git-link
                                (plist-get plist :gitlab))))))
             ((plist-member plist :file)
              (setq install-command
                    `(straight-use-package
                      '(,name :files
                              ,(plist-get plist :file)))))
             ((plist-member plist :straight)
              (setq install-command
                    `(straight-use-package
                      ',(plist-get plist :straight))))
             ((plist-member plist :name)
              (setq install-command
                    `(straight-use-package
                      ',(plist-get plist :name))))
             (t
              (setq install-command `(straight-use-package ',name))))
            
            (when (plist-member plist :build)
              (let* ((pl (cadr (cadr install-command)))
                     (new-pl (append pl (list :build (plist-get plist :build)))))
                (setq install-command `(straight-use-package ',new-pl)) 
                )                
              )
            (when install-command
              (if log-file
                  (weiss-insert-to-log-file log-file
                                            (format "%s" install-command))
                (eval install-command)))
            (if-let ((autoloads (plist-get plist :autoloads)))
                (dolist (fn autoloads) 
                  (let ((cmd `(autoload ',fn ,(symbol-name name)))
                        )
                    (if log-file
                        (weiss-insert-to-log-file
                         log-file
                         (format "%s" cmd))
                      (eval cmd)) 
                    )
                  
                  )              
              )
            (when (plist-member plist :load)
              (if log-file
                  (weiss-insert-require log-file
                                        (symbol-name name))
                (require name))
              )              
            
            (weiss-load-module (plist-get plist :then) log-file)
            ))
      (unless (emacs-config-disabled-per-host-p package)                
        (weiss-require-config-by-class
         (symbol-name package)
         log-file)
        (if log-file
            (weiss-insert-to-log-file log-file
                                      (format
                                       "(straight-use-package '%s)" package))
          (straight-use-package package)          
          )
        )
      )))

(defun weiss-insert-require-to-log-file ()
  "DOCSTRING"
  (interactive)
  (let ((inhibit-message t))
    (erase-buffer)
    (weiss-load-module weiss/emacs-config-modules (buffer-file-name)))
  )

(provide 'weiss-Emacs-Config-Manager)
