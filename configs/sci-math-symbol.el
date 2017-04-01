;;-*- coding: utf-8 -*-
;; sci-math-symbol.el -- a mode to input math chars

;; Copyright © 2010, 2011 by Xah Lee
;; Copyright © 2017, by scinart

;; Author: Xah Lee ( http://xahlee.org/ )
;; Author: scinart (scinart.github.io)
;; Keywords: math symbols, unicode, input

;; You can redistribute this program and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation version 2

;;; DESCRIPTION

;; A minor mode for inputing hundreds of math symbols
;; for download location and documentation, see:
;; http://ergoemacs.org/emacs/xmsi-math-symbols-input.html

;;; DOCUMENTATION

;; Type “inf”, then `sci-change-to-symbol`, then it becomes “∞”.
;; Other examples:
;; alpha ⇒ α ; and ⇒ ∧ ; != ⇒ ≠
;; etc.

;; For full list, call “sci-list-math-symbols”.

;; The abbreviations are based on Mathematica's aliases 【Esc abbrv Esc】 and SGML/HTML/XML char entity abbreviations.

;; To see the inline documentation, call “describe-function”, then type “sci-mode”.
;; (if you have not load the mode yet, first load it by calling “sci-mode”.)

(defvar sci-abrvs (make-hash-table :test 'equal)
  "A abbreviation hash table that maps a string to unicode char.")

(defconst sci-abrvs-fw ;;FULL-WIDTH-CHAR : fw{char}
  '(
    ("fw,"."，") ("fw."."．") ("fw:"."：") ("fw;"."；")
    ("fw!"."！") ("fw?"."？") ("fw`"."｀") ("fw'"."＇") ("fw\""."＂")
    ("fw&"."＆") ("fw("."（") ("fw)"."）") ("fw["."［") ("fw]"."］") ("fw{"."｛") ("fw}"."｝")
    ("fw@"."＠") ("fw^"."＾") ("fw`"."｀") ("fw~"."～") ("fw_"."＿") ("fw¯"."￣");MACRON
    ("fw#"."＃") ("fw+"."＋") ("fw-"."－") ("fw*"."＊") ("fw="."＝") ("fw<"."＜") ("fw>"."＞")
    ("fw%"."％") ("fw|"."｜") ("fw¦"."￤") ("fw/"."／") ("fw\\"."＼") ("fw¬"."￢")
    ("fw(("."｟") ("fw))"."｠") ("fw$"."＄") ("fw£"."￡") ("fw¢"."￠") ("fw₩"."￦") ; WON SIGN
    ("fw¥"."￥") ; YEN SIGN
    ("fw0"."０") ("fw1"."１") ("fw2"."２") ("fw3"."３") ("fw4"."４")
    ("fw5"."５") ("fw6"."６") ("fw7"."７") ("fw8"."８") ("fw9"."９")
    ("fwA"."Ａ") ("fwB"."Ｂ") ("fwC"."Ｃ") ("fwD"."Ｄ") ("fwE"."Ｅ") ("fwF"."Ｆ") ("fwG"."Ｇ")
    ("fwH"."Ｈ") ("fwI"."Ｉ") ("fwJ"."Ｊ") ("fwK"."Ｋ") ("fwL"."Ｌ") ("fwM"."Ｍ") ("fwN"."Ｎ")
    ("fwO"."Ｏ") ("fwP"."Ｐ") ("fwQ"."Ｑ") ("fwR"."Ｒ") ("fwS"."Ｓ") ("fwT"."Ｔ")
    ("fwU"."Ｕ") ("fwV"."Ｖ") ("fwW"."Ｗ") ("fwX"."Ｘ") ("fwY"."Ｙ") ("fwZ"."Ｚ")
    ("fwa"."ａ") ("fwb"."ｂ") ("fwc"."ｃ") ("fwd"."ｄ") ("fwe"."ｅ") ("fwf"."ｆ") ("fwg"."ｇ")
    ("fwh"."ｈ") ("fwi"."ｉ") ("fwj"."ｊ") ("fwk"."ｋ") ("fwl"."ｌ") ("fwm"."ｍ") ("fwn"."ｎ")
    ("fwo"."ｏ") ("fwp"."ｐ") ("fwq"."ｑ") ("fwr"."ｒ") ("fws"."ｓ") ("fwt"."ｔ")
    ("fwu"."ｕ") ("fwv"."ｖ") ("fww"."ｗ") ("fwx"."ｘ") ("fwy"."ｙ") ("fwz"."ｚ")))
(defconst sci-abrvs-greek ;;GREEK ALPHABET : Alpha->Α, alpha->α
  '(
    ("Alpha"."Α") ("Beta"."Β") ("Gamma"."Γ") ("Delta"."Δ") ("Epsilon"."Ε") ("Zeta"."Ζ") ("Eta"."Η")
    ("Theta"."Θ") ("Iota"."Ι") ("Kappa"."Κ") ("Lambda"."Λ") ("Mu"."Μ") ("Nu"."Ν") ("Xi"."Ξ")
    ("Omicron"."Ο") ("Pi"."Π") ("Rho"."Ρ") ("Sigma"."Σ") ("Tau"."Τ") ("Upsilon"."Υ")
    ("Phi"."Φ") ("Chi"."Χ") ("Psi"."Ψ") ("Omega"."Ω")

    ("alpha"."α") ("beta"."β") ("gamma"."γ") ("delta"."δ") ("epsilon"."ε") ("zeta"."ζ") ("eta"."η")
    ("theta"."θ") ("iota"."ι") ("kappa"."κ") ("lambda"."λ") ("mu"."μ") ("nu"."ν") ("xi"."ξ")
    ("omicron"."ο") ("pi"."π") ("rho"."ρ") ("sigmaf"."ς") ("sigma"."σ") ("tau"."τ")
    ("upsilon"."υ") ("phi"."ϕ") ("varphi"."φ") ("chi"."χ") ("psi"."ψ") ("omega"."ω")))
(defconst sci-abrvs-math
  '( ;;MATH
    ("R2"."ℝ²") ("R3"."ℝ³")
    ("real"."ℜ") ("image"."ℑ")
    ("floor"."⌊⌋") ("ceiling"."⌈⌉")
    ("any"."∀") ("exist"."∃") ("not"."¬")
    ("partial"."∂") ("der"."∂")
    ("nabla"."∇") ("del"."∇")
    ("in"."∈") ("notin"."∉") ("ni"."∋")
    ("minus"."−") ("asteriskop"."∗") ("times"."×") ("divide"."÷") ("cross"."⨯")
    ("product"."∏") ("sum"."∑")
    ("root"."√") ("root2"."√") ("root3"."∛") ("root4"."∜")
    ("proportion"."∝") ("inf"."∞")
    ("angle"."∠")
    ("and"."∧") ("or"."∨") ("xor"."⊻") ("nand"."⊼") ("nor"."⊽")
    ("intersection"."∩") ("union"."∪")
    ("int "."∫")
    ("c+"."⊕")    ("c*"."⊗")
    ;; ("*"."×")
    ;; ("'"."′")
    ;; ("''"."″")
    ;; ("'''"."‴")
    ("."."·")
    ("cint"."∮") ("ccint"."∲") ("cccint"."∳")
    ("therefore"."∴") ("because"."∵")
    ("tildeop"."∼")
    ("+-"."±") ("-+"."∓")
    ("~="."≅") ("~~"."≈")   ("!="."≠") ("==="."≡")
    ("<="."≤") (">="."≥") ("-<"."≺") (">-"."≻")
    ("-<="."⪰") (">-="."⪯") ("_<="."≼") (">_="."≽")
    ("subset"."⊂") ("superset"."⊃") ("nsubset"."⊄") ("subsete"."⊆") ("supersete"."⊇")
    ("emptyset"."∅")
    ("oplus"."⊕") ("otimes"."⊗")
    ("perpendicular"."⊥")
    ("dot"."⋅")
    ("lang"."〈") ("rang"."〉")
    ("⋮"."vdots") ("⋯"."cdots") ("⋰"."bdots") ("⋱"."ddots")))
(defconst sci-abrvs-letters
  (append 
   '( ;;ℂℍℕℙℚℝℤⅆⅇⅈⅉ bb{letter} \mathbb{}
     ("bbC"."ℂ") ("bbH"."ℍ") ("bbN"."ℕ") ("bbP"."ℙ") ("bbQ"."ℚ") ("bbR"."ℝ") ("bbZ"."ℤ")
     ("bbd"."ⅆ") ("bbe"."ⅇ") ("bbi"."ⅈ") ("bbj"."ⅉ"))
   '(;; sc+[Letter] Scripted letter forms. Most are outside BMP.
     ("sca"."𝒶") ("scb"."𝒷") ("scc"."𝒸") ("scd"."𝒹") ("sce"."ℯ") ; in BMP
     ("scf"."𝒻") ("scg"."ℊ") ; in BMP
     ("sch"."𝒽") ("sci"."𝒾") ("scj"."𝒿") ("sck"."𝓀") ("scl2"."𝓁") ("scl"."ℓ") ;in BMP
     ("scm"."𝓂") ("scn"."𝓃") ("sco"."ℴ") ; in BMP
     ("scp"."𝓅") ("scq"."𝓆") ("scw"."𝓌") ("scx"."𝓍") ("scy"."𝓎") ("scz"."𝓏")
     ("scB"."ℬ") ("scE"."ℰ") ("scF"."ℱ") ("scH"."ℋ") ("scI"."ℐ") ("scL"."ℒ") ("scM"."ℳ") ("scP"."℘") ("scR"."ℛ"))
   '(;; go+[Letter] gothic letter forms (aka FRANKTUR). Most are outside BMP
     ("goA"."𝔄") ("goB"."𝔅") ("goC"."ℭ") ("goD"."𝔇") ("goE"."𝔈") ("goF"."𝔉") ("goG"."𝔊")
     ("goH"."ℌ") ("goI"."ℑ") ("goJ"."𝔍") ("goK"."𝔎") ("goL"."𝔏") ("goM"."𝔐") ("goN"."𝔑")
     ("goO"."𝔒") ("goP"."𝔓") ("goQ"."𝔔") ("goR"."ℜ") ("goS"."𝔖") ("goT"."𝔗")
     ("goU"."𝔘") ("goV"."𝔙") ("goW"."𝔚") ("goX"."𝔛") ("goY"."𝔜") ("goZ"."ℨ")
     ("goa"."𝔞") ("gob"."𝔟") ("goc"."𝔠") ("god"."𝔡") ("goe"."𝔢") ("gof"."𝔣") ("gog"."𝔤")
     ("goh"."𝔥") ("goi"."𝔦") ("goj"."𝔧") ("gok"."𝔨") ("gol"."𝔩") ("gom"."𝔪") ("gon"."𝔫")
     ("goo"."𝔬") ("gop"."𝔭") ("goq"."𝔮") ("gor"."𝔯") ("gos"."𝔰") ("got"."𝔱")
     ("gou"."𝔲") ("gov"."𝔳") ("gow"."𝔴") ("gox"."𝔵") ("goy"."𝔶") ("goz"."𝔷"))))
(defconst sci-abrvs-number
  '( ;;NUMBER : c[0-9] | [0-9][,.]
    ("c1"."①")  ("c2"."②")  ("c3"."③")  ("c4"."④")  ("c5"."⑤")
    ("c6"."⑥")  ("c7"."⑦")  ("c8"."⑧")  ("c9"."⑨")  ("c0"."⓪")
    ("1."."⒈")  ("2."."⒉")  ("3."."⒊")  ("4."."⒋")  ("5."."⒌")
    ("6."."⒍")  ("7."."⒎")  ("8."."⒏")  ("9."."⒐")  ("0."."🄀")
    ("1,"."🄂")  ("2,"."🄃")  ("3,"."🄄")  ("4,"."🄅")  ("5,"."🄆")
    ("6,"."🄇")  ("7,"."🄈")  ("8,"."🄉")  ("9,"."🄊")  ("0,"."🄁")))
(defconst sci-abrvs-sub-and-super-scripts
  '( ;;COMBINE superscripts and subscripts : [\^_][0-9+-=(){some letter}]  
    ("^0"."⁰") ("^1"."¹") ("^2"."²") ("^3"."³") ("^4"."⁴")
    ("^5"."⁵") ("^6"."⁶") ("^7"."⁷") ("^8"."⁸") ("^9"."⁹")
    ("^+"."⁺") ("^-"."⁻") ("^="."⁼") ("^("."⁽") ("^)"."⁾") ("^n"."ⁿ") ("^i"."ⁱ")
    ("_("."₍") ("_)"."₎") ("_+"."₊") ("_-"."₋") ("_="."₌")
    ("_0"."₀") ("_1"."₁") ("_2"."₂") ("_3"."₃") ("_4"."₄")
    ("_5"."₅") ("_6"."₆") ("_7"."₇") ("_8"."₈") ("_9"."₉")
    ("_a"."ₐ") ("_e"."ₑ") ("_h"."ₕ") ("_i"."ᵢ") ("_j"."ⱼ") ("_k"."ₖ")
    ("_l"."ₗ") ("_m"."ₘ") ("_n"."ₙ") ("_o"."ₒ") ("_p"."ₚ")
    ("_r"."ᵣ") ("_s"."ₛ") ("_t"."ₜ") ("_u"."ᵤ") ("_v"."ᵥ") ("_x"."ₓ") ("_schwa"."ₔ")))
(defconst sci-abrvs-arrows
  '( ;;HIEROGLYPH : ARROWS
    ("<-"."←") ("->"."→") ("|v"."↓") ("|^"."↑")
    ("<-|"."↤") ("|->"."↦")
    ("<--"."⟵") ("-->"."⟶")
    ("<-->"."⟷") ("<->"."↔")
    ("!<-"."↚") ("!->"."↛") ("!<->"."↮")
    ("<=="."⇐") ("==>"."⇒") ("||^"."⇑") ("||v"."⇓")
    ("<==>"."⇔") ("!<=="."⇍") ("!==>"."⇏") ("!==>"."⇎")
    ("<==="."⟸") ("===>"."⟹") ("<===>"."⟺")
    ("<\\"."↖") ("\\>"."↘")
    ("<-|"."↵")
    ("|<-"."⇤") ("->|"."⇥") ("|<->|"."↹")))
(defconst sci-abrvs-hash-table-candidate
  (list
   sci-abrvs-fw
   sci-abrvs-greek
   sci-abrvs-math
   sci-abrvs-letters
   sci-abrvs-number
   sci-abrvs-sub-and-super-scripts
   sci-abrvs-arrows
   '( ;;LATIN-EXTEND : [\`\^\/\"\~]{letter}
     ("ograve"."̀") ("oacute"."́") ("ocircumflex"."̂") ("otilde"."̃")
     ("odiaeresis"."̈") ("oabove"."̊") ("omacron"."̄") ("obreve"."̆") ("oogonek"."̨")
     ("_a"."ā") ("_e"."ē") ("_i"."ī") ("_o"."ō") ("_u"."ū") ("_\"u"."ǖ")
     ("_A"."Ā") ("_E"."Ē") ("_I"."Ī") ("_O"."Ō") ("_U"."Ū") ("_\"U"."Ǖ")
     ("/a"."á") ("/e"."é") ("/i"."í") ("/o"."ó") ("/u"."ú") ("/\"u"."ǘ")
     ("/n"."ń") ("/y"."ý")
     ("/A"."Á") ("/E"."É") ("/I"."Í") ("/O"."Ó") ("/U"."Ú") ("/\"u"."Ǘ")
     ("/Y"."Ý")
     ("va"."ǎ") ("ve"."ě") ("vi"."ǐ") ("vo"."ǒ") ("vu"."ǔ") ("v\"u"."ǚ")
     ("vA"."Ǎ") ("vE"."Ě") ("vI"."Ǐ") ("vO"."Ǒ") ("vU"."Ǔ") ("v\"U"."Ǚ")
     ("`a"."à") ("`e"."è") ("`i"."ì") ("`o"."ò") ("`u"."ù") ("`\"u"."ǜ")
     ("`A"."À") ("`E"."È") ("`I"."Ì") ("`O"."Ò") ("`U"."Ù") ("`\"U"."Ǜ")
     ("^a"."â") ("^e"."ê") ("^i"."î") ("^o"."ô") ("^u"."û")
     ("^A"."Â") ("^E"."Ê") ("^I"."Î") ("^O"."Ô") ("^U"."Û")
     ("\"A"."Ä") ("\"E"."Ë") ("\"I"."Ï") ("\"O"."Ö") ("\"U"."Ü")
     ("\"a"."ä") ("\"e"."ë") ("\"i"."ï") ("\"o"."ö") ("\"u"."ü")
     ("\"s"."ß") ("\"y"."ÿ")
     ("oa"."å") ("ae"."æ")
     ("oA"."Å") ("AE"."Æ")
     ("~a"."ã") ("~n"."ñ") ("~o"."õ")
     ("~A"."Ã") ("~N"."Ñ") ("~O"."Õ"))
   '( ;;MUSIC-NOTES
     ("musicnotes"."♩♪♫♬") ("flat"."♭") ("natural"."♮") ("sharp"."♯"))
   '( ;;FULLNAME ASTRONOMY
     ("male"."♂") ("female"."♀")
     ("sun"."☉") ("sunray"."☼") ("moon"."☾") ("moonr"."☽")
     ("mercury"."☿") ("venus"."♀") ("earth"."♁") ("mars"."♂") ("jupiter"."♃")
     ("saturn"."♄") ("uranus"."♅") ("neptune"."♆") ("pluto"."♇")  ("comet"."☄"))
   '( ;;FULLNAME COMMON: from 00A0
     ("bull"."•")
     ("currency"."¤") ("cent"."¢") ("pound"."£")
     ("yen"."¥") ("euro"."€")
     ("brokenbar"."¦")
     ("section"."§")
     ("diaeresis"."¨")
     ("copyright"."©") ("register"."®")
     ("foi"."ª")
     ("macron"."¯")
     ("degree"."°")
     ("plusminus"."±")
     ("acute"."´")
     ("paragraph"."¶")
     ("cedilla"."¸")
     ("moi"."º")
     ("1/4"."¼") ("1/2"."½") ("3/4"."¾")
     ("0/00"."‰")
     ("tm"."™")
     ("..."."…")
     ("AE"."Æ")
     ("Ccedilla"."Ç")
     ("ETH"."Ð")
     ("Oslash"."Ø")
     ("THORN"."Þ")
     ("sharps"."ß")
     ("aelig"."æ")
     ("ccedilla"."ç")
     ("eth"."ð")
     ("oslash"."ø")
     ("thorn"."þ")
     ("OEg"."Œ")
     ("oeg"."œ")
     ("Scaron"."Š")
     ("scaron"."š")
     ("Yumlaut"."Ÿ")
     ("function"."ƒ")
     ("circumflex"."ˆ")
     ("tilde"."˜")
     ("thetasym"."ϑ")
     ("upsilonhoo"."ϒ")
     ("pisym"."ϖ")
     )
   '( ;;SYMBOL and Punctuations
     ("ndash"."–") ("mdash"."—") ("fdash"."‒")
     ("sbquo"."‚") ("dbquo"."„")
     ("dagger"."†") ("Dagger"."‡")
     ("prime"."′") ("Prime"."″")
     ("laquo"."‹") ("raquo"."›")
     ("oline"."‾")
     ("frasl"."⁄")
     ("weierp"."℘")
     ("--"."—") ("-"."−")
     ("s&"."﹠")
     ("!"."¡") ("?"."¿")
     ("?!"."⁈") ("!?"."⁉") ("!!"."‼") ("??"."⁇"))
   '( ;; computer keys and symbols
     ("cmd"."⌘") ("opt"."⌥") ("shift"."⇧")
     ("caret"."‸")
     ("power"."⎋") ("eject"."⏏") ("print"."⎙")
     ("pgup"."⇞") ("pgdn"."⇟") ("undo"."↶") ("redo"."↷")
     ("enter"."⌤")
     ("return"."⏎") ("return2"."↩") ("return3"."↵") 
     ("delete"."⌫") ("dell"."⌫") ("delr"."⌦") ("clear"."⌧")
     ("kbd"."⌨") ("_"."␣")
     ("lrarr"."⇄")
     ("ibeam"."⌶")
     ("prevpage"."⎗") ("nextpage"."⎘")
     ("watch"."⌚")
     ("hourglass"."⌛")
     ("scissor"."✂") ("scissorw"."✄")
     ("envelope"."✉")
     ("writing"."✍"))
   '( ;;punctuations
     ("["."「」") ("[["."『』")
     ("[2"."【】") ("[3"."〖〗")
     ("("."〔〕") ("<"."〈〉")
     ("<2"."‹›") ("<<2"."«»"))
   '( ;; letter-like forms
     ("aleph"."ℵ" )
     ("beth"."ב" )
     ("gimel"."ג" )
     ("daleth"."ד" )
     ("Digamma"."Ϝ" )
     ("digamma"."ϝ" )
     ("angstrom"."Å" )
     (":="."≔" ) ; define
     ("=:"."≕" ) ; define
     ("measuredangle"."∡" )
     ("sphericalangle"."∢" )
     ("rightangle"."⦜"))
   '( ;;shapes
     ("square"."■") ("square2"."□")
     ("circle"."●") ("circle2"."○")
     ("triangle"."▲") ("triangle2"."△")
     ("dtriangle"."▼") ("dtriangle2"."▽")
     ("ltriangle"."◀") ("ltriangle2"."◁")
     ("rtriangle"."▶") ("rtriangle2"."▷")
     ("star"."★") ("star2"."☆")
     ("spade"."♠") ("spade2"."♤")
     ("club"."♣") ("club2"."♧")
     ("heart"."♥") ("heart2"."♡")
     ("diamond"."♦") ("diamond2"."♢")
     ("dia"."◇") ("diab"."◆")
     (":)"."☺") (":("."☹")
     ("lozenge"."◊")))
)

(dolist (v sci-abrvs-hash-table-candidate t)
  (dolist (elem v t)
    (puthash (car elem) (cdr elem) sci-abrvs)
    (puthash (cdr elem) (car elem) sci-abrvs)))

(defun sci-hash-to-list (hashtable)
  "Return a list that represent the HASHTABLE."
  (let (mylist)
    (maphash (lambda (kk vv) (setq mylist (cons (list vv kk) mylist))) hashtable)
    mylist))

(defun sci-list-math-symbols ()
  "Print a list of math symbols and their input abbreviations.
See `sci-mode'."
  (interactive)
  (let (mylist mylistSorted)
    (setq mylist (sci-hash-to-list sci-abrvs))
    (setq mylistSorted (sort mylist (lambda (a b) (string< (car a) (car b)))) )
    (with-output-to-temp-buffer "*sci math symbol input*"
      (mapc (lambda (tt) "" (interactive)
	      (princ (concat (car tt) " " (car (cdr tt)) "\n")))
	    mylistSorted))))

(defvar sci-keymap (make-sparse-keymap)
  "Keymap for sci-math-symbols-input mode.")

(define-key sci-keymap (kbd "M-C M-SPC") 'sci-change-to-symbol)

(defun sci-abbr-to-symbol (inputString)
  "Returns a char corresponding to inputString."
  (let (resultSymbol charByNameResult)
    (setq resultSymbol (gethash inputString sci-abrvs))
    (cond
     (resultSymbol resultSymbol)
     ;; decimal. 「945」 or 「#945」
     ((string-match "\\`#?\\([0-9]+\\)\\'" inputString) (char-to-string (string-to-number (match-string 1 inputString))))
     ;; e.g. decimal with html entity markup. 「&#945;」
     ((string-match "\\`&#\\([0-9]+\\);\\'" inputString) (char-to-string (string-to-number (match-string 1 inputString))))
     ;; hex number. e.g. 「x3b1」 or 「#x3b1」
     ((string-match "\\`#?x\\([0-9a-fA-F]+\\)\\'" inputString) (char-to-string (string-to-number (match-string 1 inputString) 16)))
     ;; html entity hex number. e.g. 「&#x3b1;」
     ((string-match "\\`&#x\\([0-9a-fA-F]+\\);\\'" inputString) (char-to-string (string-to-number (match-string 1 inputString) 16)))
     ;; unicode full name. e.g. 「GREEK SMALL LETTER ALPHA」
     ((and (string-match "\\`\\([- a-zA-Z0-9]+\\)\\'" inputString) (setq charByNameResult (assoc-string inputString (ucs-names) t) )) (char-to-string (cdr charByNameResult)))
     (t nil))))

