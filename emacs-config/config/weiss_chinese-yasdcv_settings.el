(with-eval-after-load 'chinese-yasdcv
  (setq yasdcv-sdcv-dicts
        '(
          ("牛津现代英汉双解词典" "牛津现代英汉双解词典" nil t)
          ("Duden" "Duden" "duden" t)
          ("新德汉词典" "新德汉词典" "xindehan" t)
          ("niujing"    "牛津高阶英汉双解"  "oald" t)
          ("21shiji"    "21世纪英汉汉英双向词典" "21cen" t)
          ("21shjikj"   "21世纪双语科技词典"  nil t)))
  (setq yasdcv-wiktionary-lang '("de" "en"))
  )

;; parent: 
(provide 'weiss_chinese-yasdcv_settings)
