(when (boundp 'org-mode-abbrev-table)
  (clear-abbrev-table org-mode-abbrev-table))

(define-abbrev-table 'org-mode-abbrev-table
  '(
    ("ta" ":tangle ")
    ("wa" "WhatsApp")
;;;;; roam
    ("ro" "#+roam_▮: ")
;;;;; org config
    ("attr" "#+ATTR_org: :")
    ("img" "#+ATTR_org: :width 600")
;;;;; latex
    ("ltxeq" "\\begin{equation*}\n▮\n\\end{equation*}" weiss--ahf-indent)    
    ("ltxal" "\\begin{aligned}\n▮\n\\end{aligned}" weiss--ahf-indent)    
    ("ltxtb" "#+ATTR_LaTeX: :align |r|r|r|r|r|" weiss--ahf-indent)    
    ("ltxmg" "#+ATTR_Latex: :options [leftmargin=▮8ex]" weiss--ahf-indent)    
    ("ltximg" "#+ATTR_LATEX:  :width 0.9\\textwidth :center nil" weiss--ahf-indent)    
    ("ltxmt" "#+ATTR_LATEX: :options xleftmargin=8ex" weiss--ahf-indent)    
    ("orgimg" "#+ATTR_ORG: :width 600" weiss--ahf-indent)    
    ("cc" "$\\color{code}\\texttt{▮}$" weiss--ahf-indent)    
;;;;; emoji
    ("zrl" ":relaxed:" weiss--ahf)
    ("zj" ":joy:" weiss--ahf)
;;;;; for English language
    ("intr" "introduction" weiss--ahf)    
    ("ex" "example" weiss--ahf)    
;;;;; for Germany language
    ("algo" "Algorithmus" weiss--ahf)
    ("ht" "heute" weiss--ahf)
    ("ad" "außerdem" weiss--ahf)
    ("ag" "Aufgabe" weiss--ahf)
    ("as" "Ausgabe" weiss--ahf)
    ("bh" "Behauptung" weiss--ahf)
    ("bdi" "Beweis durch Induktion" weiss--ahf)
    ("bj" "bis jetzt")
    ("bsp" "Beispiel" weiss--ahf)
    ("def" "Definition" weiss--ahf)
    ("dw" "deswegen")
    ("eb" "ein bisschen")
    ("ef" "einfach" weiss--ahf)
    ("en" "entweder")
    ("edl" "endlich ")
    ("fm" "Familie" weiss--ahf)
    ("ft" "fertig" weiss--ahf)
    ("fun" "Funktion" weiss--ahf)
    ("gb" "Gegenbeispiel" weiss--ahf)
    ("gz" "gleichzeitig" weiss--ahf)
    ("hs" "höchstens")
    ("ig" "insgesamt")
    ("ka" "keine Ahnung")
    ("kf" "kontextfrei" weiss--ahf)
    ("ls" "Lösung" weiss--ahf)
    ("ma" "Material" weiss--ahf)
    ("mg" "Möglichkeit" weiss--ahf)
    ("mi" "zumindest" weiss--ahf)
    ("n" "nicht")
    ("nt" "natürlich" weiss--ahf)
    ("nm" "nochmal")
    ("nx" "nächst" weiss--ahf)
    ("pb" "Problem" weiss--ahf)
    ("pg" "Programmier" weiss--ahf)
    ("pj" "Project" weiss--ahf)
    ("rt" "Richtung" weiss--ahf)
    ("sl" "schlecht")
    ("sm" "Semester")
    ("st" "Schritt" weiss--ahf)
    ("ub" "Übung" weiss--ahf)
    ("ul" "unterschiedlich" weiss--ahf)
    ("vl" "Vorlesung" weiss--ahf)
    ("vllt" "vielleicht " weiss--ahf)
    ("wr" "während" weiss--ahf)
    ("zm" "zusammen" weiss--ahf)
    ("zf" "Zusammenfassung" weiss--ahf)
;;;;; cycle number
    ("cn1" "①")
    ("cn2" "②")
    ("cn3" "③")
    ("cn4" "④")
    ("cn5" "⑤")
    )
  )

(provide 'weiss_org<abbrevs)
