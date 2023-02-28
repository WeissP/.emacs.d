(save-place-mode 1)
(winner-mode)

(defvar weiss/config-path (with-init-path "/emacs-config/"))
(defvar weiss/configs-dir (concat weiss/config-path "config/"))
(defvar weiss/local-package-path (with-init-path "/local-package/"))
(defvar weiss/local-package-path-autoloads (concat weiss/local-package-path "loaddefs.el"))
(defvar weiss/cursor-color "#4078f2")
(defvar weiss/cursor-type '(bar . 2))

(defun weiss-update-local-packages-autoloads ()
  "DOCSTRING"
  (interactive)
  (dolist (dir (seq-filter
                'file-directory-p
                (directory-files weiss/local-package-path t "^[^.]") ;ignore /. and /..
                )) 
    (make-directory-autoloads dir weiss/local-package-path-autoloads)
    )
  )

(unless (file-exists-p weiss/local-package-path-autoloads)
  (message "autoloads of local packages do not exist, generating...")
  (weiss-update-local-packages-autoloads)
  )
(load weiss/local-package-path-autoloads)

(setq vanilla-global-map (current-global-map))
(load (concat weiss/config-path "weiss_startup.el"))
(weiss-load-module weiss/emacs-config-modules nil)

(setq kill-ring-max 9999)

