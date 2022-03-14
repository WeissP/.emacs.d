(defvar weiss/config-path "/home/weiss/.emacs.d/emacs-config/")
(defvar weiss/local-package-path "/home/weiss/.emacs.d/local-package/")
(defvar weiss/launch-time (current-time))
(defvar weiss/cursor-color "#4078f2")
(defvar weiss/cursor-type '(bar . 2))

(setq vanilla-global-map (current-global-map))
(defvar weiss-dumped-p nil)
(if weiss-dumped-p
    (progn
      (setq load-path weiss-dumped-load-path)
      ;; Some shim code for tramp
      (defun tramp-file-name-method--cmacro (&rest args))
      (require 'tramp)
      (setq tramp-mode 1)
      (global-font-lock-mode t)
      (transient-mark-mode t))
  (load (concat weiss/config-path "weiss_startup.el"))
  (weiss-load-module weiss/emacs-config-modules nil)
  )
(when (string= emacs-host "ros-docker")
  (setq counsel-fzf-cmd "/home/weiss/fzf/bin/fzf -f \"%s\"")
  (setq rg-executable "/home/weiss/ripgrep/rg"))

(dolist (x after-dump-packages) (require x))

(save-place-mode 1)
(winner-mode)
(recentf-mode -1)

(global-tab-line-mode)
(weiss-load-file-groups)

(setq gc-cons-threshold
      (* (expt 1024 3) 6)
      gc-cons-percentage 0.5
      garbage-collection-messages nil)

(message "Emacs is ready, startup cost: %.3f seconds."
         (time-to-seconds (time-since weiss/launch-time)))
(setq weiss/launch-time nil)
