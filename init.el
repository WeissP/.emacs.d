(setq gc-cons-threshold most-positive-fixnum ; 2^61 bytes
      gc-cons-percentage 0.6)
(add-hook 'emacs-startup-hook
          (lambda ()
            (setq gc-cons-threshold
                  (* (expt 1024 3) 6)
                  gc-cons-percentage 0.5
                  garbage-collection-messages nil)))

(defun display-startup-time ()
  (message
   "Emacs is ready, startup cost: %.3f seconds."
   (float-time
    (time-subtract after-init-time before-init-time))))
(add-hook 'emacs-startup-hook #'display-startup-time)

(setq emacs-host-list '("arch" "arch without roam" "ros" "mac"))
(setq weiss/init-path "~/.emacs.d")

(defun with-init-path (p) (concat weiss/init-path p))

(load (with-init-path "/weiss-emacs-host.el"))
(load (with-init-path "/emacs-config/weiss_init.el"))
(load (with-init-path "/nix-extra.el"))

(put 'dired-find-alternate-file 'disabled nil)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ignored-local-variable-values '((eval eglot-ensure)))
 '(safe-local-variable-values
   '((weiss-pdf-candidates "/home/weiss/Documents/Vorlesungen/data-visualization/Slides/10_Scalarfields_small.pdf")
     (weiss-pdf-candidates "/home/weiss/Documents/Vorlesungen/data-visualization/Slides/09_Graphs_small.pdf")
     (weiss-pdf-candidates "/home/weiss/Documents/Vorlesungen/data-visualization/Slides/06_HighD_PCA.pdf")
     (weiss-pdf-candidates "/home/weiss/Documents/Vorlesungen/data-visualization/Slides/06_HighDData_small.pdf")
     (dired-listing-switches . "-al")
     (weiss-pdf-candidates "~/Documents/Vorlesungen/Middleware/middleware_Slides/Chapter3-DBGateways.pdf")
     (weiss-pdf-candidates "/home/weiss/Documents/Vorlesungen/Middleware/middleware_Slides/Chapter3-DBGateways.pdf")
     (weiss-pdf-candidates "/home/weiss/Documents/Vorlesungen/Middleware/Slides/Chapter 2 - Distributed Information Systems.pdf")
     (comment-fill-column . 80)
     (eval eglot-ensure)
     (org-latex-default-class . "report")
     (weiss-org-image-folder . "/home/weiss/Documents/Org-roam/orgzly/fig/")
     (weiss-org-image-folder . "/home/weiss/Documents/Org-roam/orgzly/fig")
     (weiss-org-image-folder . "/home/weiss/Documents/Vorlesungen/bachelorarbeit/org/fig/")
     (org-latex-default-class . "dbis-thesis")
     (org-latex-default-class . "weiss-Paper")
     (org-latex-default-class . "weiss-paper")
     (weiss-org-image-folder . "/home/weiss/Documents/Vorlesungen/bachelorarbeit/org/fig")
     (org-latex-default-class . "article")
     (weiss-org-image-folder . "/home/weiss/Documents/Vorlesungen/Seminar/bachelor/report/fig/")
     (go-test-args . "-timeout 300ms")
     (go-test-args . "-timeout 0ms")
     (weiss-pdf-candidates "/home/weiss/Documents/Vorlesungen/PA/PA-ALL-1.pdf")
     (weiss-pdf-candidates "/home/weiss/Documents/Vorlesungen/PA/PA-ALL-1_flatten.pdf")
     (lsp-haskell-server-path . "haskell-language-server-8.10.4")
     (lsp-haskell-server-path . "/usr/bin/haskell-language-server-8.10.4")
     (lsp-haskell-server-path . "/usr/bin/haskell-language-server-8.10.5")
     (company-backends
      (company-citre :separate))
     (elisp-lint-indent-specs
      (describe . 1)
      (it . 1)
      (org-element-map . defun)
      (org-roam-with-temp-buffer . 1)
      (org-with-point-at . 1)
      (magit-insert-section . defun)
      (magit-section-case . 0)
      (->> . 1)
      (org-roam-with-file . 2))
     (elisp-lint-ignored-validators "byte-compile" "package-lint"))))

(put 'narrow-to-region 'disabled nil)

(load-file (let ((coding-system-for-read 'utf-8))
             (shell-command-to-string "agda-mode locate")))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-variable-name-face ((t (:foreground "#383a42")))))
