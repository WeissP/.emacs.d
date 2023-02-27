(defvar xah-elisp-ampersand-words nil "List of elisp special syntax, just &optional and &rest,")
(setq xah-elisp-ampersand-words '( "&optional" "&rest" "t" "nil"))

(font-lock-add-keywords
   'emacs-lisp-mode
   `(
     (,(regexp-opt xah-elisp-ampersand-words 'symbols) . font-lock-builtin-face)
   ))

(provide 'weiss_ui_font-lock)
