(setq pdf-view-restore-filename "~/.emacs.d/.pdf-view-restore")

(add-hook 'pdf-view-mode-hook 'pdf-view-restore-mode)

;; parent: 
(provide 'weiss_pdf-view-restore_settings)
