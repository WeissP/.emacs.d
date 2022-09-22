(require 'weiss-tsc-operations)

(defvar weiss-tsc-mode-p nil "nil")

(defun weiss-tsc-right ()
  "DOCSTRING"
  (interactive)
  (if (weiss-tsc-in-text)
      (weiss-right-key)      
    (let* ((p (weiss-tsc-next-point (point)))
           (node (weiss-tsc-find-node-forward (point) (point-max) nil t)))
      (weiss-mark (tsc-node-start-byte node) (tsc-node-end-byte node)))))

(defun weiss-tsc-left ()
  "DOCSTRING"
  (interactive)
  (if (weiss-tsc-in-text)
      (weiss-left-key)      
    (let* ((p (weiss-tsc-previous-point (point)))
           (node
            (weiss-tsc-find-node-backward (point-min) (point) nil t)))
      (weiss-mark (tsc-node-end-byte node) (tsc-node-start-byte node)))))

(defun weiss-tsc-expand-region ()
  "DOCSTRING"
  (interactive)
  (if  (weiss-tsc-in-text)
      (call-interactively 'weiss-expand-region-by-sexp)
    (let ((backward
           (not (eq current-prefix-arg
                    (and
                     (weiss-region-p)
                     (eq (point) (region-beginning)))))))
      (if backward
          (goto-char (tsc-node-start-byte (weiss-tsc-previous-sib)))
        (goto-char (tsc-node-end-byte (weiss-tsc-next-sib)))))))

(defun weiss-tsc-up ()
  "DOCSTRING"
  (interactive)
  (if current-prefix-arg
      (move-line-up)
    (let* ((p-start (point))
           p node beg end)
      (previous-line)
      (deactivate-mark)
      (setq p
            (point)
            beg
            (line-beginning-position)
            end
            (line-end-position)
            node
            (or
             (weiss-tsc-find-node-backward beg end p)
             (weiss-tsc-find-node-forward beg end p)
             (weiss-tsc-find-node-backward beg end)))
      (when node
        (weiss-mark
         (tsc-node-start-byte node)
         (tsc-node-end-byte node)))
      (when (<= p-start (point))
        (goto-char p-start)
        (previous-line)))
    ))

(defun weiss-tsc-down ()
  "DOCSTRING"
  (interactive)
  (if current-prefix-arg
      (move-line-down)
    (next-line)
    (deactivate-mark)
    (let* ((beg (line-beginning-position))
           (end (line-end-position))
           (p (point))
           (node
            (or
             (weiss-tsc-find-node-forward beg end p)
             (weiss-tsc-find-node-backward beg end p)
             (weiss-tsc-find-node-forward beg end))))
      (when node
        (weiss-mark
         (tsc-node-start-byte node)
         (tsc-node-end-byte node))))))

(defun weiss-tsc-parent ()
  "DOCSTRING"
  (interactive)
  (deactivate-mark)
  (let* ((cur-node (tree-sitter-node-at-pos))
         (node
          (if (member (char-after (point)) weiss-tsc-non-stop-chars)
              cur-node
            (tsc-get-parent cur-node)))
         (parent (tsc-get-parent node)))
    (while (and
            parent
            (not (or
                  (eq (point) (point-min))
                  (eq (point-min) (tsc-node-start-byte parent))))
            (eq (point) (tsc-node-start-byte node)))
      (setq node parent)
      (setq parent (tsc-get-parent node)))
    (goto-char (tsc-node-start-byte node))))

(defun weiss-tsc-mode-enable ()
  "DOCSTRING"
  (interactive)
  (setq weiss-tsc-mode-p t)
  (push
   `(weiss-tsc-mode . ,weiss-tsc-mode-map)
   minor-mode-overriding-map-alist))

(defun weiss-tsc-mode-disable ()
  "DOCSTRING"
  (interactive)
  (setq weiss-tsc-mode-p nil)
  (setq minor-mode-overriding-map-alist
        (assq-delete-all 'weiss-tsc-mode minor-mode-overriding-map-alist)))

(add-hook 'tree-sitter-mode-hook #'weiss-tsc-mode)

;;;###autoload
(define-minor-mode weiss-tsc-mode
  "weiss tsc mode"
  :init-value nil
  :lighter " tsc"
  :keymap (let
              ((keymap (make-sparse-keymap)))
            (define-key keymap (kbd "j") 'weiss-tsc-down)
            (define-key keymap (kbd "k") 'weiss-tsc-up)
            (define-key keymap (kbd "l") 'weiss-tsc-right)
            (define-key keymap (kbd "i") 'weiss-tsc-left)
            (define-key keymap (kbd "m") 'weiss-tsc-parent)
            (define-key keymap (kbd "o") 'weiss-tsc-expand-region)
            (define-key keymap (kbd "_") 'weiss-split-region)
            (define-key keymap (kbd "0") 'weiss-split-region)
            keymap)
  :group 'weiss-tsc-mode
  (if weiss-tsc-mode
      (weiss-tsc-mode-enable)
    (weiss-tsc-mode-disable)))


(provide 'weiss-tsc-mode)
