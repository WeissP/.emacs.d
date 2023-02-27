(require 'weiss-dired-single-handed-filter)

(defvar weiss-dired-single-handed-mode-map (make-sparse-keymap))

(wks-define-key
 weiss-dired-single-handed-mode-map ""
 '(("x" . hydra-dired-quick-sort/body)
   ("d" . next-line)
   ("e" . previous-line)
   ("f" . weiss-single-hand-play-movie)
   ("g" .
    (weiss-dired-single-handed-open-dir
     (dired-find-alternate-file)
     (weiss-dired-single-handed-mode)))
   ("q" . weiss-dired-single-handed-mode)
   ("s" .
    (weiss-dired-single-handed-up-dir
     (find-alternate-file "..")
     (weiss-dired-single-handed-mode)))
   ("v" . hydra-dired-filter-actress/body)
   ("V" . hydra-dired-add-tag/body)
   ("c" . hydra-dired-filter-tag/body)))

(defun weiss-single-hand-play-movie ()
  "DOCSTRING"
  (interactive)
  (let* ((file (car (dired-get-marked-files nil nil nil nil t)))
         (bangou (weiss-extract-bangou file))
         (subtitle-path (when bangou (format "%ssubtitles/%s.srt" (file-name-directory file) bangou)))
         )
    (message "subtitle-path: %s" subtitle-path)
    (weiss-mplayer-video file (when (ignore-errors (file-exists-p subtitle-path)) subtitle-path))))

;;;###autoload
(define-minor-mode weiss-dired-single-handed-mode
  "weiss-dired-single-handed-mode"
  :lighter " single-hand"
  :keymap weiss-dired-single-handed-mode-map
  :group 'weiss-dired-single-handed-mode
  (if weiss-dired-single-handed-mode
      (progn
        (set-face-background 'hl-line "#ffb5ff")
        (set-face-background 'normal-hl-line "#ffb5ff"))
    (set-face-background 'hl-line "#ffe8e8")
    (set-face-background 'normal-hl-line "#ffe8e8")))

(provide 'weiss-dired-single-handed-mode)
