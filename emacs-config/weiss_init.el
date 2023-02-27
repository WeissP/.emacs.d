(save-place-mode 1)
(winner-mode)

(defvar weiss/config-path (with-init-path "/emacs-config/"))
(defvar weiss/local-package-path (with-init-path "/local-package/"))
(defvar weiss/local-package-path-autoloads (concat weiss/local-package-path "loaddefs.el"))
(defvar weiss/launch-time (current-time))
(defvar weiss/cursor-color "#4078f2")
(defvar weiss/cursor-type '(bar . 2))

(defun weiss-update-local-packages-autoloads ()
  "DOCSTRING"
  (interactive)
  (let ((dirs (seq-filter
               'file-directory-p
               (directory-files weiss/local-package-path)))
        )
    (make-directory-autoloads dirs weiss/local-package-path-autoloads)    
    )
  )
(load weiss/local-package-path-autoloads)

(setq vanilla-global-map (current-global-map))
(load (concat weiss/config-path "weiss_startup.el"))
(weiss-load-module weiss/emacs-config-modules nil)

(setq gc-cons-threshold
      (* (expt 1024 3) 6)
      gc-cons-percentage 0.5
      garbage-collection-messages nil)

(setq kill-ring-max 9999)

(message "Emacs is ready, startup cost: %.3f seconds."
         (time-to-seconds (time-since weiss/launch-time)))
(setq weiss/launch-time nil)
