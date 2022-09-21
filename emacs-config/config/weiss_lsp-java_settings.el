(add-hook 'java-mode-hook #'(lambda ()
                              (require 'lsp-java)
                              (make-local-variable 'lsp-diagnostic-package)
                              (setq lsp-diagnostic-package :flycheck)
                              (lsp-completion-mode)
                              ;; (lsp-ui-flycheck-enable t)
                              ;; (lsp-ui-sideline-mode)
                              ))

(setq
 lsp-java-format-enabled t
 lsp-java-format-settings-profile "WeissGoogleStyle"
 lsp-java-format-settings-url "file://~/weiss/format-style/WeissGoogleStyle.xml"
 ;; don't add Xbootclasspath! Otherwise can flycheck not work. See https://github.com/redhat-developer/vscode-java/issues/652#issuecomment-466906125
 lsp-java-vmargs '("-noverify" "-Xmx1G" "-XX:+UseG1GC" "-XX:+UseStringDeduplication" "-javaagent:~/.m2/repository/org/projectlombok/lombok/1.18.20/lombok-1.18.20.jar")
 ;; lsp-java-vmargs '("-noverify" "-Xmx1G" "-XX:+UseG1GC" "-XX:+UseStringDeduplication" "-javaagent:~/.m2/repository/org/projectlombok/lombok/1.18.20/lombok-1.18.20.jar" "-Xbootclasspath/a:~/.m2/repository/org/projectlombok/lombok/1.18.20/lombok-1.18.20.jar")

;; lsp-java-configuration-check-project-settings-exclusions nil
 ;; lsp-java-java-path "/usr/lib/jvm/java-11-openjdk/bin/java"
 ;; lsp-java-jdt-download-url  "https://download.eclipse.org/jdtls/milestones/0.57.0/jdt-language-server-0.57.0-202006172108.tar.gz"
 )

;; parent: lsp-mode
(provide 'weiss_lsp-java_settings)
