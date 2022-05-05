(require 'cl-lib)
(require 'mode-local)

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer (url-retrieve-synchronously
                          "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
                          'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(add-to-list 'load-path weiss/config-path)
(add-to-list 'load-path (concat weiss/config-path "config"))
(add-to-list 'load-path weiss/local-package-path)
(let ((default-directory weiss/local-package-path))
  (normal-top-level-add-subdirs-to-load-path))
(add-to-list 'load-path "/usr/local/texlive/2020/bin/x86_64-linux")
(add-to-list 'load-path "/home/weiss/.emacs.d/org-mode/lisp/")


(setq after-dump-packages
      (pcase emacs-host
        ("ros-docker"
         '(weiss_after-dump-misc all-the-icons display-line-numbers server recentf tramp gcmh))
        ("arch without roam"
         '(weiss_after-dump-misc all-the-icons display-line-numbers server rime telega tramp gcmh))
        (_
         '(weiss_after-dump-misc
           all-the-icons display-line-numbers server rime telega tramp gcmh org-roam snails-roam
           ))))



(require 'weiss-Emacs-Config-Manager)
(require 'weiss_modules)
