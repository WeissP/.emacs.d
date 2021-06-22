
(defun snails-backend-imenu-candidates (buffer)
  (with-current-buffer buffer
    (prog1
        (if
            ;; Use cache candidates when `snails-backend-imenu-cached-candidates' is non-nil.
            ;; Need re-generate cache when user switch different buffer.
            (and snails-backend-imenu-cached-candidates
                 (or
                  (not snails-backend-imenu-cached-buffer)
                  (equal snails-backend-imenu-cached-buffer buffer)))
            snails-backend-imenu-cached-candidates
          (setq snails-backend-imenu-cached-candidates
                (let ((index (ignore-errors (imenu--make-index-alist t))))
                  (when index
                    (snails-backend-imenu-build-candidates
                     (delete (assoc "*Rescan*" index) index))))))
      (setq snails-backend-imenu-cached-buffer buffer))))

(imenu--make-index-alist t)
(defun weiss-test ()
  "DOCSTRING"
  (interactive)
  (message ": %s" (snails-backend-imenu-candidates (current-buffer))))

(let ((test '(("getCategories() : String[]" 15 26) . "12"))
      )
  (add-ca test "config")  
  test
  )

((("getCategories() : String[]" 15 26) . "12") (("getGoal() : String" 9 18) . "qwe"))

: ((snails-backend-imenu-cached-candidates . #<marker at 2031 in snails-backend-imenu.el>) (snails-backend-imenu-cached-buffer . #<marker at 2083 in snails-backend-imenu.el>) (snails-backend-imenu-candidates . #<marker at 2132 in snails-backend-imenu.el>) (snails-backend-imenu-build-candidates . #<marker at 3001 in snails-backend-imenu.el>))

(("*Rescan*" . -99) ("Variables" ("snails-backend-imenu-cached-candidates" . #<marker at 2058 in snails-backend-imenu.el>) ("snails-backend-imenu-cached-buffer" . #<marker at 2110 in snails-backend-imenu.el>)) ("snails-backend-imenu-candidates" . #<marker at 2159 in snails-backend-imenu.el>) ("snails-backend-imenu-build-candidates" . #<marker at 3028 in snails-backend-imenu.el>))




(snails-backend-imenu-candidates (current-buffer))
(listp ( (imenu--make-index-alist t)))

(("*Rescan*" . -99) ("Variables" ("snails-backend-imenu-cached-candidates" . #<marker at 2031 in snails-backend-imenu.el>) ("snails-backend-imenu-cached-buffer" . #<marker at 2083 in snails-backend-imenu.el>)) ("snails-backend-imenu-candidates" . #<marker at 2132 in snails-backend-imenu.el>) ("snails-backend-imenu-build-candidates" . #<marker at 3028 in snails-backend-imenu.el>))



(defun add-ca (list key)
  "DOCSTRING"
  (interactive)
  (cond
   ((stringp (car list))
    (setf (car list) (format "%s->%s" key (car list))))
   ((listp list)
    (add-ca (car list) key)
    )
   )
  )

(defun weiss-test ()
  "DOCSTRING"
  (interactive)
  (message "%s" (let ((index (ignore-errors (imenu--make-index-alist t))))
                  (when index
                    ;; (snails-backend-imenu-build-candidates
                    (build-candidates
                     (delete (assoc "*Rescan*" index) index)))))
  )

(defun build-candidates (alist)
  "DOCSTRING"
  (interactive)
  (cl-mapcan
   (lambda (elm)
     (cond
      ((imenu--subalist-p elm)
       (let ((sublist (cl-loop for (e . v) in (cdr elm) collect
                               (cons e (if (integerp v) (copy-marker v) v))))
             )
         (dolist (x sublist sublist) 
           (add-ca x (car elm))
           )       
         )
       )
      ((listp elm)
       (message "list: %s" elm)
       (elm)
       )
      )
          
     )
   alist
   )    
  )

((Variables->snails-backend-imenu-cached-candidates . #<marker at 2031 in snails-backend-imenu.el>) (Variables->snails-backend-imenu-cached-buffer . #<marker at 2083 in snails-backend-imenu.el>) snails-backend-imenu-candidates snails-backend-imenu-build-candidates . #<marker at 3001 in snails-backend-imenu.el>)

((snails-backend-imenu-cached-candidates . #<marker at 2031 in snails-backend-imenu.el>) (snails-backend-imenu-cached-buffer . #<marker at 2083 in snails-backend-imenu.el>) (snails-backend-imenu-candidates snails-backend-imenu-build-candidates . #<marker at 3001 in snails-backend-imenu.el>) (snails-backend-imenu-build-candidates . #<marker at 3001 in snails-backend-imenu.el>))

(("*Rescan*" . -99) ("Variables" ("snails-backend-imenu-cached-candidates" . #<marker at 2031 in snails-backend-imenu.el>) ("snails-backend-imenu-cached-buffer" . #<marker at 2083 in snails-backend-imenu.el>)) ("snails-backend-imenu-candidates" "snails-backend-imenu-build-candidates" . #<marker at 3028 in snails-backend-imenu.el>) ("snails-backend-imenu-build-candidates" . #<marker at 3028 in snails-backend-imenu.el>))

x: ((getCategories() : String[] 15 26) . p)
x: ((getGoal() : String 9 18) . ppp)
x: ((getConnection() : Connection 15 28) . aa)


("Variables" ("snails-backend-imenu-cached-candidates" . #<marker at 2031 in snails-backend-imenu.el>) ("snails-backend-imenu-cached-buffer" . #<marker at 2083 in snails-backend-imenu.el>))

(("Config" (#("getCategories() : String[]" 15 26 ...) . #<marker at 16362 in QuizzesSearch.java>) (#("getGoal() : String" 9 18 ...) . #<marker at 16064 in QuizzesSearch.java>) (#("getInput() : String[]" 10 21 ...) . #<marker at 16474 in QuizzesSearch.java>) (#("getInputPath() : String" 14 23 ...) . #<marker at 17114 in QuizzesSearch.java>) (#("getKeywords() : String[]" 13 24 ...) . #<marker at 16150 in QuizzesSearch.java>) (#("getStartId() : int" 12 18 ...) . #<marker at 17206 in QuizzesSearch.java>) (#("getTypes() : String[]" 10 21 ...) . #<marker at 16259 in QuizzesSearch.java>) ("prop" . #<marker at 15632 in QuizzesSearch.java>) ("Config(String)" . #<marker at 15662 in QuizzesSearch.java>))
 ("DBConnector" (#("getConnection() : Connection" 15 28 ...) . #<marker at 22299 in QuizzesSearch.java>) (#("getJDBCString() : String" 15 24 ...) . #<marker at 22163 in QuizzesSearch.java>) (#("getMaxId() : int" 10 16 ...) . #<marker at 22541 in QuizzesSearch.java>) (#("testConnection() : boolean" 16 26 ...) . #<marker at 21939 in QuizzesSearch.java>) ("conn" . #<marker at 21739 in QuizzesSearch.java>) ("DATABASE" . #<marker at 21686 in QuizzesSearch.java>) ("HOST" . #<marker at 21484 in QuizzesSearch.java>) ("PASSWORD" . #<marker at 21631 in QuizzesSearch.java>) ("PORT" . #<marker at 21535 in QuizzesSearch.java>) ("USER" . #<marker at 21580 in QuizzesSearch.java>)) ("Markdown" (#("getFileName() : String" 13 22 ...) . #<marker at 13325 in QuizzesSearch.java>) (#("getImageSyntax() : String" 16 25 ...) . #<marker at 13249 in QuizzesSearch.java>) (#("write(FileWriter) : void" 17 24 ...) . #<marker at 13410 in QuizzesSearch.java>) ("s" . #<marker at 13123 in QuizzesSearch.java>) ("Markdown(Config)" . #<marker at 13131 in QuizzesSearch.java>)) ("Output" (#("getFileName() : String" 13 22 ...) . #<marker at 2462 in QuizzesSearch.java>) (#("getImageSyntax() : String" 16 25 ...) . #<marker at 2412 in QuizzesSearch.java>) (#("output() : void" 8 15 ...) . #<marker at 1999 in QuizzesSearch.java>) (#("processPictures(String) : String" 23 32 ...) . #<marker at 2590 in QuizzesSearch.java>) (#("write(FileWriter) : void" 17 24 ...) . #<marker at 2507 in QuizzesSearch.java>) ("filePath" . #<marker at 1877 in QuizzesSearch.java>) ("q" . #<marker at 1930 in QuizzesSearch.java>) ("s" . #<marker at 1916 in QuizzesSearch.java>) ("Output(Config)" . #<marker at 1938 in QuizzesSearch.java>)) ("QIDTuple" (#("compareTo(QIDTuple) : int" 19 25 ...) . #<marker at 17734 in QuizzesSearch.java>) (#("getId() : int" 7 13 ...) . #<marker at 17829 in QuizzesSearch.java>) ("qId" . #<marker at 17644 in QuizzesSearch.java>) ("QIDTuple(int)" . #<marker at 17654 in QuizzesSearch.java>)) ("QuizzesSearch" (#("main(String[]) : void" 14 21 ...) . #<marker at 665 in QuizzesSearch.java>) (#("sqlEscape(String, boolean) : String" 26 35 ...) . #<marker at 1636 in QuizzesSearch.java>)) ("SearchEngine" (#("getQuizChoices(Integer) : quizChoicesTuple" 23 42 ...) . #<marker at 20934 in QuizzesSearch.java>) (#("getQuizContent() : List<quizContentTuple>" 16 41 ...) . #<marker at 19773 in QuizzesSearch.java>) (#("getQuizSolution(Integer) : quizSolutionTuple" 24 44 ...) . #<marker at 20392 in QuizzesSearch.java>) (#("processKeywords() : String" 17 26 ...) . #<marker at 19285 in QuizzesSearch.java>) (#("processQuizTypes() : String" 18 27 ...) . #<marker at 18775 in QuizzesSearch.java>) ("queris" . #<marker at 18675 in QuizzesSearch.java>) ("SearchEngine(Config)" . #<marker at 18688 in QuizzesSearch.java>)) ("Sql" (#("category() : String" 10 19 ...) . #<marker at 4215 in QuizzesSearch.java>) (#("createdAt() : String" 11 20 ...) . #<marker at 4368 in QuizzesSearch.java>) (#("duration() : String" 10 19 ...) . #<marker at 4320 in QuizzesSearch.java>) (#("filename() : String" 10 19 ...) . #<marker at 4022 in QuizzesSearch.java>) (#("getFileName() : String" 13 22 ...) . #<marker at 4943 in QuizzesSearch.java>) (#("links() : String[]" 7 18 ...) . #<marker at 4116 in QuizzesSearch.java>) (#("parseInfo(String) : void" 17 24 ...) . #<marker at 5481 in QuizzesSearch.java>) (#("qidInFile() : String" 11 20 ...) . #<marker at 3952 in QuizzesSearch.java>) (#("renamePictures(String, Integer) : String" 31 40 ...) . #<marker at 5969 in QuizzesSearch.java>) (#("score() : String" 7 16 ...) . #<marker at 4417 in QuizzesSearch.java>) (#("type() : String" 6 15 ...) . #<marker at 4070 in QuizzesSearch.java>) ...) ("quizChoicesTuple" (#("getQuizChoices() : ArrayList<String>" 16 36 ...) . #<marker at 18592 in QuizzesSearch.java>) ("choices" . #<marker at 18435 in QuizzesSearch.java>) ("quizChoicesTuple(int, ArrayList<String>)" . #<marker at 18449 in QuizzesSearch.java>)) ("quizContentTuple" (#("getQuizContent() : String" 16 25 ...) . #<marker at 18061 in QuizzesSearch.java>) ("content" . #<marker at 17926 in QuizzesSearch.java>) ("quizContentTuple(int, String)" . #<marker at 17940 in QuizzesSearch.java>)) ("quizSolutionTuple" (#("getQuizSolution() : String" 17 26 ...) . #<marker at 18312 in QuizzesSearch.java>) ("solution" . #<marker at 18172 in QuizzesSearch.java>) ("quizSolutionTuple(int, String)" . #<marker at 18187 in QuizzesSearch.java>)))

