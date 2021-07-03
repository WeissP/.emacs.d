(when (boundp 'clojure-mode-abbrev-table)
  (clear-abbrev-table clojure-mode-abbrev-table))

(define-abbrev-table 'clojure-mode-abbrev-table
  '(
    ("pt" "println" weiss--ahf)
    ("def" "(def ▮)" weiss--ahf)
    ("fn" "(fn [▮])" weiss--ahf)
    ("defn" "(defn ▮ \n[]\n\n)" weiss--ahf-indent)
    ("l" "let" weiss--ahf-indent)
    ("let" "(let [▮\n]\n)" weiss--ahf-indent)
    ("loop" "(loop [▮\n]\n(if \n(recur )))" weiss--ahf-indent)
    ("case" "(case ▮\n\n)" weiss--ahf-indent)
    ("println" "(println ▮)" weiss--ahf)
    ("print" "(print ▮)" weiss--ahf)
    ("into" "(into ▮)" weiss--ahf)
    ("red" "(reduce ▮)" weiss--ahf)
    ("set" "(set ▮)" weiss--ahf)
    ("when" "(when ▮)" weiss--ahf)
    ("if" "(if ▮)" weiss--ahf)
    ("not" "(not ▮)" weiss--ahf)
    ("eq" "(= ▮)" weiss--ahf)
    ("conj" "(conj ▮)" weiss--ahf)
    ))



;; parent: 
(provide 'weiss_clojure<abbrevs)
