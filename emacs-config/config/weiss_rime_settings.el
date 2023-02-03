(with-eval-after-load 'rime
  (setq default-input-method "rime")
  (setq
   rime-show-candidate 'minibuffer
   rime-translate-keybindings  '("C-f" "C-b" "C-n" "C-p" "C-g" "`" ";" "<dead-grave>")
   rime-inline-ascii-trigger 'control-r
   )

  (defun weiss-rime-return ()
    "DOCSTRING"
    (interactive)
    (if (and (enter-rime--should-inline-ascii-p)
             (not (rime--ascii-mode-p))
             )
        (rime-inline-ascii)
      (rime--return)
      )
    )

  (when (string= emacs-host (nth 3 emacs-host-list))
    (setq rime-emacs-module-header-root "/opt/homebrew/include/")
    (setq rime-share-data-dir "/Users/bozhoubai/Library/Rime/")    
    )
  )

;; parent: 
(provide 'weiss_rime_settings)
