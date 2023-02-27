(with-eval-after-load 'LaTeX-mode
  (defun weiss-export-pdf-dwim ()
    "DOCSTRING"
    (interactive)
    (let ((current-frame (get-frame-name)))
      (if (string= current-frame "PDF-Export")
          (org-latex-export-to-pdf-enumerate)
        (org-latex-export-to-pdf-enumerate-new-frame))
      ))


  (with-eval-after-load 'ox-latex
    (setq LaTeX-command-style
          '(("" "%(PDF)%(latex) -shell-escape %S%(PDFout)")))
    (setq
     org-export-headline-levels 5
     org-export-with-tags nil
     org-latex-listings 'minted
     org-latex-pdf-process
     '("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
	   "bibtex %b"
	   "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
	   "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f")
     LaTeX-command-style
     '(("" "%(PDF)%(latex) -shell-escape %S%(PDFout)")))
    ;; \\setlength\\parindent{0pt}
    ;; \usepackage{xcolor}
    ;; \definecolor{code}{HTML}{986801}
    (add-to-list 'org-latex-packages-alist '("chapter" "minted" t))

    ;; (add-to-list 'org-latex-packages-alist '("" "tikz" t))
    ;; ;; \\usepackage{arev}

    (add-to-list 'org-latex-classes
                 '("weiss-Paper"
                   "\\documentclass[11pt]{report}

[PACKAGES]
\\makeatletter
\\setlength\\parindent{0pt}
\\usepackage[table]{xcolor}
\\usepackage{lipsum}
\\usepackage{ifsym}
\\usepackage{fontawesome}
\\usepackage{enumitem}
\\usepackage{changepage}
\\usepackage{inconsolata}
\\usepackage{xcolor}
\\definecolor{code}{HTML}{986801}
\\setminted[]{tabsize=2, breaklines=true, linenos=true}
\\usepackage{titlesec}
\\titleformat{\\chapter}[display]   
{\\normalfont\\huge\\bfseries}{\\chaptertitlename\\ \\thechapter}{20pt}{\\Huge}   
\\renewcommand{\\labelitemi}{$\\bullet$}
\\renewcommand{\\labelitemii}{$\\circ$}
\\renewcommand{\\labelitemiii}{$\\circ$}
\\renewcommand{\\labelitemiv}{$\\circ$}
[EXTRA]
"
                   ("\\chapter{%s}" . "\\chapter{%s}")
                   ("\\section{%s}" . "\\section{%s}")
                   ("\\subsection{%s}" . "\\subsection{%s}")
                   ("\\subsubsection{%s}" . "\\subsubsection{%s}")
                   ("\\paragraph{%s}" . "\\paragraph{%s}")))

    (setq org-latex-default-class "weiss-Paper")
    )
  )

(provide 'weiss_latex_export)
