(with-eval-after-load 'emacs-yakuake
  ;; (defun weiss-run-java-spring ()
  ;;   "DOCSTRING"
  ;;   (interactive)
  ;;   (save-buffer)
  ;;   (when yakuake-spring-session-id
  ;;     (ignore-errors
  ;;       (yakuake-remove-session yakuake-spring-session-id)))
  ;;   (yakuake-add-session)
  ;;   (setq yakuake-spring-session-id (yakuake-active-session-id))
  ;;   (yakuake-set-tab-title yakuake-spring-session-id "spring")
  ;;   (yakuake-run-command-in-session yakuake-spring-session-id "cd ~/Documents/Vorlesungen/db-project-grpbb/")
  ;;   (yakuake-run-command-in-session yakuake-spring-session-id "mvn spring-boot:run"))

  (defun weiss-dired-rsync ()
    "DOCSTRING"
    (interactive)
    (let ((marked-files (dired-get-marked-files))
          (target-path
           (or
            (car (dired-dwim-target-next))
            "~/Downloads/")))
      (cond
       ((string-prefix-p "/ssh:" (car marked-files))
        (dolist (x marked-files)
          (let ((file-paths (split-string x ":")))
            (weiss-start-process "rsync-ssh"
             (format "rsync -PaAXv -e ssh \"%s:%s\" %s"
                     (nth 1 file-paths)
                     (nth 2 file-paths)
                     target-path)))))
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
                                     target-path))))
      )
    )

  (defun weiss-dired-git-clone ()
    "DOCSTRING"
    (interactive)
    (let* ((session (yakuake-add-session))
           (git-path (current-kill 0 t))
           (command
            (format "cd \"%s\" && git clone %s"
                    (file-truename default-directory)
                    git-path)))
      (if (string-prefix-p  "git@" git-path)
          (weiss-start-process "git clone" command)
        (message "check your clipboard!" )))))

(provide 'weiss_emacs-yakuake_settings)
