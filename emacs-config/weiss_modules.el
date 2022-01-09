(setq weiss/emacs-config-modules
      '((global :skip-install t)
        (table :skip-install t)
        rg
        (server  :local t)
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
                         ob-go ob-rust
                         (ob-java :skip-install t)
                         ob-sql-mode
                         (ob-javascript :github "zweifisch/ob-javascript")
                         ;; (ob-rust :gitlab "ajyoon/ob-rust")
                         ))
                (org-agenda :local t)
                (org-tempo :local t)
                (org-roam :then
                          ((snails-roam :github "WeissP/snails-roam")))
                org-fancy-priorities
                (org-appear :github "awth13/org-appear")
                (org-table-to-qmk-keymap :local t)
                (org-bullets :disabled t)
                (org-rich-yank :disabled t)))
        (latex
         :name auctex
         :then ((ox-latex :local t)
                (org-edit-latex :local t)
                magic-latex-buffer
                latex-preview-pane))
        (dired
         :local t
         :then (wdired diredfl all-the-icons-dired dired-hacks-utils dired-avfs dired-collapse
                       dired-quick-sort peep-dired dired-filter
                       (weiss-dired-single-handed-mode :local t)))
        (snails :local t)
        (mct :gitlab "protesilaos/mct")
        orderless
        ;; vertico
        ;; (selectrum :then (selectrum-prescient))
        ;; embark
        (isearch :skip-install t)
        ;; (ctrlf :disabled t)
        ;; (counsel :then (amx prescient ivy-prescient ivy-rich))
        (abbrevs :skip-install t)
        (ui
         :skip-install t
         :then (doom-themes
                (modeline :skip-install t)
                popwin
                (nyan-mode :disabled t)
                highlight-indent-guides
                (rainbow-mode :github "emacsmirror/rainbow-mode")
                highlight-parentheses hl-todo
                (color-outline :local t)
                highlight-symbol anzu hl-line web-beautify origami
                (whitespace :disabled t)
                (ligature :github "mickeynp/ligature.el")
                (all-the-icons :when (display-graphic-p))
                command-log-mode emojify
                (hideshow :disabled t)
                (display-line-numbers :local t )
                (font-lock-face :skip-install t)))
        (company :then (company-box))
        (rotate-text :github "nschum/rotate-text.el")
        (casease :github "DogLooksGood/casease" :disabled t)
        expand-region
        (js :skip-install t :then (js-format))
        json-mode
        (cider :then
               (flycheck-clj-kondo
                (zprint :github "git@github.com:DogLooksGood/zprint.el.git")
                (clj-refactor :disabled t
                              :github "git@github.com:clojure-emacs/clj-refactor.el.git")))
        (python :local t :then (yapfify ein lsp-pyright))
        (http :then (auto-rename-tag))
        markdown-mode
        (xml-mode :skip-install t)
        (mhtml-mode :skip-install t)
        web-mode php-mode dockerfile-mode
        (go-mode
         :then (go-impl go-fill-struct
                        (flycheck-golangci-lint :disabled nil)
                        (go-tag :disabled t)
                        go-gen-test
                        gotest
                        go-dlv
                        go-impl
                        go-eldoc))
        (sql :then
             ((sql-indent :github "alex-hhh/emacs-sql-indent")))
        (haskell :skip-install t :then
                 ((hasky-stack :disabled t)
                  ormolu))
        (lsp-mode :then (lsp-ui lsp-java ccls lsp-haskell))
        (csv-mode :elpa csv-mode)
        (magit :then
               (git-timemachine git-messenger browse-at-remote gitattributes-mode
                                gitignore-mode gitconfig-mode))
        (aweshell :github "manateelazycat/aweshell")
        (vterm :disabled t)
        (pdf-tools :then
                   ((pdf-view :skip-install t)
                    pdf-view-restore))
        (flycheck :then
                  (flycheck-hledger
                   (flycheck-posframe :when (display-graphic-p))))
        (flyspell :skip-install t :then (wucuo))
        rime
        telega
        (yasdcv :local t)
        projectile maxima magit
        (tramp :after-dump-all t :local t :then
               (sudo-edit counsel-tramp docker-tramp))
        (recentf :local t :disabled t)
        (recentf-db :skip-install t)
        gcmh
        (weiss-paredit :disabled t :local t)
        (citre :github "universal-ctags/citre")
        (elfmt :github "git@github.com:riscy/elfmt.git")
        tab-line
        (sort-tab :github "git@github.com:manateelazycat/sort-tab.git" :disabled t)
        yaml-mode
        pass
        ledger-mode
        ;; fsharp-mode
        ;; dap-mode
        (puni :github "git@github.com:AmaiKinono/puni.git")
        (tree-sitter :disabled t)
        (tree-sitter-langs :disabled t)
        (combobulate :github "git@github.com:mickeynp/combobulate.git" :disabled t)
        (grammatical-edit :github "git@github.com:manateelazycat/grammatical-edit.git" :disabled t)
        (tree-edit :github "git@github.com:ethan-leba/tree-edit.git" :disabled t)))

(provide 'weiss_modules)






