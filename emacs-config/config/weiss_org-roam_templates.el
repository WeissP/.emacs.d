(with-eval-after-load 'org-roam
  (setq org-roam-capture-templates
        `(("d" "default" plain
           "* ${title}\n** %?"
           :if-new (file+head "${slug}_%<%Y%m%d%H>.org" "#+title: ${title}")
           )
          ("p" "project" plain
           "* ${title}\n** link:\n*** \n** %?"
           :if-new (file+head "ƦProject-${slug}_%<%Y%m%d%H>.org" "#+title: Project-${title} \n#+filetags: project \n")
           )
          ("n" "note" plain
           "* ${title}\n %?"
           :if-new (file+head "ƦNote-${slug}_%<%Y%m%d%H>.org" "#+title: note-${title} \n#+filetags: note \n")
           )
          ("t" "tutorial" plain
           "* [[file:ƦUseful-commands-${title}_%<%Y%m%d%H>.org][useful commands]]\n* link\n** \n%?"
           :if-new (file+head "ƦTutorial-${slug}_%<%Y%m%d%H>.org" "#+title: Tutorial-${title} \n#+filetags: tutorial ${slug}\n")
           )
          ("c" "useful commands" plain
           "%?"
           :if-new (file+head "ƦUseful-commands-${slug}_%<%Y%m%d%H>.org" "#+title: Useful-commands-${title} \n#+filetags: useful-commands ${slug}\n")
           )
          ("l" "link" plain
           "%?"
           :if-new (file+head "Ʀlink:${slug}.org" "#+title: ${title}\n#+filetags: LINK#+ROAM_REFS: %c\n")
           )))

  (setq org-roam-dailies-capture-templates
        '(("s" "Scheduled" entry
           "* TODO %i%?\nSCHEDULED: <%<%Y-%m-%d %a>>\n:PROPERTIES:\n:ID: scheduled-%(weiss-org-create-id-random-string)\n:END:"
           :if-new (file+head+olp "Ʀd-%<%Y-%m-%d>.org"
                                  "#+title: Daily-%<%Y-%m-%d>\n#+filetags: Daily\n"
                                  ("Scheduled")))
          ("t" "Todo" entry
           "* TODO %i%?\nSCHEDULED: [%<%Y-%m-%d %a>]\n:PROPERTIES:\n:ID: todo-%(weiss-org-create-id-random-string)\n:END:"

           :if-new (file+head+olp
                    "Ʀd-%<%Y-%m-%d>.org"
                    "#+title: Daily-%<%Y-%m-%d>\n#+filetags: Daily\n"
                    ("Todo")))
          ("f" "Fleeting notes" entry
           "* TODO %i%? :fleeting:\n:PROPERTIES:\n:ID: Fleeting-notes-%(weiss-org-create-id-random-string)\n:END:"
           :if-new (file+head+olp "Ʀd-%<%Y-%m-%d>.org"
                                  "#+title: Daily-%<%Y-%m-%d>\n#+filetags: Daily\n"
                                  ("Fleeting notes")))
          ("m" "Music" entry
           "* Music-Today-%<%Y-%m-%d> %?\n:PROPERTIES:\n:ID: music-%(weiss-org-create-id-random-string)\n:END:"
           :if-new (file+head+olp "Ʀd-%<%Y-%m-%d>.org" "" ("Music-Today"))
           :unnarrowed t)
          ("j" "Journey" entry
           "* %<%H:%M>\n %?"
           :if-new (file+head+olp "Ʀd-%<%Y-%m-%d>.org"
                                  "#+title: Daily-%<%Y-%m-%d>\n#+filetags: Daily\n"
                                  ("Journey"))
           :unnarrowed t)))

  (setq org-roam-capture-ref-templates
        '(("r" "ref" plain
           "%?"
           :if-new (file+head "Ʀlink:${slug}.org"
                              "#+title: ${title} \n#+filetags: link\n#+roam_key: ${ref}\n")
           :unnarrowed t))))

;; parent: org
(provide 'weiss_org-roam_templates)

