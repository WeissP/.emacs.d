(defun selectrum-up-directory ()
  "up directory or delete char
      inspired by https://emacs-china.org/t/ivy-selectrum/17214"
  (interactive)
  (if (member (char-to-string (char-before)) '("/"))
      (let ((directory (minibuffer-contents-no-properties)))
        (delete-minibuffer-contents)
        (insert
         (string-trim-right
          (if (string= directory "~/")
              (expand-file-name "~/")
            directory)
          "[^/]+/?")))
    (delete-char -1)))

(with-eval-after-load 'selectrum (selectrum-mode +1))
(string-trim-right "/home/weiss/.emacs.d/emacs-config/" "[^/]+/?")
(string-trim-right "/home/weiss/.emacs.d/emacs-config" "/.+$")
;; parent: 
(provide 'weiss_settings<selectrum)
