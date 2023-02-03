(message "mac settings enabled\n")
(setq mac-right-option-modifier 'none)

(setq rime-librime-root "/Users/bozhoubai/.emacs.d/librime/dist/")

(defun weiss-mac-org-insert-screenshot ()
  "call flameshot to capture screen shot"
  (interactive)
  (weiss-org-insert-image
   (concat "~/Desktop/Screenshot.png")
   t t))


(provide 'weiss_mac_settings)
