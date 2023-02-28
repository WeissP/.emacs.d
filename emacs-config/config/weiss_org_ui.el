(with-eval-after-load 'org
  (setq
   org-hide-leading-stars nil
   org-indent-mode-turns-on-hiding-stars nil
   org-list-description-max-indent 4
   org-startup-indented t
   org-startup-folded t
   org-src-window-setup 'split-window-below
   org-image-actual-width nil
   org-fontify-done-headline t
   org-pretty-entities nil
   ;; hide ** //
   org-hide-emphasis-markers t
   org-n-level-faces 15
   ;; controls the size of latex previews 
   org-format-latex-options (plist-put org-format-latex-options :scale 1.8)
   )

  (add-hook 'org-mode-hook (lambda () (variable-pitch-mode)))
  (defun weiss-shrink-window-if-larger-than-buffer (&optional window min-window-size)
    "Weiss: add optional arg min-window-size
Shrink height of WINDOW if its buffer doesn't need so many lines.
More precisely, shrink WINDOW vertically to be as small as
possible, while still showing the full contents of its buffer.
WINDOW must be a live window and defaults to the selected one.

Do not shrink WINDOW to less than `window-min-height' lines.  Do
nothing if the buffer contains more lines than the present window
height, or if some of the window's contents are scrolled out of
view, or if shrinking this window would also shrink another
window, or if the window is the only window of its frame.

Return non-nil if the window was shrunk, nil otherwise."
    (interactive)
    (setq window (window-normalize-window window t))
    ;; Make sure that WINDOW is vertically combined and `point-min' is
    ;; visible (for whatever reason that's needed).  The remaining issues
    ;; should be taken care of by `fit-window-to-buffer'.
    (when (and (window-combined-p window)
               (pos-visible-in-window-p (point-min) window))
      (fit-window-to-buffer window (window-total-height window) min-window-size)))
  )

;; parent: 
(provide 'weiss_org_ui)
