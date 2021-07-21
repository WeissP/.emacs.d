(setq emacs-host "arch without roam")
(defvar weiss/config-path "/home/weiss/.emacs.d/emacs-config/")
(defvar weiss/local-package-path "/home/weiss/.emacs.d/local-package/")
(defvar weiss/launch-time (current-time))
(defvar weiss/cursor-color "#4078f2")
(defvar weiss/cursor-type '(bar . 2))
(defvar after-dump-packages '(weiss_after-dump-misc all-the-icons display-line-numbers server rime telega emacs-yakuake tramp gcmh))

(setq weiss-dumped-p t)

;; Disable GC
(setq gc-cons-threshold most-positive-fixnum
      gc-cons-percentage 0.6)

(load (concat weiss/config-path "weiss_startup.el"))

(add-to-list 'load-path "/home/weiss/.emacs.d/straight/repos/emacs-doom-themes/")
(require 'doom-themes)
(load "/home/weiss/.emacs.d/straight/repos/emacs-doom-themes/doom-themes.el")
(load-theme 'doom-one-light t t)

;; (load "/home/weiss/.emacs.d/recentf")

(weiss-load-module weiss/emacs-config-modules-without-roam nil)
;; (load "/home/weiss/.emacs.d/dumped-packages.el")

;; We have to unload tramp in pdump, otherwise tramp will not work.
(tramp-unload-tramp)

(save-place-mode -1)
(setq weiss-dumped-load-path load-path)
(dump-emacs-portable "~/.emacs.d/emacs.pdmp")
