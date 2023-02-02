(with-eval-after-load 'dired
  (defun weiss-dired-rsync ()
    "DOCSTRING"
    (interactive)
    (let ((marked-files (dired-get-marked-files))
          (target-path
           (or
            (car (dired-dwim-target-next))
            "~/Downloads/")))
      (message "target-path: %s" target-path)
      (cond
       ((string-prefix-p "/ssh:" (car marked-files))
        (dolist (x marked-files)
          (let ((file-paths (split-string x ":")))
            (weiss-start-process "rsync-ssh"
                                 (format "rsync -PaAXv -e ssh \"%s:%s\" %s"
                                         (nth 1 file-paths)
                                         (nth 2 file-paths)
                                         target-path)))))
       ((string-prefix-p "/ssh:" target-path)
        (dolist (x marked-files)
          (let ((target-paths (split-string target-path ":")))
            (weiss-start-process "rsync-ssh"
                                 (format "rsync -PaAXv -e ssh %s \"%s:%s\""
                                         x
                                         (nth 1 target-paths)
                                         (nth 2 target-paths)
                                         )))))
       ((string-prefix-p "/docker:" (car marked-files))
        (dolist (x marked-files)
          (let ((file-paths (split-string x ":")))
            (weiss-start-process "copy-from-docker"
                                 (format "docker cp \"%s:%s\" %s"
                                         (nth 1 file-paths)
                                         (nth 2 file-paths)
                                         target-path)))))

       ((string-prefix-p "/docker:" target-path)
        (let* ((parse-path (split-string target-path ":"))
               (docker-path
                (format "%s:%s" (nth 1 parse-path) (nth 2 parse-path))))
          (dolist (x marked-files)
            (weiss-start-process "copy-to-docker"
                                 (format "docker cp %s %s"
                                         (format "\"%s\"" x)
                                         docker-path)))))
       (t
        (weiss-start-process "rsync"
                             (format "rsync -PaAXv %s %s"
                                     (format "\"%s\""
                                             (mapconcat 'identity marked-files "\" \""))
                                     target-path))))))

  (defun weiss-dired-git-clone ()
    "DOCSTRING"
    (interactive)
    (let* ((git-path (current-kill 0 t))
           (command
            (format "cd \"%s\" && git clone %s"
                    (file-truename default-directory)
                    git-path)))
      (if (or
           (string-prefix-p  "https://github.com/" git-path)
           (string-prefix-p  "git@" git-path))
          (weiss-start-process "git clone" command)
        (message "check your clipboard!" ))))

  (defun weiss-extract-audio (video-path out-dir &optional audio-type)
    "DOCSTRING"
    (interactive)
    (let* ((audio-type (or audio-type "aac"))
           (bangou (weiss-extract-bangou video-path))
           (out-path (format "%s/%s.%s" out-dir bangou audio-type))
           )
      (weiss-start-process
       (format "Extracting audio from %s" video-path)
       (format "ffmpeg -i \"%s\" -vn -acodec copy \"%s\" " video-path out-path )) 
      )
    )

  (defun weiss-dired-extract-audios ()
    "DOCSTRING"
    (interactive)
    (let* ((videos (dired-get-marked-files nil nil nil nil t))
           (out-dir (expand-file-name "~/Downloads"))
           )
      (dolist (video videos) 
        (weiss-extract-audio video out-dir)
        )
      ))

  (defun weiss-dired-merge-videos ()
    "merge videos by its lexicographical order"
    (interactive)
    (let* ((input-file (concat user-emacs-directory ".temp/videomerger"))
           (videos (dired-get-marked-files nil nil nil nil t))
           (new-name (read-string  "new video name: "  (format "%s" (file-name-nondirectory (car videos)))))
           (cmd (format "ffmpeg -f concat -safe 0 -i %s -c copy '%s%s'"  input-file (file-name-directory (car videos)) new-name) )
           )
      (if (file-exists-p new-name)
          (message "new-name: %s already exists!" new-name)
        (with-temp-buffer
          (insert (mapconcat (lambda (x) (format "file '%s'" x)) videos "\n"))
          (sort-lines nil (point-min) (point-max))
          (write-region (point-min) (point-max) input-file))
        (weiss-start-process "ffmpeg_merge" cmd)
        )
      ))
  )

;; parent: 
(provide 'weiss_dired_process)
