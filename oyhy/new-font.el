;; mode: emacs-lisp; coding: utf-8
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; By: Exaos Lee
;; URL: https://gist.github.com/4493582
;; References:
;; - http://baohaojun.github.com/perfect-emacs-chinese-font.html
;; - http://fonts.jp/hanazono/
;; - http://ergoemacs.org/emacs/emacs_n_unicode.html
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; [Logging]
;; 2013-04-11
;; - http://www.cnblogs.com/bamanzi/archive/2012/12/08/emacs-24_3-cygwin-w32-gui.html
;; - 本文件在 cygwin 下与 emacs-win32 配合不佳
;; 2013-04-13 字体的问题
;; - 将 mintty 的 locale 修改为 GBK 之后，启动 emacs-w32 就正常了。

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 字体显示测试 ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; 中英文对齐
;;-------1---------2---------3---------4---------5---------6---------7--
;; abab abababab abababab abababab abababababab
;; 你我 你我你我 你我你我 你我你我 你我你我你我
;;3456789+123456789+123456789+123456789+123456789+123456789+123456789+12
;; 半角： 0 o O 1 l I | i ; : . ~ \ / - _ = ! @ # $ % ^ & * ` ' " () [] {}
;; 全角： ， ； 、 。 ？ ！
;; —— “ ” ‘ ’ 《 》 ［ ］ 「」『』〈〉《》〖〗【】〔〕
;;---------------------------------------------------------------
;; 这儿的字符至少应该显示正常！
;; Esperanto: ĉ Ĉ ĝ Ĝ ĥ Ĥ ĵ Ĵ ŝ Ŝ ŭ Ŭ -- Ĵaudo Ĥoro aĝo antaŭ ĝoja
;; 化学元素： 𨧀 dù, 𨨏 (钅波) bō ㄅㄛ 𨭆 hēi 䥑 鐽 dá ㄉㄚˊ鎶
;; IPA: ðɫŋɹɾʃθtʒæɑəəɚɜɛɝɪɪ̈ɒɔʊʊ̈ʌ
;; àáâãäåæç èéêë ìíîï ðñòóôõö øùúûüýþÿ ÀÁÂÃÄÅ
;; Ç ÈÉÊË ÌÍÎÏ ÐÑ ÒÓÔÕÖ ØÙÚÛÜÝÞß
;; ¢ € ₠ £ ¥ ¤ ° © ® ™ § ¶ † ‡ ※ •◦ ‣ ✓●■◆○□◇★☆♠♣♥♦♤♧♡♢
;; ←→↑↓↔↖↗↙↘⇐⇒⇑⇓⇔⇗⇦⇨⇧⇩ ↞↠↟↡ ↺↻ ☞☜☝☟ ∀¬∧∨∃⊦∵∴∅∈∉⊂⊃⊆⊇⊄⋂⋃
;; ♩♪♫♬♭♮♯ ➀➁➂➃➄➅➆➇➈➉ 卐卍✝✚✡☥⎈☭☪☮☺☹ ☯☰☱☲☳☴☵☶☷
;; ☠☢☣☤♲♳⌬♨♿ ☉☼☾☽ ♀♂ ♔♕♖ ♗♘♙ ♚♛ ♜♝♞♟

;; 查看某个字符是什么字体，使用函数: (describe-char); 默认绑定的按键是: C-u C-x =
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; 常见字体 -- 查看系统可用字体: (print (font-family-list))

;; 等宽字体： DejaVu Sans Mono, Andale Mono, Liberation Mono,
;; Nimbus Mono L, FreeMono, Droid Sans Mono, Monaco
;; 中文字体： (直接用第一次出现的名称)
;; Adobe 明體 Std,Adobe Ming Std
;; AR PL UMing CN
;; 微软雅黑,Microsoft YaHei
;; 宋体,SimSun
;; 新宋体,NSimSun
;; 宋体\-方正超大字符集,Simsun (Founder Extended)
;; 文泉驿微米黑,文泉驛微米黑,WenQuanYi Micro Hei
;; 文泉驿正黑,文泉驛正黑,WenQuanYi Zen Hei
;; Unicode 扩展字体： 包括汉字 ExtB ExtC ExtD 等
;; HanaMinB,花園明朝B --- http://fonts.jp/hanazono/
;; SimSun-ExtB --- http://www.chinesecj.com/code/ext-b.php
;; MingLiU-ExtB, PMingLiU-ExtB, MingLiU_HKSCS-ExtB

