(when (boundp 'js-mode-abbrev-table)
  (clear-abbrev-table js-mode-abbrev-table))

(define-abbrev-table 'js-mode-abbrev-table
  '(
    ("c"  "const " weiss--ahf)
    ("pr"  "console.log(▮)" weiss--ahf)
    ("if" "if (▮) {\n\n}"  weiss--ahf-indent)
    ("rn" "<▮ />"  weiss--ahf)
    ("rus" "const [▮] = React.useState()"  weiss--ahf)
    ("rue" "React.useEffect(() => {\n▮\n}, [])"  weiss--ahf-indent)
    ("rdu" "componentDidUpdate() {\nif (this.props.onChange) {\nthis.props.onChange(▮)\n}\n}"  weiss--ahf)
    ("rc" "class ▮ extends React.Component {\n    constructor(props) {\n        super(props)\n        this.state = {\n\n        }\n    };\n\n    componentDidMount() {\n\n    }\n\n    render() {\n        return (\n\n        )\n    }\n}"  weiss--ahf)
    ("rt" "return "  weiss--ahf)
    ("hb" "<b> ▮ </b>")
    ("hi" "<i> ▮ </i>")
    ("hu" "<u> ▮ </u>")
    ("hp" "<p> ▮ </p>")
    ("ha" "<a href=\"▮\"> </a>" weiss--ahf)

    ("hh1" "<h1> ▮ </h1>")
    ("hh2" "<h2> ▮ </h2>")
    ("hh3" "<h3> ▮ </h3>")
    ("hh4" "<h4> ▮ </h4>")
    ("hli" "<li> ▮ </li>")
    ("hol" "<ol start=1 type=a> \n▮ \n </ol>" weiss--ahf-indent)
    ("hul" "<ul> \n▮ \n </ul>" weiss--ahf-indent)
    ("htable" "<table style=\"width:60%\"> \n<tr>\n <td>▮</td> \n</tr>\n </table>" weiss--ahf-indent)
    ("hhd" "<head>\n<meta charset=\"utf-8\">\n<title>▮</title>\n</head>" weiss--ahf-indent)
    ("hth" "<th>▮</th>" weiss--ahf)
    ("hbr" "<br>" weiss--ahf)
    ("htr" "<tr>\n▮\n</tr>" weiss--ahf-indent)
    ("htd" "<td>▮</td>" weiss--ahf)
    ("hsp" "<span>▮</span>" weiss--ahf)
    ("hsb" "<span class=\"block\">▮</span>" weiss--ahf)
    ("hag" "Aufgabe" weiss--ahf)

    ("hel" "&lt;" weiss--ahf)
    ("heg" "&gt;" weiss--ahf)
    ("helg" "&lt;▮&gt;" weiss--ahf)
    ("hea" "&amp" weiss--ahf)
    ("heq" "&quot;" weiss--ahf)

    ("hpre" "<pre>\n▮\n</pre>" weiss--ahf-indent)
    ("hphp" "<?php\n▮\n?>" weiss--ahf)
    ("hdiv" "<div> ▮ </div>")

    ("hcode" "<pre>\n<code>\n▮\n</code>\n</pre>" weiss--ahf-indent)
    ("hstyle" "<style>\n▮\n</style>" weiss--ahf-indent)
    ("htemp" "<!doctype html>\n<html lang=\"de\">\n\n<head>\n<meta charset=\"utf-8\">\n<title>▮</title>\n</head>\n\n<body>\n\n</body>" weiss--ahf-indent)

    ("hif" "{{if .▮}}{{end}}" weiss--ahf)
    ("hrange" "{{range .▮}}\n\n{{end}}" weiss--ahf-indent)
    ("hwith" "{{with .▮}}{{end}}" weiss--ahf-indent)
    ("hdot" "{{.▮}}" weiss--ahf-indent)
    ))



;; parent: 
(provide 'weiss_abbrevs_js)
