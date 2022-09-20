(deftheme weiss-light "Created 2022-07-09.")

(custom-theme-set-faces
 'weiss-light
 '(default
    ((t
      (:family "JetBrains Mono" :foundry "JB" :width normal :height 120 :weight normal :slant normal :underline nil :overline nil :extend nil :strike-through nil :box nil :inverse-video nil :foreground "#383a42" :background "#fafafa" :stipple nil :inherit nil))))
 '(bold
   ((t
     (:weight demibold :slant normal :underline nil :foreground "#f5355e" :background nil))))
 '(italic
   ((t
     (:weight normal :underline nil :slant italic :height 0.95 :foreground "#606060" :background nil))))
 '(underline
   ((t
     (:weight normal :underline t :foreground "blue violet" :background nil))))
 '(cursor ((t (:background "#4078f2"))))
 '(fixed-pitch
   ((t
     (:family "JetBrains Mono" :foundry "JB" :width normal :height 120 :weight normal :slant normal))))
 '(variable-pitch
   ((t
     (:family "Lato" :foundry "tyPL" :width normal :height 1.2 :weight normal :slant normal))))
 '(escape-glyph ((t (:foreground "#0184bc"))))
 '(homoglyph
   ((((background dark))
     (:foreground "cyan"))
    (((type pc))
     (:foreground "magenta"))
    (t (:foreground "brown"))))
 '(minibuffer-prompt ((t (:foreground "#4078f2"))))
 '(highlight ((t (:background "#e1e1e1"))))
 '(highlight-parentheses-highligh ((t (:weight bold))))
 '(region
   ((t (:background "#cfe4ff" :distant-foreground "#2c2e34"))))
 '(shadow ((t (:foreground "#9ca0a4"))))
 '(secondary-selection ((t (:extend t :background "#9ca0a4"))))
 '(trailing-whitespace ((t (:background "#e45649"))))

 '(hl-paren-face ((t (:weight bold))))

 '(font-lock-builtin-face
   ((t (:slant italic :foreground "#a0522d"))))
 '(font-lock-comment-delimiter-face
   ((default (:inherit (font-lock-comment-face)))))
 '(font-lock-comment-face
   ((t (:weight light :slant normal :foreground "#9ca0a4"))))
 '(font-lock-constant-face ((t (:foreground "#b751b6"))))
 '(font-lock-doc-face
   ((t
     (:family "Route 159" :foundry "UKWN" :width normal :height 120 :weight normal :slant normal :foreground "#84888b" :inherit
              (font-lock-comment-face)))))
 '(font-lock-doc-markup-face
   ((t (:inherit (font-lock-constant-face)))))
 '(font-lock-function-name-face ((t (:foreground "#a626a4"))))
 '(font-lock-keyword-face
   ((t (:weight extrabold :slant italic :foreground "#5b5e6b"))))
 '(font-lock-negation-char-face
   ((t (:foreground "#4078f2" :inherit (bold)))))
 '(font-lock-preprocessor-face
   ((t (:foreground "#4078f2" :inherit (bold)))))
 '(font-lock-regexp-grouping-backslash
   ((t (:foreground "#4078f2" :inherit (bold)))))
 '(font-lock-regexp-grouping-construct
   ((t (:foreground "#4078f2" :inherit (bold)))))
 '(font-lock-string-face ((t (:foreground "#50a14f"))))
 '(font-lock-type-face ((t (:foreground "#986801"))))
 '(font-lock-variable-name-face
   ((t
     (:underline
      (:color foreground-color :style line)
      :foreground "#383a42"))))
 '(font-lock-warning-face
   ((t (:inherit (warning)))))

 '(tab-line-tab-current
   ((t (:box nil :foreground "#383a42" :background "wheat"))))
 '(tab-line-tab-inactive-alternate
   ((t (:box nil :foreground "#383a42" :background nil))))
 '(tab-line-tab-inactive
   ((t (:box nil :foreground "#383a42" :background nil))))
 '(tab-line-tab
   ((t (:box nil  :foreground "#383a42" :background nil ))))
 '(tab-line ((t (:background "#f0f0f0" :foreground "#f0f0f0"))))

 '(snails-header-line-face
   ((t
     (:inherit
      (fixed-pitch)
      :family "Liberation Serif"
      :foreground "black" :underline nil :weight bold :slant normal :height 1.2))))
 '(snails-header-index-face
   ((t
     (:inherit
      (snails-header-line-face)
      :height 0.8 :slant italic :underline nil))))
 '(snails-candiate-content-face
   ((t (:inherit (fixed-pitch) :weight light :slant normal))))
 '(snails-input-buffer-face
   ((t (:family "Liberation Serif" :height 200  :slant normal))))
 '(snails-content-buffer-face
   ((t (:family "Liberation Serif" :height 150  :slant normal))))

 '(button
   ((t (:inherit (link)))))
 '(link
   ((t
     (:weight bold :underline
              (:color foreground-color :style line)
              :foreground "#4078f2"))))
 '(link-visited
   ((default (:inherit (link)))
    (((class color)
      (background light))
     (:foreground "magenta4"))
    (((class color)
      (background dark))
     (:foreground "violet"))))
 '(fringe
   ((t (:foreground "#9ca0a4" :inherit (default)))))
 '(header-line
   ((t (:inherit (mode-line)))))
 '(tooltip ((t (:foreground "#383a42" :background "#e7e7e7"))))
 '(mode-line
   ((t (:box nil :foreground "#383a42" :background "wheat"))))
 '(mode-line-buffer-id ((t (:weight bold))))
 '(mode-line-emphasis ((t (:foreground "#4078f2"))))
 '(mode-line-highlight
   ((t (:inherit (highlight)))))
 '(mode-line-inactive
   ((t (:box nil :foreground "#383a42" :background "#e1e1e1"))))
 '(isearch
   ((t (:weight bold :inherit (lazy-highlight)))))
 '(isearch-fail
   ((t (:weight bold :foreground "#f0f0f0" :background "#e45649"))))
 '(lazy-highlight
   ((t (:foreground "#f0f0f0" :background "#c2d3f7"))))
 '(match
   ((t (:weight bold :foreground "#50a14f" :background "#f0f0f0"))))
 '(next-error
   ((t (:inherit (region)))))
 '(query-replace
   ((t (:inherit (isearch)))))

'(highlight-defined-builtin-function-name-face
   ((t (:foreground "#b751b6" :weight bold))))

 '(company-preview ((t (:foreground "#9ca0a4"))))
 '(company-preview-common
   ((t (:foreground "#4078f2" :background "#c6c7c7"))))
 '(company-preview-search
   ((t (:inherit (company-tooltip-common-selection)))))
 '(company-scrollbar-bg ((t (:inherit (tooltip)))))
 '(company-scrollbar-fg ((t (:background "#4078f2"))))
 '(company-tooltip
   ((t (:inherit (tooltip)))))
 '(company-tooltip-annotation
   ((t (:foreground "#b751b6" :distantforeground "#fafafa"))))
 '(company-tooltip-common
   ((t
     (:weight bold :foreground "#4078f2" :distantforeground "#f0f0f0"))))
 '(company-tooltip-common-selection
   ((t (:inherit (company-tooltip-common)))))
 '(company-tooltip-mouse
   ((t (:inherit (company-tooltip-common)))))
 '(company-tooltip-search
   ((t
     (:weight bold :foreground "#fafafa" :distantforeground "#383a42" :background "#4078f2"))))
 '(company-tooltip-search-selection ((t (:background "#788dba"))))
 '(company-tooltip-selection
   ((t (:weight bold :background "#a0bcf8" :extend t))))

 '(table-cell ((t (:background "gainsboro" :foreground "black"))))

 '(diredfl-autofile-name ((t (:foreground "base4"))))
 '(diredfl-compressed-file-name ((t (:foreground "#986801"))))
 '(diredfl-compressed-file-suffix ((t (:foreground "#986801" ))))
 '(diredfl-date-time ((t (:foreground "#0184bc" :weight light))))
 '(diredfl-deletion
   ((t (:foreground "#e45649" :background "#f5d9d6" :weight bold))))
 '(diredfl-deletion-file-name
   ((t (:foreground "#e45649" :background "#f5d9d6"))))
 '(diredfl-dir-heading ((t (:foreground "#4078f2" :weight bold))))
 '(diredfl-dir-name ((t (:foreground "#4078f2"))))
 '(diredfl-dir-priv ((t (:foreground "#4078f2"))))
 '(diredfl-exec-priv ((t (:foreground "#50a14f"))))
 '(diredfl-executable-tag ((t (:foreground "#50a14f"))))
 '(diredfl-file-name ((t (:foreground "#383a42"))))
 '(diredfl-file-suffix ((t (:foreground "#85868b"))))
 '(diredfl-flag-mark
   ((t (:foreground "yellow" :background "#e6dcc8" :weight bold))))
 '(diredfl-flag-mark-line ((t (:background "#f0ebe1"))))
 '(diredfl-ignored-file-name ((t (:foreground "#9ca0a4"))))
 '(diredfl-link-priv ((t (:foreground "#b751b6"))))
 '(diredfl-no-priv
   ((t (:inherit (shadow)))))
 '(diredfl-number ((t (:foreground "#da8548"))))
 '(diredfl-other-priv ((t (:foreground "magenta"))))
 '(diredfl-rare-priv ((t (:foreground "#a626a4"))))
 '(diredfl-read-priv ((t (:foreground "#986801"))))
 '(diredfl-symlink ((t (:foreground "#b751b6"))))
 '(diredfl-tagged-autofile-name ((t (:foreground "#383a42"))))
 '(diredfl-write-priv ((t (:foreground "#e45649"))))

 '(all-the-icons-blue ((t (:foreground "#4078f2"))))
 '(all-the-icons-blue-alt ((t (:foreground "#4db5bd"))))
 '(all-the-icons-cyan ((t (:foreground "#0184bc"))))
 '(all-the-icons-cyan-alt ((t (:foreground "#0184bc"))))
 '(all-the-icons-dblue ((t (:foreground "#a0bcf8"))))
 '(all-the-icons-dcyan ((t (:foreground "#005478"))))
 '(all-the-icons-dgreen ((t (:foreground "#377037"))))
 '(all-the-icons-dmaroon ((t (:foreground "#741a72"))))
 '(all-the-icons-dorange ((t (:foreground "#985d32"))))
 '(all-the-icons-dpink ((t (:foreground "#e86f64"))))
 '(all-the-icons-dpurple ((t (:foreground "#80387f"))))
 '(all-the-icons-dred ((t (:foreground "#9f3c33"))))
 '(all-the-icons-dsilver ((t (:foreground "#a5a9ad"))))
 '(all-the-icons-dyellow ((t (:foreground "#6a4800"))))
 '(all-the-icons-green ((t (:foreground "#50a14f"))))
 '(all-the-icons-lblue ((t (:foreground "#79a0f5"))))
 '(all-the-icons-lcyan ((t (:foreground "#4da8d0"))))
 '(all-the-icons-lgreen ((t (:foreground "#84bd83"))))
 '(all-the-icons-lmaroon ((t (:foreground "#c067bf"))))
 '(all-the-icons-lorange ((t (:foreground "#e5a97e"))))
 '(all-the-icons-lpink ((t (:foreground "#f2b2ad"))))
 '(all-the-icons-lpurple ((t (:foreground "#cc85cb"))))
 '(all-the-icons-lred ((t (:foreground "#ec887f"))))
 '(all-the-icons-lsilver ((t (:foreground "#e1e2e3"))))
 '(all-the-icons-lyellow ((t (:foreground "#b6954d"))))
 '(all-the-icons-maroon ((t (:foreground "#c067bf"))))
 '(all-the-icons-orange ((t (:foreground "#e5a97e"))))
 '(all-the-icons-pink ((t (:foreground "#ed9188"))))
 '(all-the-icons-purple ((t (:foreground "#b751b6"))))
 '(all-the-icons-purple-alt ((t (:foreground "#a094a6"))))
 '(all-the-icons-red ((t (:foreground "#e45649"))))
 '(all-the-icons-red-alt ((t (:foreground "#a69496"))))
 '(all-the-icons-silver ((t (:foreground "#c8cacc"))))
 '(all-the-icons-yellow ((t (:foreground "#986801"))))

 '(org-indent
   ((t (:inherit (org-hide fixed-pitch)))))
 '(org-verbatim
   ((t (:height 0.9 :family "JetBrainsMono" :underline nil :background "#e2e8ea"))))
 '(org-link ((t (:height 1.0 :inherit nil :underline t :foreground "#4da8d0"))))
 '(org-block-begin-line
   ((t
     (:weight normal :slant normal :extend t :underline nil :foreground "#999999" :background "#FAFAFA"))))
 '(org-checkbox ((t (:font "JetBrainsMono" :extend nil))))
 '(org-table ((t (:font "JetBrainsMono" :extend nil))))
 '(org-block
   ((t (:font "JetBrainsMono" :extend nil :background "#FAFAFA"))))
 '(org-drawer
   ((t
     (:foreground "#999999" :slant normal :weight light :background nil))))
 '(org-special-keyword
   ((t (:weight bold :slant normal :inherit 'org-drawer))))
 '(org-property-value
   ((t
     (:weight normal :slant normal :height 1.0 :inherit 'org-special-keyword))))
 '(org-headline-done ((t (:strike-through t :weight normal))))
 '(org-tag
   ((t (:weight normal :foreground "#84888b" :slant italic))))

 '(org-level-1
   ((t (:height 1.35 :foreground "#ff5a19" :weight bold))))
 '(org-level-2
   ((t
     (:height 0.95 :foreground "#040404" :weight normal :inherit 'org-level-1))))
 '(org-level-3
   ((t
     (:height 0.95 :foreground "#040404" :weight normal :inherit 'org-level-2))))
 '(org-level-4
   ((t
     (:height 0.95 :foreground "#040404" :weight normal :inherit 'org-level-3))))
 '(org-level-5
   ((t
     (:height 1.0 :foreground "#040404" :weight normal :inherit 'org-level-4))))
 '(org-level-6
   ((t
     (:height 1.0 :foreground "#040404" :weight normal :inherit 'org-level-5))))
 '(org-level-7
   ((t
     (:height 1.0 :foreground "#040404" :weight normal :inherit 'org-level-6))))
 '(org-level-8
   ((t
     (:height 1.0 :foreground "#040404" :weight normal :inherit 'org-level-7)))))
;; (provide-theme 'weiss-light)
