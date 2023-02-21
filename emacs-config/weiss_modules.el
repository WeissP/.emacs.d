(setq weiss/emacs-config-modules
      '((global :skip-install t)
        exec-path-from-shell
        (table :skip-install t)
        rg
        (server  :local t)
        (email :skip-install t)
        quickrun esup which-key super-save keyfreq bind-key
        (wks :skip-install t :first (;; (weiss-select-mode :local t)
                                     ;; (weiss-temp-insert-mode :local t)
                                     hydra))
        (org
         :first ((weiss-org-sp-mode :skip-install t))
         :then ((babel
                 :skip-install t
                 :first (ob-fsharp
                         (ob-C :skip-install t)
                         ob-go
                         (ob-java :skip-install t)
                         ob-sql-mode
                         (ob-javascript :github "zweifisch/ob-javascript")))
                org-noter
                (org-agenda :local t)
                (org-tempo :local t)
                (org-roam :then
                          ((snails-roam :github "WeissP/snails-roam")))
                org-fancy-priorities
                (org-appear :github "awth13/org-appear" :disabled nil)
                (org-table-to-qmk-keymap :local t)
                (org-bullets :disabled t)
                (org-rich-yank :disabled t)))
        (latex
         :name auctex
         :then ((ox-latex :local t)
                (org-edit-latex :local t)
                org-ref
                magic-latex-buffer
                latex-preview-pane))
        (dired
         :local t
         :then (wdired diredfl (all-the-icons-dired :github "jtbm37/all-the-icons-dired") dired-hacks-utils dired-avfs dired-collapse
                       dired-quick-sort peep-dired dired-filter
                       (weiss-dired-single-handed-mode :local t)))
        (snails :local t)
        (mct :gitlab "protesilaos/mct" :disabled t)
        (vertico :then ((vertico-directory :local t))) 
        orderless
        marginalia
        consult
        (isearch :skip-install t)
        (abbrevs :skip-install t)
        (ui
         :skip-install t
         :then ((modeline :skip-install t)
                popwin
                (nyan-mode :disabled t)
                highlight-indent-guides
                highlight-defined
                (rainbow-mode :github "emacsmirror/rainbow-mode")
                highlight-parentheses hl-todo
                (color-outline :disabled t :local t)
                highlight-symbol anzu hl-line web-beautify origami
                (whitespace :disabled t)
                (ligature :github "mickeynp/ligature.el")
                (all-the-icons :when (display-graphic-p))
                command-log-mode emojify
                (hideshow :disabled t)
                (display-line-numbers :local t )
                (pulsar :github "protesilaos/pulsar" :disabled t)
                ))
        (company :then (company-box))
        (rotate-text :github "nschum/rotate-text.el")
        (casease :github "DogLooksGood/casease" :disabled t)
        expand-region
        (rjsx-mode :then ((prettier-js :disabled t)))
        json-mode
        (swagger-mode :github "Nooby/swagger-mode" :disabled t)
        (cider :disabled nil :then ((zprint :github "git@github.com:DogLooksGood/zprint.el.git")))
        (python :local t :then (yapfify ein))
        (http :then (auto-rename-tag))
        markdown-mode
        (xml-mode :skip-install t)
        (mhtml-mode :skip-install t :disabled nil)
        web-mode php-mode dockerfile-mode
        (gud :skip-install t)
        (go-mode
         :then (go-impl go-fill-struct
                        (go-tag :disabled t)
                        go-gen-test
                        gotest
                        go-dlv
                        go-impl
                        go-eldoc))
        (rustic :disabled nil) 
        (sql :then
             (ejc-sql
              (sql-indent :github "alex-hhh/emacs-sql-indent")))
        (haskell :skip-install t :then
                 (haskell-mode
                  dante
                  (hasky-stack :disabled t)
                  ormolu))
        (lsp-mode :disabled t :first (yasnippet) :then (lsp-ui lsp-java ccls lsp-haskell lsp-pyright))
        (lsp-bridge :disabled t :local t :github  "manateelazycat/lsp-bridge" :first ( yasnippet (posframe :local nil)))
        (lspce :disabled t :local t :first (yasnippet f)) 
        (eglot :disabled nil :then ((eglot-java :disabled t)))
        (csv-mode :elpa csv-mode)
        (magit :then
               (git-messenger browse-at-remote (gitattributes-mode :disabled t)
                              (gitignore-mode  :disabled t) (gitconfig-mode :disabled t)))
        (aweshell :github "manateelazycat/aweshell")
        (vterm :disabled t)
        (pdf-tools :then
                   ((pdf-view :skip-install t)
                    pdf-view-restore))
        (flymake :skip-install t)
        (flycheck :disabled t
                  :then
                  ((zprint :github "git@github.com:DogLooksGood/zprint.el.git")
                   flycheck-clj-kondo
                   (clj-refactor :disabled t
                                 :github "git@github.com:clojure-emacs/clj-refactor.el.git")
                   (flycheck-golangci-lint :disabled t)
                   (flycheck-posframe :when (display-graphic-p))
                   flycheck-hledger
                   )
                  )
        (flyspell :skip-install t :then (wucuo))
        rime
        (telega :straight (telega :type git :host github :repo "zevlg/telega.el" :branch "release-0.8.0"))
        (yasdcv :local t)
        projectile maxima magit
        (tramp :local t :then (sudo-edit docker-tramp))
        (recentf :local t :disabled t)
        (recentf-db :skip-install t)
        gcmh
        (weiss-paredit :disabled t :local t)
        (citre :github "universal-ctags/citre" :disabled nil)
        (elfmt :github "git@github.com:riscy/elfmt.git")
        tab-line
        (sort-tab :github "git@github.com:manateelazycat/sort-tab.git" :disabled t)
        yaml-mode
        pass
        ledger-mode
        ;; fsharp-mode
        ;; dap-mode
        (puni :github "git@github.com:AmaiKinono/puni.git")
        (tree-sitter :disabled nil :then (tree-sitter-langs (weiss-tsc-mode :local t)))
        
        (combobulate :github "git@github.com:mickeynp/combobulate.git" :disabled t)
        (grammatical-edit :github "git@github.com:manateelazycat/grammatical-edit.git" :disabled t)
        (tree-edit :github "git@github.com:ethan-leba/tree-edit.git" :disabled t)
        diminish
        (show-paren-mode :skip-install t)
        (mac :skip-install t :when (string= emacs-host (nth 3 emacs-host-list)))
        (agda2-mode :skip-install t)
        nov
        mustache-mode
        smtpmail-multi
        notmuch
        dotenv-mode
        (nix-mode :then (nixos-options company-nixos-options))
        apheleia
        ))



(provide 'weiss_modules)






