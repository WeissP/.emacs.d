(when (boundp 'rustic-mode-abbrev-table)
  (clear-abbrev-table rustic-mode-abbrev-table))

(define-abbrev-table 'rustic-mode-abbrev-table
  '(
    ("b"  "Box" weiss--ahf)
    ("d"  "#[derive(▮)]" weiss--ahf-indent)
    ("en"  "enum ▮ {\n\n}" weiss--ahf-indent)
    ("epn"  "eprintln!(\"▮\")" weiss--ahf-indent)
    ("er"  "Err(\"▮\")" weiss--ahf-indent)
    ("f"  "for ▮ {\n\n}" weiss--ahf-indent)
    ("fmt"  "format!(\"{}\",▮)" weiss--ahf)
    ("if"  "if ▮ {\n\n}" weiss--ahf-indent)
    ("im"  "impl ▮ {\n\n}" weiss--ahf-indent)
    ("l"  "let ▮;" weiss--ahf)
    ("lp"  "loop {\n▮\n}; " weiss--ahf-indent)
    ("m"  "match" weiss--ahf)
    ("match"  "match ▮ {\n => \n_ => (),\n}" weiss--ahf)
    ("n"  "None" weiss--ahf)
    ("oe"  "Ok(▮) => ,\nErr(_) => ," weiss--ahf-indent)
    ("ok"  "Ok(▮)" weiss--ahf-indent)
    ("op"  "Option<▮>" weiss--ahf-indent)
    ("p"  "pub " weiss--ahf)
    ("pd"  "println!(\"{:?}\",▮);" weiss--ahf)
    ("pn"  "println!(\"▮\");" weiss--ahf)
    ("rs"  "Result<▮,>" weiss--ahf-indent)
    ("rt"  "return ▮;" weiss--ahf-indent)
    ("s"  "Some(▮)" weiss--ahf)
    ("st"  "struct ▮ {\n\n}" weiss--ahf-indent)
    ("test"  "#[cfg(test)]\nmod tests {\nuse super::*;\n\n#[test]\n▮\n}" weiss--ahf-indent)
    ("u"  "use " weiss--ahf)
    ("ue"  "unwrap_or_else(|err| {\n▮\n});" weiss--ahf-indent)
    ("v"  "Vec<▮>" weiss--ahf)
    ))



;; parent: 
(provide 'weiss_abbrevs_rust)
