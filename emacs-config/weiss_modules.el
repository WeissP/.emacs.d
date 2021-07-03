(setq weiss/emacs-config-modules-ros
      '(
        (global :skip-install t) 
        (gnu-elpa-keyring-update :elpa t)
        rg esup which-key super-save keyfreq bind-key
        (wks
         :skip-install t
         :first (
                 ;; (weiss-select-mode :local t)
                 ;; (weiss-temp-insert-mode :local t)
                 hydra
                 ))
        
        (snails
         :local t
         ;; :then ((snails-roam :github "WeissP/snails-roam")))
         :then ((snails-roam :local t)))
        (dired
         :local t
         ;; :after-dump-all t
         :then (
                wdired diredfl all-the-icons-dired dired-hacks-utils dired-avfs dired-collapse
                dired-quick-sort peep-dired dired-filter (weiss-dired-single-handed-mode :local t)
                )
         )
        (counsel
         :then (amx prescient ivy-prescient ivy-rich)
         )
        (abbrevs :skip-install t)
        (ui     
         :skip-install t
         :first (doom-themes)
         :then (
                (modeline :skip-install t) popwin
                (doom-modeline  :disabled t) (nyan-mode :disabled t)
                highlight-indent-guides
                (rainbow-mode :github "emacsmirror/rainbow-mode")
                highlight-parentheses hl-todo (color-outline :local t)
                highlight-symbol anzu hl-line web-beautify origami (whitespace :disabled t)
                (ligature :github "mickeynp/ligature.el")
                (all-the-icons :when (display-graphic-p) )
                command-log-mode emojify (hideshow :disabled t)
                (display-line-numbers :local t )
                (font-lock-face :skip-install t)
                )
         )
        (company :then (company-box))

        (rotate-text :github "nschum/rotate-text.el")
        (casease :github "DogLooksGood/casease" :disabled t)
        
        expand-region    
        (xml-mode :skip-install t) web-mode php-mode dockerfile-mode

        (lsp-mode
         :then (lsp-ui ccls)
         )

        (magit :then (
                      git-timemachine git-messenger browse-at-remote gitattributes-mode
                      gitignore-mode gitconfig-mode))
        (flycheck :then ((flycheck-posframe :when (display-graphic-p))))
        projectile  magit
        (tramp :after-dump-all t :local t :then (sudo-edit counsel-tramp docker-tramp))
        (recentf  :local t)
        (gcmh )
        (weiss-paredit :local t)
        ))

(setq weiss/emacs-config-modules
      '(
        (global :skip-install t) (table :skip-install t)
        rg (server  :local t) quickrun esup which-key super-save keyfreq bind-key
        (wks
         :skip-install t
         :first (
                 ;; (weiss-select-mode :local t)
                 ;; (weiss-temp-insert-mode :local t)
                 hydra
                 ))
        (org
         :local t
         :first ((weiss-org-sp-mode :skip-install t))
         :then (
                (babel
                 :skip-install t
                 :first (
                         ob-fsharp ob-C ob-go ob-rust ob-java ob-sql-mode
                         (ob-javascript :github "zweifisch/ob-javascript"))
                 )
                (org-agenda :local t)
                (org-tempo :local t)
                (org-roam
                 :then (org-roam-server org-roam-protocol (org-transclusion :disabled t)))
                org-fancy-priorities
                (org-table-to-qmk-keymap :local t)
                (org-bullets :disabled t)
                (org-rich-yank :disabled t)
                )
         )
        (latex
         :elpa auctex
         :then (
                (ox-latex :local t)
                (org-edit-latex :local t)     
                magic-latex-buffer
                )
         )
        (snails
         :local t
         ;; :then ((snails-roam :github "WeissP/snails-roam")))
         :then ((snails-roam :local t)))
        (dired
         :local t
         ;; :after-dump-all t
         :then (
                wdired diredfl all-the-icons-dired dired-hacks-utils dired-avfs dired-collapse
                dired-quick-sort peep-dired dired-filter
                (weiss-dired-single-handed-mode :local t)
                )
         )
        (counsel
         :then (amx prescient ivy-prescient ivy-rich)
         )
        (abbrevs :skip-install t)
        (ui     
         :skip-install t
         :then (
                doom-themes
                (modeline :skip-install t) popwin
                (nyan-mode :disabled t)
                highlight-indent-guides
                (rainbow-mode :github "emacsmirror/rainbow-mode")
                highlight-parentheses hl-todo (color-outline :local t)
                highlight-symbol anzu hl-line web-beautify origami (whitespace :disabled t)
                (ligature :github "mickeynp/ligature.el")
                (all-the-icons :when (display-graphic-p) )
                command-log-mode emojify (hideshow :disabled t)
                (display-line-numbers :local t )
                (font-lock-face :skip-install t)
                )
         )
        (company :then (company-box))

        (rotate-text :github "nschum/rotate-text.el")
        (casease :github "DogLooksGood/casease" :disabled t)
        expand-region    
        (js :skip-install t :then (js-format))
        json-mode (cider :then (flycheck-clj-kondo))
        (python :local t :then (yapfify ein))
        (http :then (auto-rename-tag)) markdown-mode 
        (xml-mode :skip-install t) web-mode php-mode dockerfile-mode
        (go-mode
         :then (
                go-impl go-fill-struct
                (flycheck-golangci-lint :disabled t)
                (go-tag :disabled t) (go-gen-test :disabled t) (gotest :disabled t)
                )
         )
        (sql :then ((sql-indent :github "alex-hhh/emacs-sql-indent")))
        (haskell :skip-install t :then ((hasky-stack :disabled t) ormolu))

        (lsp-mode
         :then (lsp-ui lsp-java lsp-python-ms ccls lsp-haskell)
         )

        (csv-mode :elpa csv-mode)
        (magit :then (
                      git-timemachine git-messenger browse-at-remote gitattributes-mode
                      gitignore-mode gitconfig-mode))
        (aweshell :github "manateelazycat/aweshell") (vterm :disabled t)
        (pdf-tools :then (pdf-view pdf-view-restore))
        (flycheck :then ((flycheck-posframe :when (display-graphic-p))))
        (flyspell :skip-install t :then (wucuo))    
        rime
        (telega :quelpa (telega :fetcher github
                                :repo "zevlg/telega.el"
                                :branch "master"
                                :files (:defaults "contrib" "etc" "server" "Makefile"))) 
        (yasdcv :local t)
        projectile maxima magit
        (tramp :after-dump-all t :local t :then (sudo-edit counsel-tramp docker-tramp))
        (recentf  :local t)
        (emacs-yakuake :local t )
        gcmh 
        (weiss-paredit :local t)
        (citre :github "universal-ctags/citre")
        ))

(provide 'weiss_modules)
