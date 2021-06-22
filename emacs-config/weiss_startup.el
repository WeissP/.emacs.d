(package-initialize)
(require 'cl)
(require 'cl-lib)
(require 'package)
(require 'mode-local)

(setq package-archives
      '(("gnu"   . "http://elpa.gnu.org/packages/")
        ("org" . "https://orgmode.org/elpa/")
        ("melpa" . "http://melpa.org/packages/")))

(unless (package-installed-p 'quelpa)
  (with-temp-buffer
    (url-insert-file-contents "https://raw.githubusercontent.com/quelpa/quelpa/master/quelpa.el")
    (eval-buffer)
    (quelpa-self-upgrade)))

(setq quelpa-checkout-melpa-p nil)
(setq quelpa-update-melpa-p nil)
(setq quelpa-self-upgrade nil)

(add-to-list 'load-path weiss/config-path)
(add-to-list 'load-path weiss/local-package-path)
(let ((default-directory weiss/local-package-path))
  (normal-top-level-add-subdirs-to-load-path)
  )
(add-to-list 'load-path "/usr/local/texlive/2020/bin/x86_64-linux")
(add-to-list 'load-path "/home/weiss/.emacs.d/org-mode/lisp/")

(setq weiss-dumped-load-path load-path)

(require 'weiss-Emacs-Config-Manager)
(require 'weiss_modules)