;; 等比例缩放汉字及 Unicode 字符
;; 注意： 添加字体一定要重启 Emacs 才会生效！ 参考
;; - http://debbugs.gnu.org/db/17/1785.html
(setq face-font-rescale-alist
      '(("AR PL UMing CN" . 1.2)
	("SimSun" . 1.2)
	("NSimSun" . 1.2)
	("宋体" . 1.2)
	("新宋体" . 1.2)
	("HanaMinB" . 1.2)
	("SimSun-ExtB" . 1.2)
	("Adobe 明體 Std" . 1.2)
	("微软雅黑" . 1.2)
	("文泉驿正黑" . 1.2)
	))

(setq face-font-rescale-alist
      '(("AR PL UMing CN" . 1.2)
	("SimSun" . 1.2)
	("NSimSun" . 1.2)
	("宋体" . 1.2)
	("新宋体" . 1.2)
	("HanaMinB" . 1.2)
	("SimSun-ExtB" . 1.2)
	("Adobe 明體 Std" . 1.2)
	("微软雅黑" . 1.2)
	("文泉驿正黑" . 1.1)
	))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; 默认风格 (frame)
(defun my-default-frame-face ()
  ;; Default font
  ;; eng
  ;; chn
  ;; unicode
  (qiang-set-font
   '("Consolas" "Monaco" "DejaVu Sans Mono" "Monospace") 14
   '("文泉驿正黑" "微软雅黑" "新宋体")
   '("SimSun-ExtB" "HanaMinB" "MingLiU-ExtB"))
  (set-face-attribute 'default nil :font (font-spec)))

;; If not in terminal, load default style
(if (display-graphic-p)
    (my-default-frame-face))

;; For emacsclient: apply default frame style to each new frame
(add-hook 'after-make-frame-functions
	  (lambda (new-frame)
	    (select-frame new-frame)
	    (my-default-frame-face)))


;; ("System" "Terminal" "Fixedsys" "Modern" "Roman" "Script" "Courier" "MS Serif" "MS Sans Serif" "Small Fonts" "Grad" "ADMUI3Lg" "ADMUI3Sm" "Myriad Pro" "Myriad Pro Light" "Myriad Pro Black" "Myriad Pro Cond" "Myriad Pro Light Cond" "Myriad Pro Black Cond" "Myriad Pro SemiCond" "Myriad Pro Light SemiCond" "Myriad Pro Black SemiCond" "Myriad Pro SemiExt" "Myriad Pro Light SemiExt" "Myriad Pro Black SemiExt" "Marlett" "Arial" "Batang" "BatangChe" "Gungsuh" "GungsuhChe" "Courier New" "DaunPenh" "DokChampa" "Estrangelo Edessa" "Euphemia" "Gautami" "Vani" "Gulim" "GulimChe" "Dotum" "DotumChe" "Impact" "Iskoola Pota" "Kalinga" "Kartika" "Khmer UI" "Lao UI" "Latha" "Lucida Console" "Malgun Gothic" "Mangal" "Meiryo" "Meiryo UI" "Microsoft Himalaya" "Microsoft JhengHei" #("微软雅黑" 0 4 (charset chinese-gbk)) "MingLiU" "PMingLiU" "MingLiU_HKSCS" "MingLiU-ExtB" "PMingLiU-ExtB" "MingLiU_HKSCS-ExtB" "Mongolian Baiti" "MS Gothic" "MS PGothic" "MS UI Gothic" "MS Mincho" "MS PMincho" "MV Boli" "Microsoft New Tai Lue" "Nyala" "Microsoft PhagsPa" "Plantagenet Cherokee" "Raavi" "Segoe Script" "Segoe UI" "Segoe UI Semibold" "Segoe UI Light" "Segoe UI Symbol" "Shruti" #("宋体" 0 2 (charset chinese-gbk)) #("新宋体" 0 3 (charset chinese-gbk)) "SimSun-ExtB" "Sylfaen" "Microsoft Tai Le" "Times New Roman" "Tunga" "Vrinda" "Shonar Bangla" "Microsoft Yi Baiti" "Tahoma" "Microsoft Sans Serif" "Angsana New" "Aparajita" "Cordia New" "Ebrima" "Gisha" "Kokila" "Leelawadee" "Microsoft Uighur" "MoolBoran" "Symbol" "Utsaah" "Vijaya" "Wingdings" "Andalus" "Arabic Typesetting" "Simplified Arabic" "Simplified Arabic Fixed" "Sakkal Majalla" "Traditional Arabic" "Aharoni" "David" "FrankRuehl" "Levenim MT" "Miriam" "Miriam Fixed" "Narkisim" "Rod" #("仿宋" 0 2 (charset chinese-gbk)) #("黑体" 0 2 (charset chinese-gbk)) #("楷体" 0 2 (charset chinese-gbk)) "AngsanaUPC" "Browallia New" "BrowalliaUPC" "CordiaUPC" "DilleniaUPC" "EucrosiaUPC" "FreesiaUPC" "IrisUPC" "JasmineUPC" "KodchiangUPC" "LilyUPC" "DFKai-SB" "Lucida Sans Unicode" "Arial Black" "Comic Sans MS" "Franklin Gothic Medium" "Gabriola" "Georgia" "Palatino Linotype" "Segoe Print" "Trebuchet MS" "Verdana" "Webdings" "Amienne" "Arnprior" "Baveuse" "Berylium" "Blue Highway" "Blue Highway Condensed" "Blue Highway D Type" "Blue Highway Linocut" "Burnstown Dam" "Carbon Block" "Credit Valley" "Earwig Factory" "Hurry Up" "Heavy Heap" "Kredit" "Minya Nouvelle" "Neuropol" "Planet Benson 2" "Pupcat" "Stereofidelic" "Sybil Green" "Teen" "Teen Light" "Velvenda Cooler" "Biondi" "Boopee" "Byington" "Catriel" "Euphorigenic S" "Huxtable" "Ligurino" "Ligurino Condensed" "Mufferaw" "Tandelle" "Waker" "Bella Donna" "CatholicSchoolGirls Intl BB" "Wickenden Cafe NDP" #("宋体-方正超大字符集" 0 10 (charset chinese-gbk)) "Book Antiqua" "Century Gothic" "Monotype Corsiva" "Britannica Unicode Sans" "MerriamExt" "MerriamIPA" "MerriamRegular" "Merriam WebsterSpecial" "Guitar Pro 5" "Code2000" "FreeSerif" #("金梅草行書" 0 5 (charset chinese-gbk)) #("金梅流行書" 0 5 (charset chinese-gbk)) #("金梅毛草行體" 0 6 (charset chinese-gbk)) #("经典繁角隶" 0 5 (charset chinese-gbk)) #("迷你简细行楷" 0 6 (charset chinese-gbk)) "Copperplate Gothic Bold" "Copperplate Gothic Light" #("方正古隶繁体" 0 6 (charset chinese-gbk)) #("方正隶变繁体" 0 6 (charset chinese-gbk)) #("方正隶变简体" 0 6 (charset chinese-gbk)) #("方正水柱简体" 0 6 (charset chinese-gbk)) #("幼圆" 0 2 (charset chinese-gbk)) #("华康娃娃体W5(P)" 0 10 (charset chinese-gbk)) "DFNewChuan-B5" "DFPNewChuan-B5" #("经典繁方篆" 0 5 (charset chinese-gbk)) "Lingoes Unicode" "Arial Unicode MS" "Tempus Sans ITC" "Pristina" "Papyrus" "Mistral" "Lucida Handwriting" "Kristen ITC" "Juice ITC" "French Script MT" "Freestyle Script" "Bradley Hand ITC" "Algerian" "Baskerville Old Face" "Bauhaus 93" "Bell MT" "Berlin Sans FB" "Bernard MT Condensed" "Bodoni MT Poster Compressed" "Britannic Bold" "Broadway" "Brush Script MT" "Californian FB" "Centaur" "Chiller" "Colonna MT" "Cooper Black" "Footlight MT Light" "Harlow Solid Italic" "Harrington" "High Tower Text" "Jokerman" "Kunstler Script" "Lucida Bright" "Lucida Calligraphy" "Lucida Fax" "Magneto" "Matura MT Script Capitals" "Modern No. 20" "Niagara Engraved" "Niagara Solid" "Old English Text MT" "Onyx" "Parchment" "Playbill" "Poor Richard" "Ravie" "Informal Roman" "Showcard Gothic" "Snap ITC" "Stencil" "Viner Hand ITC" "Vivaldi" "Vladimir Script" "Wide Latin" "Berlin Sans FB Demi" #("方正舒体" 0 4 (charset chinese-gbk)) #("方正姚体" 0 4 (charset chinese-gbk)) #("隶书" 0 2 (charset chinese-gbk)) #("华文彩云" 0 4 (charset chinese-gbk)) #("华文仿宋" 0 4 (charset chinese-gbk)) #("华文琥珀" 0 4 (charset chinese-gbk)) #("华文楷体" 0 4 (charset chinese-gbk)) #("华文隶书" 0 4 (charset chinese-gbk)) #("华文宋体" 0 4 (charset chinese-gbk)) #("华文细黑" 0 4 (charset chinese-gbk)) #("华文行楷" 0 4 (charset chinese-gbk)) #("华文新魏" 0 4 (charset chinese-gbk)) #("华文中宋" 0 4 (charset chinese-gbk)) "Droid Sans Fallback" "MT Extra" "Euclid" "Euclid Symbol" "Euclid Extra" "Euclid Fraktur" "Euclid Math One" "Euclid Math Two" "Fences" "Tiger" "MT Extra Tiger" "Symbol Tiger" "Tiger Expert" "Symbol Tiger Expert" "Century" "Calibri" "Cambria" "Cambria Math" "Candara" "Consolas" "Constantia" "Corbel" "Wingdings 2" "Wingdings 3" "Arial Narrow" "Garamond" "Bookman Old Style" "Bookshelf Symbol 7" "MS Reference Sans Serif" "MS Reference Specialty" "Aloisen New" "John Handy LET" "Academy Engraved LET" "University Roman LET" "Milano LET" "Smudger LET" "Ruach LET" "La Bamba LET" "Quixley LET" "One Stroke Script LET" "Odessa LET" "Scruff LET" "ParkAvenue BT" "Staccato222 BT" "Cataneo BT" "Blackletter686 BT" "Calligraph421 BT" "MisterEarl BT" "OldDreadfulNo7 BT" "HolidayPi BT" "Jokerman LET" "Orange LET" "Victorian LET" "Westwood LET" "Rage Italic LET" "Tiranti Solid LET" "Mekanik LET" "Highlight LET" "Broadway BT" "Square721 BT" "Pump Demi Bold LET" "Roboto" "Roboto Th" "Droid Sans Mono" "Droid Serif" "Calibri Light" "Bitstream Vera Sans Mono" "Monaco" "Anonymous Pro" "Typewriter" #("华康少女文字W5" 0 8 (charset chinese-gbk)) #("华康少女文字W5(P)" 0 11 (charset chinese-gbk)) "ComicMaid" "Linux Biolinum G" "Linux Libertine G" "DejaVu Serif" "Liberation Sans Narrow" "DejaVu Sans Condensed" "DejaVu Sans Mono" "DejaVu Sans" "DejaVu Serif Condensed" "Gentium Book Basic" "OpenSymbol" "Gentium Basic" "DejaVu Sans Light" "Symbola" #("Segoe UI Symbol'兰亭黑" 16 19 (charset chinese-gbk)) "Helvetica LT" "Helvetica CE" "HelveticaCyr Upright" "HelveticaGreek Upright" "HelveticaInseratCyr Upright" "HelveticaInserat LT" "Helvetica LT Black" "Helvetica LT Condensed" "Helvetica LT Compressed" "Helvetica LT CondensedBlack" "Helvetica LT CondensedLight" "Helvetica Narrow CE" "Helvetica LT ExtraCompressed" "Helvetica LT Light" "Helvetica LT Narrow" "Helvetica LT UltraCompressed" "HelveticaTextbook LT Roman" "HelveticaRounded LT Bold" "HelveticaRounded LT BoldCn" #("汉仪篆书繁" 0 5 (charset chinese-gbk)) #("汉仪娃娃篆简" 0 6 (charset chinese-gbk)) #("汉仪瘦金书简" 0 6 (charset chinese-gbk)) #("汉仪南宫体简" 0 6 (charset chinese-gbk)) #("方正兰亭黑_YS_GB18030" 0 16 (charset chinese-gbk)) "文泉驿微米黑" #("文泉驿等宽微米黑" 0 8 (charset chinese-gbk)) #("文泉驿正黑" 0 5 (charset chinese-gbk)) "Grad" "Myriad Pro" "Myriad Pro Light" "Myriad Pro Black" "Myriad Pro Cond" "Myriad Pro Light Cond" "Myriad Pro Black Cond" "Myriad Pro SemiCond" "Myriad Pro Light SemiCond" "Myriad Pro Black SemiCond" "Myriad Pro SemiExt" "Myriad Pro Light SemiExt" "Myriad Pro Black SemiExt" "Arial" "Batang" "BatangChe" "Gungsuh" "GungsuhChe" "Courier New" "DaunPenh" "DokChampa" "Estrangelo Edessa" "Euphemia" "Gautami" "Vani" "Gulim" "GulimChe" "Dotum" "DotumChe" "Impact" "Iskoola Pota" "Kalinga" "Kartika" "Khmer UI" "Lao UI" "Latha" "Lucida Console" "Malgun Gothic" "Mangal" "Meiryo" "Meiryo UI" "Microsoft Himalaya" "Microsoft JhengHei" #("微软雅黑" 0 4 (charset chinese-gbk)) "MingLiU" "PMingLiU" "MingLiU_HKSCS" "MingLiU-ExtB" "PMingLiU-ExtB" "MingLiU_HKSCS-ExtB" "Mongolian Baiti" "MS Gothic" "MS PGothic" "MS UI Gothic" "MS Mincho" "MS PMincho" "MV Boli" "Microsoft New Tai Lue" "Nyala" "Microsoft PhagsPa" "Plantagenet Cherokee" "Raavi" "Segoe Script" "Segoe UI" "Segoe UI Semibold" "Segoe UI Light" "Segoe UI Symbol" "Shruti" #("宋体" 0 2 (charset chinese-gbk)) #("新宋体" 0 3 (charset chinese-gbk)) "SimSun-ExtB" "Sylfaen" "Microsoft Tai Le" "Times New Roman" "Tunga" "Vrinda" "Shonar Bangla" "Microsoft Yi Baiti" "Tahoma" "Microsoft Sans Serif" "Angsana New" "Aparajita" "Cordia New" "Ebrima" "Gisha" "Kokila" "Leelawadee" "Microsoft Uighur" "MoolBoran" "Utsaah" "Vijaya" "Andalus" "Arabic Typesetting" "Simplified Arabic" "Simplified Arabic Fixed" "Sakkal Majalla" "Traditional Arabic" #("仿宋" 0 2 (charset chinese-gbk)) #("黑体" 0 2 (charset chinese-gbk)) #("楷体" 0 2 (charset chinese-gbk)) "AngsanaUPC" "Browallia New" "BrowalliaUPC" "CordiaUPC" "DilleniaUPC" "EucrosiaUPC" "FreesiaUPC" "IrisUPC" "JasmineUPC" "KodchiangUPC" "LilyUPC" "DFKai-SB" "Lucida Sans Unicode" "Arial Black" "Comic Sans MS" "Franklin Gothic Medium" "Gabriola" "Georgia" "Palatino Linotype" "Segoe Print" "Trebuchet MS" "Verdana" "Amienne" "Arnprior" "Baveuse" "Berylium" "Blue Highway" "Blue Highway Condensed" "Blue Highway D Type" "Blue Highway Linocut" "Burnstown Dam" "Carbon Block" "Credit Valley" "Earwig Factory" "Hurry Up" "Heavy Heap" "Kredit" "Minya Nouvelle" "Neuropol" "Planet Benson 2" "Pupcat" "Stereofidelic" "Sybil Green" "Teen" "Teen Light" "Velvenda Cooler" "Biondi" "Boopee" "Byington" "Catriel" "Euphorigenic S" "Huxtable" "Ligurino" "Ligurino Condensed" "Mufferaw" "Tandelle" "Waker" "Bella Donna" "CatholicSchoolGirls Intl BB" "Book Antiqua" "Century Gothic" "Monotype Corsiva" "Britannica Unicode Sans" "MerriamExt" "MerriamIPA" "MerriamRegular" "Merriam WebsterSpecial" "Guitar Pro 5" "Code2000" "FreeSerif" "Copperplate Gothic Bold" "Copperplate Gothic Light" "Lingoes Unicode" "Arial Unicode MS" "Tempus Sans ITC" "Pristina" "Papyrus" "Mistral" "Lucida Handwriting" "Kristen ITC" "Juice ITC" "French Script MT" "Freestyle Script" "Bradley Hand ITC" "Algerian" "Baskerville Old Face" "Bauhaus 93" "Bell MT" "Berlin Sans FB" "Bernard MT Condensed" "Bodoni MT Poster Compressed" "Britannic Bold" "Broadway" "Brush Script MT" "Californian FB" "Centaur" "Chiller" "Colonna MT" "Cooper Black" "Footlight MT Light" "Harlow Solid Italic" "Harrington" "High Tower Text" "Jokerman" "Kunstler Script" "Lucida Bright" "Lucida Calligraphy" "Lucida Fax" "Magneto" "Matura MT Script Capitals" "Modern No. 20" "Niagara Engraved" "Niagara Solid" "Old English Text MT" "Onyx" "Parchment" "Playbill" "Poor Richard" "Ravie" "Informal Roman" "Showcard Gothic" "Snap ITC" "Stencil" "Viner Hand ITC" "Vivaldi" "Vladimir Script" "Wide Latin" "Berlin Sans FB Demi" #("华文仿宋" 0 4 (charset chinese-gbk)) #("华文楷体" 0 4 (charset chinese-gbk)) #("华文宋体" 0 4 (charset chinese-gbk)) #("华文细黑" 0 4 (charset chinese-gbk)) #("华文中宋" 0 4 (charset chinese-gbk)) "Euclid" "Euclid Fraktur" "Tiger" "Tiger Expert" "Century" "Calibri" "Cambria" "Cambria Math" "Candara" "Consolas" "Constantia" "Corbel" "Arial Narrow" "Garamond" "Bookman Old Style" "MS Reference Sans Serif" "Roboto" "Roboto Th" "Droid Sans Mono" "Droid Serif" "Calibri Light" "Bitstream Vera Sans Mono" "Anonymous Pro" "Linux Biolinum G" "Linux Libertine G" "DejaVu Serif" "Liberation Sans Narrow" "DejaVu Sans Condensed" "DejaVu Sans Mono" "DejaVu Sans" "DejaVu Serif Condensed" "Gentium Book Basic" "OpenSymbol" "Gentium Basic" "DejaVu Sans Light" "Symbola" #("Segoe UI Symbol'兰亭黑" 16 19 (charset chinese-gbk)) "Helvetica LT" "HelveticaInserat LT" "Helvetica LT Black" "Helvetica LT Condensed" "Helvetica LT Compressed" "Helvetica LT CondensedBlack" "Helvetica LT CondensedLight" "Helvetica LT ExtraCompressed" "Helvetica LT Light" "Helvetica LT Narrow" "Helvetica LT UltraCompressed" "HelveticaTextbook LT Roman" "HelveticaRounded LT Bold" "HelveticaRounded LT BoldCn" #("汉仪瘦金书简" 0 6 (charset chinese-gbk)) #("汉仪南宫体简" 0 6 (charset chinese-gbk)) "文泉驿微米黑" #("文泉驿正黑" 0 5 (charset chinese-gbk)))




;; Local Variables:
;; eval:(progn (hs-minor-mode t) (let ((hs-state '((3646 3646 nil) (2922 2922 nil) (2946 2946 nil) (2962 2962 nil) (2979 2979 nil) (2983 2983 nil) (2984 2984 nil) (3057 3057 nil) (3058 3058 nil) (3074 3074 nil) (3106 3106 nil) (3124 3124 nil) (3133 3133 nil) (3142 3142 nil) (3155 3155 nil) (3173 3173 nil) (3233 3233 nil) (3260 3260 nil) (3307 3307 nil) (3362 3362 nil) (3363 3363 nil) (3405 3405 nil) (3429 3429 nil) (3458 3458 nil) (3459 3459 nil) (3523 3523 nil) (3561 3561 nil) (3584 3584 nil) (3614 3614 nil) (3645 3645 nil))) (the-mark 'scinartspecialmarku2npbmfydfnwzwnpywxnyxjr)) (dolist (i hs-state) (if (not (null (caddr i))) (progn (goto-char (car i)) (hs-find-block-beginning) (hs-hide-block-at-point nil nil))))) (goto-char 3614) (recenter-top-bottom))
;; End:
