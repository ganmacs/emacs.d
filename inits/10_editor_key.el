;;; 10_editor.el --- editor basic
;;; Commentary:
;;; Code:

;; Lisp
(defvar kb-lisp
  '(("."  . (key-combo-execute-original))
    ("SPC"  . (key-combo-execute-original))
    ("SPC ." . " . ")
    (","  . (key-combo-execute-original))
    (",@" . " ,@")
    (";"  . (";; " "; "))
    (";=" . ";=> ")
    ("="  . ("= " key-combo-execute-original))
    (">=" . ">= ")
    ("<=" . "<= ")
    ("-"  . (key-combo-execute-original))))

(defvar kb-lisp-mode-hooks
  '(lisp-mode-hook
    emacs-lisp-mode-hook
    lisp-interaction-mode-hook
    inferior-gauche-mode-hook
    scheme-mode-hook
    clojure-mode-hook))

;; C
(defvar kb-c
  '(("+"  . (" + " "++" key-combo-execute-original))
    ("->" . "->")
    ("-"  . (" - " "--" key-combo-execute-original))))

;; Go
(defvar kb-go
  '(("+"  . (" + " "++" key-combo-execute-original))
    ("-"  . (" - " "--" key-combo-execute-original))
    (":="  . " := ")
    (":" . (key-combo-execute-original " := "))
    ("<-" . " <- ")
    ("<" . (key-combo-execute-original " < " " << "))))

;; Java
(defvar kb-java
  '((","  . ", ")
    ("="  . (" = " " == "))
    ("+"  . (" + " "++" key-combo-execute-original))
    ("/"  . (key-combo-execute-original " / " "//"))
    ("-"  . (key-combo-execute-original " - " "--"))
    (">=" . " >= ")
    (">>=" . " >>= ")
    ("<<=" . " <<= ")
    ("=*" . " =* ")
    ("+=" . " += ")
    ("-=" . " -= ")
    (">" . (key-combo-execute-original " > " " >> "))
    ("%"  . (key-combo-execute-original " % "))
    ("%="  . " %= ")
    ("!" . key-combo-execute-original)
    ("!="  . " != " )
    ("&"  . (key-combo-execute-original " && "))
    ("*="  . " *= " )
    ("<" . (key-combo-execute-original " < " " << "))
    ("<=" . " <= ")
    ("/=" . " /= ")))

;; C++
(defvar kb-c++
  '((","  . ", ")
    ("="  . (" = " " == "))
    ("+"  . (" + " "++" key-combo-execute-original))
    ("/"  . (key-combo-execute-original " / " "//"))
    ("-"  . (key-combo-execute-original " - " "--"))
    (">=" . " >= ")
    (">>=" . " >>= ")
    ("<<=" . " <<= ")
    ("=*" . " =* ")
    ("+=" . " += ")
    ("-=" . " -= ")
    (">" . (key-combo-execute-original " > " " >> "))
    ("%"  . (key-combo-execute-original " % "))
    ("%="  . " %= ")
    ("!" . key-combo-execute-original)
    ("!="  . " != " )
    ("&"  . (key-combo-execute-original " && "))
    ("*="  . " *= " )
    ("<" . (key-combo-execute-original " < " " << "))
    ("<=" . " <= ")
    ("/=" . " /= ")))

;; Haskell
(defvar kb-haskell
  '((","  . ", ")
    ("="  . (" = " " == "))
    ("+"  . (" + " " ++ " key-combo-execute-original))
    ("/"  . (key-combo-execute-original " / " "//"))
    ("-"  . (key-combo-execute-original " - " "-- "))
    (":" . (key-combo-execute-original " :: " " : "))
    ("->" . " -> ")
    ("<-" . " <- ")
    (">>=" . " >>= ")
    ("=<<" . " =<< ")))

;; Ruby
(defvar kb-ruby
  '(("-"  . (key-combo-execute-original " - "))
    ("+"  . " + ")
    ("|"  . (" | " " || " "|`!!'|"))
    ("=~" . " =~ ")
    ("/" . (key-combo-execute-original " / " " /`!!'/"))
    ("*"  . (" * " key-combo-execute-original "**") )
    ("**"  . "**" )
    ("**=" . " **= ")
    ("<" . (" < " " << "))
    ("&&=" . " &&= ")
    ("||=" . " ||= ")
    (";" . "; ")
    ("#" . "# ")))

;; Python
(defvar kb-python
  '(("/" . (key-combo-execute-original " / "))
    ("-"  . (key-combo-execute-original " - "))
    ("+"  . (" + " key-combo-execute-original))
    ("|"  . (" | " " || ")))
  )

;; Javascript
(defvar kb-js2
  '(
    ("=" . (" = " " == " " === "))
    ("!"  . (key-combo-execute-original))
    ("!="  . (" != " " !== ") )
    ("/" . (" / " "// " "/`!!'/" key-combo-execute-original))
    ("-" . (key-combo-execute-original " - "))
    ("+"  . (" + " "++"))
    ("|"  . (" | " " || "))))

;; Coffee
(defvar kb-coffee
  '(
    ("-"  . (key-combo-execute-original " - "))
    ("+"  . " + ")
    ("|"  . (" | " " || "))
    ("->" . " -> ")
    ("/" . (" / " " /`!!'/" key-combo-execute-original))))

;; CSS
(defvar kb-css
  '((":" . ": ")
    (","  . ", ")))

;; PHP
(defvar kb-php
  '(
    ("{" . (key-combo-execute-original))
    ("+"  . (" + " "++"))
    ("-" . (key-combo-execute-original " - "))
    ("/" . (key-combo-execute-original " / " "// "))
    ("=" . (" = " " == " " === "))))

;; Markdown
(defvar kb-markdown
  '(
    ;; ("。" . "．")
    ;; ("、"  . "，")
    ("　" . ("	" key-combo-execute-original))))

;; Tuareg
(defvar kb-tuareg
  '(("-"  . (key-combo-execute-original " - "))
    ("+"  . " + ")
    ("/"  . (key-combo-execute-original " / "))
    ("*"  . (" * " "**" key-combo-execute-original) )
    ("+."  . " +. ")
    ("-."  . " -. ")
    ("*."  . " *. ")
    ("/."  . " /. ")
    (":="  . " := ")
    ("|"  . (" | " " || "))
    ("&"  . (" & " " && "))
    (";"  . ("; " ";;"))
    (":"  . (key-combo-execute-original " :: "))
    ("->" . " -> ")))

;; Tex
(defvar kb-yatex
  '(("。" . "．")
    ("、"  . "，")))

;; Scala
(defvar kb-ensime
  '(
    ("+"  . (key-combo-execute-original " + " " ++ "))
    ("/"  . (" / " "// "))
    ("-"  . (key-combo-execute-original " - "))
    ("->" . " -> ")
    ("<-" . " <- ")
    ("||" . " || ")
    ("/:" . " /: ")
    (":"  . (": " " :: " " ::: "))
    ("<%" . " <% ")
    ("<:" . " <: ")
    (":>" . " :> ")
    )
  )

;; rust
(defvar kb-rust
  '(("+"  . (key-combo-execute-original " + " " ++ "))
    (","  . ", ")
    ("/"  . (" / " "// "))
    ("-"  . (key-combo-execute-original " - "))
    ("=" . (" = " " == "))
    ("->" . " -> ")
    ("=>" . " => ")
    ("|"  . (" | " " || " "|`!!'|"))
    (":"  . (": " "::"))))

;; Elixir
(defvar kb-elixir
  '(("+"  . (" + " " ++ "))
    ("/"  . (" / " "//" key-combo-execute-original))
    ("<" . (" < " "<<" key-combo-execute-original  ))
    (">" . (" > " ">>" key-combo-execute-original))
    ("|" . (" | " " || " key-combo-execute-original))
    ("|>" . " |> ")
    ("\\"  . (key-combo-execute-original " \\\\ "))
    ("-"  . (" - " key-combo-execute-original))
    ("->" . " -> ")
    ("<-" . " <- ")
    ("<>"  . " <> ")))


;; commom-setting

(defvar kb-common
  '((","  . ", ")
    ("="  . (" = " " == "))
    ("=>" . " => ")
    ("=*" . " =* ")
    ("+=" . " += ")
    ("-=" . " -= ")
    (">" . (key-combo-execute-original " > "))
    (">=" . " >= ")
    ("%"  . (key-combo-execute-original " % "))
    ("%="  . " %= ")
    ("!" . key-combo-execute-original)
    ("!="  . " != " )
    ("&"  . (key-combo-execute-original " && "))
    ("*"  . (key-combo-execute-original " * ") )
    ("*="  . " *= " )
    ("<" . (key-combo-execute-original " < "))
    ("<=" . " <= ")
    ("/=" . " /= ")))

(defvar kb-common-mode-hooks
  '(ruby-mode-hook
    coffee-mode-hook
    php-mode-hook
    python-mode-hook
    js2-mode-hook
    tuareg-mode-hook
    enh-ruby-mode-hook
    c-mode-common-hook
    ensime-mode-hook
    go-mode-hook
    elixir-mode-hook))

(use-package key-combo
  :config

  (global-key-combo-mode t)
  (key-combo-define-hook kb-common-mode-hooks 'kb-common-load kb-common)
  (key-combo-define-hook kb-lisp-mode-hooks 'kb-lisp-load kb-lisp)
  (key-combo-define-hook 'ruby-mode-hook 'kb-ruby-load kb-ruby)
  (key-combo-define-hook 'python-mode-hook 'kb-python-load kb-python)
  (key-combo-define-hook 'css-mode-hook 'kb-css-load kb-css)
  (key-combo-define-hook 'coffee-mode-hook 'kb-coffee-load kb-coffee)
  (key-combo-define-hook 'markdown-mode-hook 'kb-markdown-load kb-markdown)
  (key-combo-define-hook 'yatex-mode-hook 'kb-yatex-load kb-yatex)
  (key-combo-define-hook 'js2-mode-hook 'kb-js2-load kb-js2)
  (key-combo-define-hook 'php-mode-hook 'kb-php-load kb-php)
  (key-combo-define-hook 'java-mode-hook 'kb-java-load kb-java)
  (key-combo-define-hook 'c++-mode-hook 'kb-c++-load kb-c++)
  (key-combo-define-hook 'haskell-mode-hook 'kb-haskell-load kb-haskell)
  (key-combo-define-hook 'tuareg-mode-hook 'kb-tuareg-load kb-tuareg)
  (key-combo-define-hook 'ensime-mode-hook 'kb-ensime-load kb-ensime)
  (key-combo-define-hook 'go-mode-hook 'kb-go-load kb-go)
  (key-combo-define-hook 'elixir-mode-hook 'kb-elixir-load kb-elixir)
  (key-combo-define-hook 'c-mode-hook 'kb-c-load kb-c)
  (key-combo-define-hook 'rust-mode-hook 'rust-c-load kb-rust))

;;; 10_editor_key.el ends here
