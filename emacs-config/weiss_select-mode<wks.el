(defvar weiss-select-mode-p nil "nil")

(setq mark-select-mode-color "#ffcfe4")
(setq mark-non-select-mode-color "#cfe4ff")

(defun weiss-select-mode-check-region-color ()
  "if preview mode is on, change the cursor color"
  (if weiss-select-mode
      (face-remap-add-relative 'region
                               `(:background ,mark-select-mode-color))
    (face-remap-add-relative 'region
                             `(:background ,mark-non-select-mode-color)))
  )

(defun weiss-select-mode-turn-off (&rest args)
  "turn off weiss select mode"
  (interactive)
  (when weiss-select-mode (weiss-select-mode -1)))

(defun weiss-select-mode-turn-on (&rest args)
  "turn on weiss select mode"
  (interactive)
  (unless weiss-select-mode (weiss-select-mode 1)))

(defun weiss-select-mode-turn-on-mark (&rest args)
  "DOCSTRING"
  (interactive)
  (unless (use-region-p) (set-mark (point))))

(defun weiss-select-mode-turn-on-interactive (&rest args)
  "turn on weiss select mode"
  (interactive "p")
  (unless weiss-select-mode (weiss-select-mode 1)))

(add-hook 'deactivate-mark-hook 'weiss-select-mode-turn-off)
(advice-add 'keyboard-quit :before #'weiss-select-mode-turn-off)

