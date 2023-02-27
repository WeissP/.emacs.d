(with-eval-after-load 'rustic-mode
  (when (boundp 'rustic-mode-abbrev-table)
    (clear-abbrev-table rustic-mode-abbrev-table))

  (define-abbrev-table 'rustic-mode-abbrev-table
    '(
      ("a"  "async " weiss--ahf)
      ("b"  "Box" weiss--ahf)
      ("Box"  "Box<▮>" weiss--ahf)
      ("bm"  "BTreeMap" weiss--ahf)
      ("BTreeMap"  "BTreeMap<▮,>" weiss--ahf)
      ("bs"  "BTreeSet" weiss--ahf)
      ("BTreeSet"  "BTreeSet<▮>" weiss--ahf)
      ("d"  "#[derive(▮)]" weiss--ahf-indent)
      ("dsl"  "use schema::▮::dsl;" weiss--ahf-indent)
      ("en"  "enum ▮ {\n\n}" weiss--ahf-indent)
      ("epn"  "eprintln!(\"▮\")" weiss--ahf-indent)
      ("er"  "Err" weiss--ahf-indent)
      ("Err"  "Err(▮)" weiss--ahf-indent)
      ("f"  "for ▮ {\n\n}" weiss--ahf-indent)
      ("fn"  "fn ▮() -> () {\ntodo!()\n}" weiss--ahf-indent)
      ("fns"  "fn ▮(&self) -> () {\ntodo!()\n}" weiss--ahf-indent)
      ("fnt"  "fn ▮(&self) -> ();" weiss--ahf-indent)
      ("fmt"  "format!(\"{}\",▮)" weiss--ahf)
      ("if"  "if ▮ {\n\n}" weiss--ahf-indent)
      ("il"  "if let Some(▮)  {\n\n}" weiss--ahf-indent)
      ("wl"  "while let Some(▮)  {\n\n}" weiss--ahf-indent)
      ("im"  "impl" weiss--ahf-indent)
      ("impl"  "impl ▮ for {\n\n}" weiss--ahf-indent)
      ("l"  "let" weiss--ahf)
      ("lm"  "let mut" weiss--ahf)
      ("mut"  "mut ▮;" weiss--ahf)
      ("macro"  "macro_rules! ▮ {\n    ($e:expr) => {\n\n    };\n}\n" weiss--ahf)
      ("let"  "let ▮;" weiss--ahf)
      ("lp"  "loop {\n▮\n}; " weiss--ahf-indent)
      ("m"  "match" weiss--ahf)
      ("hm"  "HashMap" weiss--ahf)
      ("HashMap"  "HashMap<▮,>" weiss--ahf)
      ("match"  "match ▮ {}" weiss--ahf)
      ("n"  "None" weiss--ahf)
      ("oe"  "Ok(▮) => ,\nErr(_) => ," weiss--ahf-indent)
      ("ok"  "Ok" weiss--ahf-indent)
      ("Ok"  "Ok(▮)" weiss--ahf-indent)
      ("op"  "Option" weiss--ahf-indent)
      ("Option"  "Option<▮>" weiss--ahf-indent)
      ("p"  "pub " weiss--ahf)
      ("raw"  "r#\"\n▮\n\"#\n " weiss--ahf-indent)
      ("pd"  "println!(\"{:?}\",▮);" weiss--ahf)
      ("pr"  "println!(\"{}\",▮);" weiss--ahf)
      ("pn"  "println!(\"▮\");" weiss--ahf)
      ("rs"  "Result" weiss--ahf-indent)
      ("Result"  "Result<▮>" weiss--ahf-indent)
      ("rt"  "return ▮;" weiss--ahf-indent)
      ("s"  "Some" weiss--ahf)
      ("me"  ".map_err(Into::into)" weiss--ahf)
      ("Some"  "Some(▮)" weiss--ahf)
      ("st"  "struct ▮ {\n\n}" weiss--ahf-indent)
      ("tr"  "trait ▮ {\n\n}" weiss--ahf-indent)
      ("test"  "#[cfg(test)]\nmod tests {\n\n#[test]\n▮\n}" weiss--ahf-indent)
      ("td"  "todo!()" weiss--ahf-indent)
      ("u"  "use " weiss--ahf)
      ("ue"  "unwrap_or_else(|err| {\n▮\n});" weiss--ahf-indent)
      ("v"  "Vec" weiss--ahf)
      ("rc"  "Rc" weiss--ahf)
      ("Rc"  "Rc<▮>" weiss--ahf)
      ("arc"  "Arc" weiss--ahf)
      ("Arc"  "Arc<▮>" weiss--ahf)
      ("Vec"  "Vec<▮>" weiss--ahf)

      ("test" "#[cfg(test)]\nmod tests {\n    use super::*;\n    #[test]\n    fn ▮() {\n\n    }    \n}" weiss--ahf-indent)
      ("cfg" "#[cfg(▮)]" weiss--ahf)

      ("qr" "    sqlx::query!(r#\"\n▮\n\"#,).fetch_one(pool).await.with_context(|| format!(\"{:?}\",))" weiss--ahf)
      ("qa" "    sqlx::query_as!(▮, r#\"\n\n\"#,).fetch_one(pool).await.with_context(|| format!(\"{:?}\",))" weiss--ahf)
      ))
  )

(provide 'weiss_abbrevs_rust)
