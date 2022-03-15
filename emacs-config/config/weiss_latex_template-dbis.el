(with-eval-after-load 'ox-latex
  (add-to-list 'org-latex-classes
               '("dbis-thesis"
                 "\\documentclass[a4paper,twoside,openright]{report}
\\usepackage[utf8]{inputenc}
\\usepackage[T1]{fontenc}
\\usepackage[ngerman,english]{babel}
\\usepackage{titlesec}
\\usepackage{subfigure}
\\usepackage{graphicx}
\\usepackage{parskip}
\\usepackage{lmodern}
\\usepackage{adjustbox}
\\usepackage{tikz}
\\usepackage{amsmath}
\\usepackage{caption}
\\usepackage{cite}
\\usepackage{listings}
\\usepackage{pdflscape}
\\usepackage[hidelinks]{hyperref}
\\usepackage[linesnumbered,ruled,algochapter]{algorithm2e}
\\usetikzlibrary{arrows,shapes,fit,positioning}
\\usetikzlibrary{decorations.pathmorphing}
\\usetikzlibrary{decorations.markings}

\\titleformat{\\chapter}[display]
{\\normalfont\\huge\\bfseries}{\\chaptertitlename\\ \\thechapter}{20pt}{\\Huge}

% this alters \"before\" spacing (the second length argument) to 0
\\titlespacing*{\\chapter}{0pt}{-50pt}{20pt}

\\author{}
\\date{\\today}
"
                 ("\\chapter{%s}" . "\\chapter*{%s}")
                 ("\\section{%s}" . "\\section*{%s}")
                 ("\\subsection{%s}" . "\\subsection*{%s}")
                 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                 ("\\paragraph{%s}" . "\\paragraph{%s}")
                 ))
  )

(provide 'weiss_latex_template-dbis)
