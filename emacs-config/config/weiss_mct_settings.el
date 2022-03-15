(with-eval-after-load 'mct
  (setq mct-remove-shadowed-file-names t) ; works when `file-name-shadow-mode' is enabled
  (setq mct-hide-completion-mode-line t)
  (setq mct-show-completion-line-numbers nil)
  (setq mct-apply-completion-stripes t)
  (setq mct-minimum-input 2)
  (setq mct-live-update-delay 0)

  ;; NOTE: `mct-completion-blocklist' can be used for commands with lots
  ;; of candidates, depending also on how low `mct-minimum-input' is.
  ;; With the settings shown here this is not required, otherwise I would
  ;; use something like this:
  ;;
  ;; (setq mct-completion-blocklist
  ;;       '( describe-symbol describe-function describe-variable
  ;;          execute-extended-command insert-char))
  (setq mct-completion-blocklist '(query-replace anzu-query-replace))

  ;; This is for commands that should always pop up the completions'
  ;; buffer.  It circumvents the default method of waiting for some user
  ;; input (see `mct-minimum-input') before displaying and updating the
  ;; completions' buffer.
  (setq mct-completion-passlist
        '(imenu Info-goto-node Info-index Info-menu vc-retrieve-tag))

  (mct-mode 1))

;; parent: 
(provide 'weiss_mct_settings)