(defun sci-change-to-symbol (&optional print-message-when-no-match)
  "Change text selection or word to the left of cursor into a Unicode character.

A valid input can be any abbreviation listed by the command `sci-list-math-symbols', or, any of the following form:

 945     ← decimal
 #945    ← decimal with prefix #
 &#945;  ← XML entity syntax

 x3b1    ← hexadimal with prefix x
 #x3b1   ← hexadimal with prefix #x
 &#x3b1; ← XML entity syntax

Full Unicode name can also be used, e.g. 「greek small letter alpha」.

If preceded by `universal-argument', print error message when no valid abbrev found.

See also: `sci-mode'."
  (interactive "P")
  (let (p1 p2 inputStr resultSymbol)
    (if (region-active-p)
	;; if there's a text selection, then use that as input.
	(progn
	  (setq p1 (region-beginning))
	  (setq p2 (region-end))
	  (setq inputStr (buffer-substring-no-properties p1 p2) )
	  (setq resultSymbol (sci-abbr-to-symbol inputStr))
	  (when resultSymbol (progn (delete-region p1 p2) (insert resultSymbol)) ) )

      ;; if there's no text selection, grab all chars to the left of cursor point up to whitespace, try each string until there a valid abbrev found or none char left.
      (progn
	(setq p2 (point) )
	(while (= 32 (char-before p2))
	  (decf p2)
	  (backward-char 1))
	(skip-chars-backward "^ \t\n" -10)
	(setq p1 (point) )
	(while (and (not resultSymbol) (>= (- p2 p1) 1) )
	  (setq inputStr (buffer-substring-no-properties p1 p2) )
	  (setq resultSymbol (sci-abbr-to-symbol inputStr))
	  (when resultSymbol (progn (goto-char p2) (delete-region p1 p2) (insert resultSymbol)) )
	  (setq p1 (1+ p1)) ) ))

    (when (not resultSymbol)
      (goto-char p2)
      (when print-message-when-no-match (sci-list-math-symbols) (error "「%s」 is not a valid abbrevation or input. Call “sci-list-math-symbols” for a list. Or use a decimal e.g. 「945」 or hexadecimal e.g. 「x3b1」, or full Unicode name e.g. 「greek small letter alpha」."  inputStr)))))

(define-minor-mode sci-mode
  "Toggle math symbol input (minor) mode.

A mode for inputting a few math and other Unicode symbols.

Type “inf”, then press 【Shift+Space】, then it becomes “∞”.
Other examples:
 a ⇒ α
 p ⇒ π
 != ⇒ ≠
 >= ⇒ ≥
 => ⇒ ⇒
 -> ⇒ →
 and ⇒ ∧
etc.

If you have a text selection, then selected word will be taken as
input. For example, type 「sin(a)」, select the “a”, then press
 【Shift+Space】, then it becomse 「sin(α)」.

For the complete list of abbrevs, call `sci-list-math-symbols'.
All XML char entity abbrevs are supported. For example, 「copy」 ⇒ 「©」.

Decimal and hexadecimal can also be used. Example:

 945     ← decimal
 #945    ← decimal with prefix #
 &#945;  ← XML entity syntax

 x3b1    ← hexadimal with prefix x
 #x3b1   ← hexadimal with prefix #x
 &#x3b1; ← XML entity syntax

Full Unicode name can also be used, e.g. 「greek small letter alpha」.

If you wish to enter a symbor by full unicode name but do not
know the full name, call `ucs-insert'. Asterisk “*” can be used
as a wildcard to find the char. For example, call
“ucs-insert”, then type 「*arrow」 then Tab, then emacs will list
all unicode char names that has “arrow” in it. (this feature is
part of Emacs 23)

Without argument, toggles the minor mode.
If optional argument is 1, turn it on.
If optional argument is 0, turn it off.

Home page at: URL `http://ergoemacs.org/emacs/sci-math-symbols-input.html'"
  nil
  :global t
  :lighter " Σ"
  :keymap sci-keymap
  )

(provide 'sci-math-symbol)

;; Local Variables:
;; eval:(progn (hs-minor-mode t) (let ((hs-state '((16526 17955 hs) (14603 16496 hs) (13409 14533 hs) (12785 13216 hs) (11905 12391 hs) (11609 11889 hs) (11467 11581 hs) (10920 11445 hs) (10529 10884 hs) (9598 10496 hs) (9312 9562 hs) (9214 9284 hs) (8001 9193 hs) (7318 7758 hs) (6623 7290 hs) (6166 6580 hs) (4696 6138 hs) (3404 4667 hs) (2677 3378 hs) (1253 2612 hs)))       (HSmark 'eCMs9PnUiV6Z))  (dolist (i hs-state)   (when (car i)    (goto-char (car i))    (hs-find-block-beginning)    (hs-hide-block-at-point nil nil)))) (goto-char 18384) (recenter-top-bottom))
;; End:
