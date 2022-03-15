(with-eval-after-load 'embark
  (add-to-list 'display-buffer-alist
               '("\\*Embark Collect \\(Live\\|Completions\\)\\*"
                 (display-buffer-at-bottom)
                 (window-parameters .
                                    ((no-other-window . t)
                                     (mode-line-format . none)))))

  (defun resize-embark-collect-completions ()
    (fit-window-to-buffer
     (get-buffer-window)
     (floor (* 0.4 (frame-height)))
     1))

  (defun toggle-between-minibuffer-and-embark-collect-completions ()
    (interactive)
    (let ((w
           (if (eq (active-minibuffer-window) (selected-window))
               (get-buffer-window "*Embark Collect Completions*")
             (active-minibuffer-window))))
      (message "w: %s" (get-buffer-window "*Embark Collect Completions*"))
      (when (window-live-p w)
        (select-window w t)
        (select-frame-set-input-focus (selected-frame) t))))

  (add-hook 'minibuffer-setup-hook #'embark-collect-completions-after-input)
  (add-hook 'embark-collect-post-revert-hook #'resize-embark-collect-completions)

  (setq embark-collect-initial-view-alist
        '((t . list))
        embark-collect-live-initial-delay 0.15
        embark-collect-live-update-delay 0.15))

;; parent: 
(provide 'weiss_embark_settings)
