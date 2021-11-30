(setq emacs-host-list '("arch" "arch without roam" "ros"))

(setq emacs-host (nth 0 emacs-host-list))
;; (setq emacs-host "arch")
(load "/home/weiss/.emacs.d/emacs-config/weiss_init.el")
(put 'dired-find-alternate-file 'disabled nil)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("835868dcd17131ba8b9619d14c67c127aa18b90a82438c8613586331129dda63" default))
 '(safe-local-variable-values
   '((weiss-pdf-candidates "/home/weiss/Documents/Vorlesungen/PA/PA-ALL-1.pdf")
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
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
