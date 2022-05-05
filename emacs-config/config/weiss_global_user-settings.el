(setq-default c-basic-offset   4 tab-width        4 indent-tabs-mode nil)
(setq
 large-file-warning-threshold 100000000
 ring-bell-function 'ignore
 auto-save-default nil ; Disable auto save
 make-backup-files nil ; Forbide to make backup files
 create-lockfiles nil)

(defun weiss--get-config-file-path (path)
  "get config path according to weiss/config-path"
  (interactive)
  (concat weiss/config-path path))

(set-cursor-color weiss/cursor-color)
(setq-default cursor-type weiss/cursor-type)

(setq y-or-n-p-use-read-key t)
(fset 'yes-or-no-p 'y-or-n-p)

;;Bookmarks
;; (bookmark-load "/home/weiss/.emacs.d/bookmarks" t t t)
;; (setq bookmark-save-flag 1)
;;(bookmark-delete "org-capture-last-stored")
;;(bookmark-delete "org-refile-last-stored")

(save-place-mode -1)
(delete-selection-mode 1)
(global-auto-revert-mode 1)
(blink-cursor-mode -1)

(add-hook 'prog-mode-hook #'subword-mode)
(add-hook 'minibuffer-setup-hook #'subword-mode)

;; Encoding
;; UTF-8 as the default coding system
(when (fboundp 'set-charset-priority)
  (set-charset-priority 'unicode))

;; Explicitly set the prefered coding systems to avoid annoying prompt
;; from emacs (especially on Microsoft Windows)
(prefer-coding-system 'utf-8)

(set-language-environment 'utf-8)
(set-default-coding-systems 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(set-clipboard-coding-system 'utf-8)
(set-file-name-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(modify-coding-system-alist 'process "*" 'utf-8)

(setq locale-coding-system 'utf-8
      default-process-coding-system
      '(utf-8 . utf-8))

;; save sh file auto with executable permission
(add-hook 'after-save-hook 'executable-make-buffer-file-executable-if-script-p)

(setq
 eval-expression-print-level nil
 eval-expression-print-length nil)

(setq browse-url-handlers
      '(("playno1\\.com" . browse-url-chrome)
        ("jav." . browse-url-chrome)
        ("torrent" . browse-url-chrome)
        ("cc3001" . browse-url-chrome)
        ("boardgamegeek" . browse-url-chrome)
        ("xvxv11\\.com" . browse-url-chrome)
        ("xvideos\\.com" . browse-url-chrome)
        ("pornhub\\.com" . browse-url-chrome)
        ("mag\\.net" . browse-url-chrome)
        ("brettspielpreise" . browse-url-chrome)
	    ;; catch all
	    ("." . browse-url-default-browser)))

(setq completion-styles
      '(substring initials flex partial-completion))
(setq completion-category-overrides
      '((file (styles . (partial-completion initials substring)))))

(setq completion-ignore-case t)
(setq completions-detailed t)

(setq enable-recursive-minibuffers t)
(setq minibuffer-eldef-shorten-default t)

(setq read-buffer-completion-ignore-case t)
(setq read-file-name-completion-ignore-case t)

(setq resize-mini-windows t)
(setq minibuffer-eldef-shorten-default t)

(file-name-shadow-mode 1)
(minibuffer-depth-indicate-mode 1)
(minibuffer-electric-default-mode 1)

;;; Minibuffer history
(require 'savehist)
(setq savehist-file (locate-user-emacs-file "savehist"))
(setq history-length 10000)
(setq history-delete-duplicates t)
(setq savehist-save-minibuffer-history t)
(add-hook 'after-init-hook #'savehist-mode)

(defun yas-expand-snippet (&rest args)
  "avoid installing yas"
  (interactive))

;; parent: 
(provide 'weiss_global_user-settings)
