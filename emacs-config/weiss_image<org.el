(with-eval-after-load 'org
  (add-to-list 'image-file-name-extensions "pdf")

  (defun weiss-org-screenshot ()
    "call flameshot to capture screen shot"
    (interactive)
    (shell-command-to-string
     (concat "flameshot gui -p " weiss/org-img-path))
    (weiss-org-insert-image
     (concat weiss/org-img-path "flameshot-capture.png")
     t t))

  (defun weiss-org-download-img ()
    "download the img link from clipboard"
    (interactive)
    (weiss-org-insert-image
     "wget-img.png"
     (format "wget -O %swget-img.png %s" weiss/org-img-path
             (substring-no-properties
              (gui-get-selection 'CLIPBOARD
                                 (or x-select-request-type 'UTF8_STRING))))
     t))

  (defun weiss-org-insert-image(old-path &optional img-attr delete-old)
    "DOCSTRING"
    (interactive
     (list
      (read-string "old-path: ")
      (y-or-n-p "insert img-attr?")
      (y-or-n-p "delete old pictures?")))
    (let* ((pic-name
            (format "%s.png" (format-time-string "%Y-%m-%d_%H-%M-%S")))
           (new-path (concat weiss/org-img-path pic-name)))
      (while (not (file-exists-p old-path)) (sit-for 0.1))
      (when (file-exists-p new-path) (delete-file new-path))
      (copy-file old-path new-path)
      (when delete-old (delete-file old-path))
      (end-of-line)
      (insert "\n")
      (when img-attr (insert "#+ATTR_org: :width 600\n"))
      (insert (concat "[[file:Bilder/" pic-name  "]]"))
      (org-display-inline-images)))

  (defvar weiss-pdf-candidates nil)
  (defun weiss-org-insert-pdf-link (pdf-path page)
    "DOCSTRING"
    (interactive
     (list
      (completing-read-default "pdf path: " weiss-pdf-candidates )
      (read-string "page number: ")
      ))
    (insert (format "#+ATTR_org: :width 800\n[[file:%s::%s]]" pdf-path page))
    )

  (defun weiss-get-pdf-image-by-page-number (pdf-path n-str)
    "DOCSTRING"
    (interactive)
    (let* ((n (string-to-number n-str))
           (image-path-prefix
            (concat "/home/weiss/Downloads/my_tmp/pdf_images/"
                    (file-name-nondirectory
                     (file-name-sans-extension pdf-path))))
           (image-path
            (format "%s-%s%s.png" image-path-prefix
                    (make-string
                     (-
                      (len-of-number
                       (weiss-get-pdf-page-numbers pdf-path))
                      (len-of-number n))
                     ?0)
                    n)))
      (unless (file-exists-p image-path)
        (shell-command-to-string
         (format "pdftoppm -png -f %s -l %s %s %s" n n pdf-path image-path-prefix)))
      image-path))

  (defun weiss-get-pdf-page-numbers (pdf-path)
    "DOCSTRING"
    (interactive)
    (string-to-number
     (shell-command-to-string
      (format "qpdf --show-npages %s"  pdf-path))))

  (defun len-of-number (n)
    "DOCSTRING"
    (interactive)
    (+ 1
       (floor (/ (log n) (log 10)))))

  (defun weiss-org-display-inline-images (&optional include-linked refresh beg end)
    ""
    (interactive "P")
    (when (display-graphic-p)
      (unless refresh
        (org-remove-inline-images)
        (when (fboundp 'clear-image-cache) (clear-image-cache)))
      (let ((end (or end (point-max))))
        (org-with-point-at
            (or beg (point-min))
	      (let* ((case-fold-search t)
	             (file-extension-re (image-file-name-regexp))
	             (link-abbrevs
                  (mapcar #'car
				          (append org-link-abbrev-alist-local
					              org-link-abbrev-alist)))
	             ;; Check absolute, relative file names and explicit
	             ;; "file:" links.  Also check link abbreviations since
	             ;; some might expand to "file" links.
	             (file-types-re
		          (format
                   "\\[\\[\\(?:file%s:\\|attachment:\\|[./~]\\)\\|\\]\\[\\(<?file:\\)"
			       (if (not link-abbrevs)
                       ""
			         (concat "\\|" (regexp-opt link-abbrevs))))))
	        (while (re-search-forward file-types-re end t)
	          (let* ((link
                      (org-element-lineage
			           (save-match-data (org-element-context))
			           '(link)
                       t))
                     (linktype (org-element-property :type link))
		             (inner-start (match-beginning 1))
		             (path
		              (cond
		               ;; No link at point; no inline image.
		               ((not link)
                        nil)
		               ;; File link without a description.  Also handle
		               ;; INCLUDE-LINKED here since it should have
		               ;; precedence over the next case.  I.e., if link
		               ;; contains filenames in both the path and the
		               ;; description, prioritize the path only when
		               ;; INCLUDE-LINKED is non-nil.
		               ((or
                         (not (org-element-property :contents-begin link))
			             include-linked)
		                (and
                         (or
                          (equal "file" linktype)
                          (equal "attachment" linktype))
			             (org-element-property :path link)))
		               ;; Link with a description.  Check if description
		               ;; is a filename.  Even if Org doesn't have syntax
		               ;; for those -- clickable image -- constructs, fake
		               ;; them, as in `org-export-insert-image-links'.
		               ((not inner-start)
                        nil)
		               (t
		                (org-with-point-at inner-start
			              (and
                           (looking-at
			                (if (char-equal ?<
                                            (char-after inner-start))
				                org-link-angle-re
				              org-link-plain-re))
			               ;; File name must fill the whole
			               ;; description.
			               (=
                            (org-element-property :contents-end link)
				            (match-end 0))
			               (match-string 2)))))))
	            (when (and path
                           (string-match-p file-extension-re path))
		          (let ((file
                         (if (equal "attachment" linktype)
				             (progn
                               (require 'org-attach)
				               (ignore-errors
                                 (org-attach-expand path)))
                           (expand-file-name path))))
		            (when (and file (file-exists-p file))
		              (let ((width
                             (org-display-inline-image--width link))
			                (old
                             (get-char-property-and-overlay
				              (org-element-property :begin link)
				              'org-image-overlay)))
		                (if (and (car-safe old) refresh)
			                (image-refresh
                             (overlay-get (cdr old) 'display))
			              (let ((image
                                 (org--create-inline-image
                                  (if (string=
                                       (file-name-extension file)
                                       "pdf")
                                      (weiss-get-pdf-image-by-page-number
                                       file
                                       (plist-get
                                        (nth 1 link)
                                        :search-option))
                                    file)
                                  width)))
			                (when image
			                  (let ((ov
                                     (make-overlay
				                      (org-element-property :begin link)
				                      (progn
					                    (goto-char
					                     (org-element-property :end link))
					                    (skip-chars-backward " \t")
					                    (point)))))
			                    (overlay-put ov 'display image)
			                    (overlay-put ov 'face 'default)
			                    (overlay-put ov 'org-image-overlay t)
			                    (overlay-put
			                     ov 'modification-hooks
			                     (list 'org-display-inline-remove-overlay))
			                    (when (boundp 'image-map)
				                  (overlay-put ov 'keymap image-map))
			                    (push ov org-inline-image-overlays))))))))))))))))

  (advice-add 'org-display-inline-images :override 'weiss-org-display-inline-images)

  )

(provide 'weiss_image<org)