(defun weiss-select-add-advice-turn-on (cmds)
  "DOCSTRING"
  (interactive)
  (mapc
   (lambda (cmd)
     (advice-add cmd :after #'weiss-select-mode-turn-on)
     (advice-add cmd :before #'weiss-select-mode-turn-on-mark))
   cmds))

(with-eval-after-load 'weiss-paredit
  (with-eval-after-load 'expand-region
    (let ((cmds
           '(xah-forward-right-bracket
             xah-backward-left-bracket
             xah-select-block
             weiss-select-sexp
             exchange-point-and-mark
             weiss-mark-brackets
             mark-defun
             weiss-select-sexp
             weiss-expand-region-by-word
             weiss-contract-region-by-word
             weiss-expand-region-by-sexp
             weiss-contract-region-by-sexp
             mark-whole-buffer
             weiss-move-to-next-punctuation
             weiss-move-to-previous-punctuation
             paredit-forward
             paredit-backward
             xref-find-definitions
             ;; er/expand-region
             )))
      (weiss-select-add-advice-turn-on cmds)
      (advice-add 'er/expand-region :after #'weiss-select-mode-turn-on-interactive))
    ))

(defun weiss-deactivate-mark-unless-in-select-mode (&rest args)
  "deactivate mark unless in select mode"
  (interactive)
  (unless weiss-select-mode (deactivate-mark)))

(defun weiss-select-add-advice-deactivate-mark (cmds)
  "DOCSTRING"
  (interactive)
  (mapc
   (lambda (cmd)
     (advice-add cmd :before #'weiss-deactivate-mark-unless-in-select-mode))
   cmds))

(let ((cmds
       '(swiper-isearch
         counsel-describe-function
         counsel-describe-variable
         weiss-add-parent-sexp
         weiss-indent
         weiss-indent-paragraph
         xah-select-block
         weiss-comment-dwim
         xah-open-file-at-cursor
         weiss-delete-or-add-parent-sexp
         org-roam-dailies--capture
         weiss-move-to-next-block
         weiss-move-to-previous-block
         citre-jump
         citre-peek
         undo))
      )
  (weiss-select-add-advice-deactivate-mark cmds))
;; (advice-add 'swiper-isearch :before #'weiss-deactivate-mark-unless-in-select-mode)
;; (advice-add 'counsel-describe-function :before #'weiss-deactivate-mark-unless-in-select-mode)
;; (advice-add 'counsel-describe-variable :before #'weiss-deactivate-mark-unless-in-select-mode)
;; (advice-add 'weiss-add-parent-sexp :before #'weiss-deactivate-mark-unless-in-select-mode)
;; (advice-add 'undo :before #'weiss-deactivate-mark-unless-in-select-mode)
;; (advice-add 'weiss-indent :before #'weiss-deactivate-mark-unless-in-select-mode)
;; (advice-add 'weiss-indent-paragraph :before #'weiss-deactivate-mark-unless-in-select-mode)
;; (advice-add 'xah-select-block :before #'weiss-deactivate-mark-unless-in-select-mode)
;; (advice-add 'weiss-comment-dwim :before #'weiss-deactivate-mark-unless-in-select-mode)
;; (advice-add 'xah-paste-or-paste-previous :before #'weiss-deactivate-mark-unless-in-select-mode)
;; (advice-add 'xah-open-file-at-cursor :before #'weiss-deactivate-mark-unless-in-select-mode)
;; (advice-add 'weiss-delete-or-add-parent-sexp :before #'weiss-deactivate-mark-unless-in-select-mode)
;; (advice-add 'org-roam-dailies--capture :before #'weiss-deactivate-mark-unless-in-select-mode)
;; (advice-add 'weiss-move-to-next-block :before #'weiss-deactivate-mark-unless-in-select-mode)
;; (advice-add 'weiss-move-to-previous-block :before #'weiss-deactivate-mark-unless-in-select-mode)
;; (advice-add 'citre-jump :before #'weiss-deactivate-mark-unless-in-select-mode)
;; (advice-add 'citre-peek :before #'weiss-deactivate-mark-unless-in-select-mode)
;; (advice-add 'newline :before #'weiss-deactivate-mark-unless-in-select-mode)



(defun anzu-query-replace (arg)
  "anzu version of `query-replace'."
  (interactive "p")
  (weiss-deactivate-mark-unless-in-select-mode)
  (anzu--query-replace-common nil :prefix-arg arg))

(defun anzu-query-replace-regexp (arg)
  "anzu version of `query-replace-regexp'."
  (interactive "p")
  (weiss-deactivate-mark-unless-in-select-mode)
  (anzu--query-replace-common t :prefix-arg arg))

(defun weiss-select-mode-enable ()
  "DOCSTRING"
  (interactive)
  (setq weiss-select-mode-p t)
  (weiss-select-mode-check-region-color)
  ;; (add-hook 'switch-buffer-functions 'weiss-select-mode-check-region-color)
  (push
   `(weiss-select-mode . ,weiss-select-mode-map)
   minor-mode-overriding-map-alist))

(defun weiss-select-mode-disable ()
  "DOCSTRING"
  (interactive)
  (setq weiss-select-mode-p nil)
  (weiss-select-mode-check-region-color)
  ;; (remove-hook 'switch-buffer-functions 'weiss-select-mode-check-region-color)
  (setq minor-mode-overriding-map-alist
        (assq-delete-all 'weiss-select-mode minor-mode-overriding-map-alist)))

    ;;;###autoload
(define-minor-mode weiss-select-mode
  "weiss select mode"
  :init-value nil
  :lighter " select"
  :keymap (let
              ((keymap (make-sparse-keymap)))
            ;; (define-key keymap (kbd ";") 'xah-beginning-of-line-or-block)
            (define-key keymap (kbd "h") 'xah-end-of-line-or-block)
            (define-key keymap (kbd "i") 'backward-char)
            (define-key keymap (kbd "j") 'next-line)
            (define-key keymap (kbd "k") 'previous-line)
            (define-key keymap (kbd "l") 'forward-char)
            (define-key keymap (kbd "!") 'exchange-point-and-mark)
            keymap)
  :group 'weiss-select-mode
  (if weiss-select-mode
      (weiss-select-mode-enable)
    (weiss-select-mode-disable)))

(provide 'weiss_select-mode<wks)
