;; (font-installed-p "Secret Code")
(with-eval-after-load 'weiss_after-dump-misc
  (when (featurep 'snails)
    (set-face-attribute 'snails-header-line-face nil :inherit 'fixed-pitch  :font
                        (font-spec :name "Liberation Serif")
                        :foreground "black" :underline nil :weight 'bold :slant 'normal :height 1.2)
    (set-face-attribute 'snails-header-index-face nil :inherit 'snails-header-line-face :height 0.8 :slant 'italic :underline nil)
    (set-face-attribute 'snails-candiate-content-face nil :inherit 'fixed-pitch :weight 'light :slant 'normal)
    (set-face-attribute 'snails-input-buffer-face nil :font
                        (font-spec :name "Liberation Serif")
                        :height 200  :slant 'normal)
    (set-face-attribute 'snails-content-buffer-face nil :font
                        (font-spec :name "Liberation Serif")
                        :height 150  :slant 'normal))
  )

;; parent: ui
(provide 'weiss_snails<font-lock-face)
