(setq weiss/emacs-config-modules
      '((global :local t)
        (s :autoloads (s-replace))
        exec-path-from-shell
        rg
        (server :local t :load t)
        (email :local t)
        quickrun esup which-key (super-save :load t) bind-key
        (keyfreq :disabled t)
        (wks :local t :first (hydra))
        (org
         :first ((weiss-org-sp :local t :load t))
         :then ((babel
                 :local t
                 :first (ob-go
                         ob-sql-mode
                         (ob-javascript :github "zweifisch/ob-javascript")))
                org-noter
                (org-roam :then
                          ((snails-roam :github "WeissP/snails-roam")))
                org-fancy-priorities
                (org-appear :github "awth13/org-appear" :disabled nil)
                (org-table-to-qmk-keymap :local t)
                )
         )
        (latex
         :name auctex
         :then (org-edit-latex
                org-ref
                magic-latex-buffer
                latex-preview-pane))
        (dired
         :local t
         :then (wdired
                diredfl
                (all-the-icons-dired :github "jtbm37/all-the-icons-dired")
                dired-hacks-utils
                dired-avfs
                dired-collapse
                peep-dired 
                (dired-quick-sort :autoloads (hydra-dired-quick-sort/body)) 
                (weiss-dired-single-handed-mode :local t :first (dired-filter))
                ))
        (snails :local t :load t)
        (vertico :load t
                 :straight
                 (vertico :includes vertico-directory
                          :files (:defaults "extensions/vertico-directory.el"))
                 :then ((vertico-directory :local t :load t))
                 ) 
        (orderless :load t)
        (marginalia :load t)
        consult
        (abbrevs :local t)
        (ui
         :local t
         :then ((modeline :local t)
                (popwin :load t)
                (nyan-mode :disabled t)
                (delight :load t)
                highlight-indent-guides
                highlight-defined
                (rainbow-mode :github "emacsmirror/rainbow-mode")
                highlight-parentheses (hl-todo :load t)
                (color-outline :disabled t :local t)
                highlight-symbol anzu (hl-line :load t) web-beautify origami
                (whitespace :disabled t)
                (ligature :load t :github "mickeynp/ligature.el")
                (all-the-icons :when (display-graphic-p))
                command-log-mode emojify
                (hideshow :disabled t)
                (display-line-numbers :local t )
                (pulsar :github "protesilaos/pulsar" :disabled t)
                ))
        (company :then (company-box))
        (rotate-text :github "nschum/rotate-text.el")
        (casease :github "DogLooksGood/casease" :disabled t)
        (expand-region :disabled t)
        (rjsx-mode :then ((prettier-js :disabled t)))
        json-mode
        (swagger-mode :github "Nooby/swagger-mode" :disabled t)
        cider
        python 
        (http :then (auto-rename-tag))
        markdown-mode
        (xml-mode :local t)
        (mhtml-mode :local t :disabled nil)
        web-mode php-mode dockerfile-mode
        (gud :local t)
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
        (haskell-mode :then (dante))
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
                   ((pdf-view :local t :autoloads (pdf-view-mode))
                    pdf-view-restore))
        (flymake :local t)
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
        (flyspell :local t :then (wucuo))
        rime
        (telega :straight (telega :type git :host github :repo "zevlg/telega.el" :branch "release-0.8.0"))
        fanyi
        ;; (yasdcv :local t)
        ;; projectile 
        (tramp :local t :then (sudo-edit docker-tramp))
        (recentf-db :local t)
        (gcmh :load t)
        (weiss-paredit :disabled t :local t)
        (citre :github "universal-ctags/citre" :disabled nil)
        (elfmt :github "git@github.com:riscy/elfmt.git")
        (tab-line :load t)
        yaml-mode
        pass
        ledger-mode
        dap-mode
        (puni
         :github "git@github.com:AmaiKinono/puni.git"
         :autoloads (puni-strict-forward-sexp puni-strict-backward-sexp))
        (tree-sitter :disabled nil :then (tree-sitter-langs (weiss-tsc-mode :local t )))
        (diminish :load t)
        (show-paren-mode :local t)
        (mac :disabled t :local t :when (string= emacs-host (nth 3 emacs-host-list)))
        (agda2-mode :local t :then
                    ((agda-input :local t)))
        nov
        mustache-mode
        (smtpmail-multi :disabled t)
        notmuch
        dotenv-mode
        nix-mode
        apheleia
        lua-mode
        ))

(provide 'weiss_modules)






