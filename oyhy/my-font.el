;; -*- coding: utf-8 -*- 
;; File created: 2013-05-17 Friday 00:31:36
;; Time-stamp: <2014-01-04 18:44:21 scinart>


;; custom-set-faces
;; ***************************************************************************
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(default ((t (:family "Consolas" :foundry "outline" :slant normal :weight normal :height 120 :width normal))))
;;  '(my-emacs-lisp-quote-face ((t (:foreground "floral white" :slant oblique :weight bold))))
;;  '(emms-playlist-track-face ((t (:foreground "DarkSeaGreen" :height 109 :family "苹果雅黑"))))
;;  '(org-date ((t (:foreground "Cyan" :underline t :height 109 :family "苹果雅黑"))))
;;  '(org-formula ((t (:foreground "chocolate1" :height 109 :family "苹果雅黑"))))
;;  '(org-table ((t (:foreground "LightSkyBlue" :height 109 :family "苹果雅黑"))))
;;  '(org-tag ((t (:weight bold :height 109 :family "苹果雅黑")))))

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
;; FYI
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

(eval-when-compile (require 'cl))

(defun qiang-font-existsp (font)
  (member font (font-family-list))
;  (if (null (x-list-fonts font)) nil t)
  )
(defun qiang-make-font-string (font-name font-size)
  (if (and (stringp font-size)
	   (equal ":" (string (elt font-size 0))))
      (format "%s%s" font-name font-size)
    (format "%s-%s" font-name font-size)))
(defun qiang-set-font (english-fonts
		       english-font-size
		       chinese-fonts
		       &optional unicode-fonts)
  "The english-font-size could be set to \":pixelsize=18\" or a integer.
If set/leave chinese-font-size to nil, it will follow english-font-size"
  (require 'cl) ;; for find if
  (unless unicode-fonts (setq unicode-fonts chinese-fonts))
  (let (	;; find-if return the first element
	(en-font (qiang-make-font-string (find-if #'qiang-font-existsp english-fonts) english-font-size))
	(zh-font (font-spec :family (find-if #'qiang-font-existsp chinese-fonts)))
	(uni-font (font-spec :family (find-if #'qiang-font-existsp unicode-fonts))))
    ;; Set the default English font: for most latin characters
    
    (set-face-attribute 'default nil :font en-font)
    
    ;; Set Chinese font
    (dolist (charset '(kana han symbol cjk-misc bopomofo gb18030))
      (set-fontset-font t charset zh-font))
    
    ;; Set the font for unicode not covered above
    ;; 'prepend -- do not override the previous settings
    (set-fontset-font t nil uni-font nil 'prepend)))

(defvar current-font 0 "My font counter;")
(defvar font-cycle '(("Consolas" . 1)
		     ("Monaco" . 1)
		     ("DejaVu Sans Mono" . 1)
		     ("Droid Sans Mono" . 1)
		     ("Comic Sans MS" . 1)
		     ("Code2000" . 1)
		     ("Times NewnRoman" . 1)
		     ("Tahoma" . 1)
		     ("Garamond" . 1)))
(defun switch-font (arg)
  "Cycle forward arg fonts by scinart
modified 2013-08-02 Friday 13:52:31"
  (interactive)
  (setq current-font (+ arg current-font))
  (while (>= current-font (length font-cycle))
    (setq current-font (- current-font (length font-cycle))))
  (while (< current-font 0)
    (setq current-font (+ current-font (length font-cycle))))
  (message "%s" (nth current-font font-cycle))
  (set-face-attribute 'default nil :font (car (nth current-font font-cycle)))
  (set-font-rescale (cdr (nth current-font font-cycle))))
(defun set-font-rescale (scale)
  (setq face-font-rescale-alist
	`(("AR PL UMing CN" . ,scale)
	  ("SimSun" . ,scale)
	  ("NSimSun" . ,scale)
	  ("宋体" . ,scale)
	  ("新宋体" . ,scale)
	  ("HanaMinB" . ,scale)
	  ("SimSun-ExtB" . ,scale)
	  ("Adobe 明體 Std" . ,scale)
	  ("微软雅黑" . ,scale)
	  ("文泉驿正黑" . ,scale)
	  )))

 
(qiang-set-font
 '("Monaco" "Consolas" "DejaVu Sans Mono" "Monospace" "文泉驿等宽正黑")
 ":pixelsize=16"
;;14
 '("微软雅黑" "新宋体" "文泉驿等宽微米黑" "文泉驿微米黑" "文泉驿等宽正黑" "微软雅黑" "文泉驿正黑")
 '("SimSun-ExtB" "HanaMinB" "MingLiU-ExtB"))


(defun set-font (english chinese english-size chinese-size)
  (set-face-attribute 'default nil :font (format "%s:pixelsize=%d" english english-size))
  (dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font (frame-parameter nil 'font) charset
		      (font-spec :family chinese :size chinese-size
				 ))))

;; (set-font "WenQuanYi Micro Hei" "文泉驿正黑" 18 20)
;; (set-font "Monaco" "文泉驿等宽微米黑" 16 20)
(set-font "Monaco" "微软雅黑" 16 20)

;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(default ((t (:family "Consolas" :foundry "outline" :slant normal :weight normal :height 120 :width normal))))
;;  '(my-emacs-lisp-quote-face ((t (:foreground "floral white" :slant oblique :weight bold))))
;;  '(org-date ((t (:foreground "Cyan" :underline t :height 109 :family "文泉驿等宽微米黑"))))
;;  '(org-formula ((t (:foreground "chocolate1" :height 109 :family "文泉驿等宽微米黑"))))
;;  '(org-table ((t (:foreground "LightSkyBlue" :height 109 :family "文泉驿等宽微米黑"))))
;;  '(org-tag ((t (:weight bold :height 109 :family "文泉驿等宽微米黑")))))

;; I prefer Consolas to DejaVu Sans Mono
;; 2013-05-17 Friday 00:31:07
;; (set-face-attribute 'default nil :font "Consolas")nil
;; (set-face-attribute 'default nil :font "DejaVu Sans Mono")
;; (set-face-attribute 'default nil :font "Bitstream Vera Sans Mono")
;; (set-face-attribute 'default nil :font "Monaco")
;; (set-face-attribute 'default nil :font "Droid Sans Mono")
;; (set-face-attribute 'default nil :font "Code2000")
;; (set-face-attribute 'default nil :font "Times New Roman")
;; (set-face-attribute 'default nil :font "Comic Sans MS")
;; test l1iI0oO illegal1 = o0;

;; subscripts and superscripts
(set-fontset-font "fontset-default" '(#x1D00 . #x1DFF) "Code2000")

;; (set-fontset-font NAME TARGET FONT-SPEC &optional FRAME ADD)

(set-fontset-font "fontset-default"  '(#x2000 . #x21ff) "Code2000")
;; Mathematical Operators
(set-fontset-font "fontset-default" '(#x2200 . #x22ff) "Code2000")
;; ????????????
(set-fontset-font "fontset-default"  '(#x2300 . #x23ff) "Code2000")
;; Miscellaneous Symbols
(set-fontset-font "fontset-default"  '(#x2600 . #x26ff) "Code2000")
;; Dingbats
(set-fontset-font "fontset-default"  '(#x2700 . #x27ff) "Code2000")
;; (set-fontset-font "fontset-default"  '(#x2e00 . #x2eff) "Code2000")

 
;; Block Range   	Block Name      	  plane  scripts
;; U+0000..U+007F 	Basic Latin 		128 	0 BMP 	Latin, Common
;; U+0080..U+00FF 	Latin-1 Supplement 	128 	0 BMP 	Latin, Common
;; U+0100..U+017F 	Latin Extended-A 	128 	0 BMP 	Latin
;; U+0180..U+024F 	Latin Extended-B 	208 	0 BMP 	Latin
;; U+0250..U+02AF 	IPA Extensions 		96 	0 BMP 	Latin
;; U+02B0..U+02FF 	Spacing Modifier Letters80 	0 BMP 	Latin, Common
;; U+0300..U+036F 	Combining Diacritical Marks 	112 	0 BMP 	Inherited
;; U+0370..U+03FF 	Greek and Coptic 	144 	0 BMP 	Greek, Coptic, Common
;; U+0400..U+04FF 	Cyrillic 	256 	0 BMP 	Cyrillic, Inherited
;; U+0500..U+052F 	Cyrillic Supplement 	48 	0 BMP 	Cyrillic
;; U+0530..U+058F 	Armenian 	96 	0 BMP 	Armenian, Common
;; U+0590..U+05FF 	Hebrew 	112 	0 BMP 	Hebrew
;; U+0600..U+06FF 	Arabic 	256 	0 BMP 	Arabic, Common, Inherited
;; U+0700..U+074F 	Syriac 	80 	0 BMP 	Syriac
;; U+0750..U+077F 	Arabic Supplement 	48 	0 BMP 	Arabic
;; U+0780..U+07BF 	Thaana 	64 	0 BMP 	Thaana
;; U+07C0..U+07FF 	NKo 	64 	0 BMP 	Nko
;; U+0800..U+083F 	Samaritan 	64 	0 BMP 	Samaritan
;; U+0840..U+085F 	Mandaic 	32 	0 BMP 	Mandaic
;; U+08A0..U+08FF 	Arabic Extended-A 	96 	0 BMP 	Arabic
;; U+0900..U+097F 	Devanagari 	128 	0 BMP 	Devanagari, Common, Inherited
;; U+0980..U+09FF 	Bengali 	128 	0 BMP 	Bengali
;; U+0A00..U+0A7F 	Gurmukhi 	128 	0 BMP 	Gurmukhi
;; U+0A80..U+0AFF 	Gujarati 	128 	0 BMP 	Gujarati
;; U+0B00..U+0B7F 	Oriya 	128 	0 BMP 	Oriya
;; U+0B80..U+0BFF 	Tamil 	128 	0 BMP 	Tamil
;; U+0C00..U+0C7F 	Telugu 	128 	0 BMP 	Telugu
;; U+0C80..U+0CFF 	Kannada 	128 	0 BMP 	Kannada
;; U+0D00..U+0D7F 	Malayalam 	128 	0 BMP 	Malayalam
;; U+0D80..U+0DFF 	Sinhala 	128 	0 BMP 	Sinhala
;; U+0E00..U+0E7F 	Thai 	128 	0 BMP 	Thai, Common
;; U+0E80..U+0EFF 	Lao 	128 	0 BMP 	Lao
;; U+0F00..U+0FFF 	Tibetan 	256 	0 BMP 	Tibetan, Common
;; U+1000..U+109F 	Myanmar 	160 	0 BMP 	Myanmar
;; U+10A0..U+10FF 	Georgian 	96 	0 BMP 	Georgian, Common
;; U+1100..U+11FF 	Hangul Jamo 	256 	0 BMP 	Hangul
;; U+1200..U+137F 	Ethiopic 	384 	0 BMP 	Ethiopic
;; U+1380..U+139F 	Ethiopic Supplement 	32 	0 BMP 	Ethiopic
;; U+13A0..U+13FF 	Cherokee 	96 	0 BMP 	Cherokee
;; U+1400..U+167F 	Unified Canadian Aboriginal Syllabics 	640 	0 BMP 	Canadian Aboriginal
;; U+1680..U+169F 	Ogham 	32 	0 BMP 	Ogham
;; U+16A0..U+16FF 	Runic 	96 	0 BMP 	Runic, Common
;; U+1700..U+171F 	Tagalog 	32 	0 BMP 	Tagalog
;; U+1720..U+173F 	Hanunoo 	32 	0 BMP 	Hanunoo, Common
;; U+1740..U+175F 	Buhid 	32 	0 BMP 	Buhid
;; U+1760..U+177F 	Tagbanwa 	32 	0 BMP 	Tagbanwa
;; U+1780..U+17FF 	Khmer 	128 	0 BMP 	Khmer
;; U+1800..U+18AF 	Mongolian 	176 	0 BMP 	Mongolian, Common
;; U+18B0..U+18FF 	Unified Canadian Aboriginal Syllabics Extended 	80 	0 BMP 	Canadian Aboriginal
;; U+1900..U+194F 	Limbu 	80 	0 BMP 	Limbu
;; U+1950..U+197F 	Tai Le 	48 	0 BMP 	Tai Le
;; U+1980..U+19DF 	New Tai Lue 	96 	0 BMP 	New Tai Lue
;; U+19E0..U+19FF 	Khmer Symbols 	32 	0 BMP 	Khmer
;; U+1A00..U+1A1F 	Buginese 	32 	0 BMP 	Buginese
;; U+1A20..U+1AAF 	Tai Tham 	144 	0 BMP 	Tai Tham
;; U+1B00..U+1B7F 	Balinese 	128 	0 BMP 	Balinese
;; U+1B80..U+1BBF 	Sundanese 	64 	0 BMP 	Sundanese
;; U+1BC0..U+1BFF 	Batak 	64 	0 BMP 	Batak
;; U+1C00..U+1C4F 	Lepcha 	80 	0 BMP 	Lepcha
;; U+1C50..U+1C7F 	Ol Chiki 	48 	0 BMP 	Ol Chiki
;; U+1CC0..U+1CCF 	Sundanese Supplement 	16 	0 BMP 	Sundanese
;; U+1CD0..U+1CFF 	Vedic Extensions 	48 	0 BMP 	Common, Inherited
;; U+1D00..U+1D7F 	Phonetic Extensions 	128 	0 BMP 	Cyrillic, Greek, Latin
;; U+1D80..U+1DBF 	Phonetic Extensions Supplement 	64 	0 BMP 	Latin, Greek
;; U+1DC0..U+1DFF 	Combining Diacritical Marks Supplement 	64 	0 BMP 	Inherited
;; U+1E00..U+1EFF 	Latin Extended Additional 	256 	0 BMP 	Latin
;; U+1F00..U+1FFF 	Greek Extended 	256 	0 BMP 	Greek
;; U+2000..U+206F 	General Punctuation 	112 	0 BMP 	Common, Inherited
;; U+2070..U+209F 	Superscripts and Subscripts 	48 	0 BMP 	Latin, Common
;; U+20A0..U+20CF 	Currency Symbols 	48 	0 BMP 	Common
;; U+20D0..U+20FF 	Combining Diacritical Marks for Symbols 	48 	0 BMP 	Inherited
;; U+2100..U+214F 	Letterlike Symbols 	80 	0 BMP 	Latin, Greek, Common
;; U+2150..U+218F 	Number Forms 	64 	0 BMP 	Latin, Common
;; U+2190..U+21FF 	Arrows 	112 	0 BMP 	Common
;; U+2200..U+22FF 	Mathematical Operators 	256 	0 BMP 	Common
;; U+2300..U+23FF 	Miscellaneous Technical 	256 	0 BMP 	Common
;; U+2400..U+243F 	Control Pictures 	64 	0 BMP 	Common
;; U+2440..U+245F 	Optical Character Recognition 	32 	0 BMP 	Common
;; U+2460..U+24FF 	Enclosed Alphanumerics 	160 	0 BMP 	Common
;; U+2500..U+257F 	Box Drawing 	128 	0 BMP 	Common
;; U+2580..U+259F 	Block Elements 	32 	0 BMP 	Common
;; U+25A0..U+25FF 	Geometric Shapes 	96 	0 BMP 	Common
;; U+2600..U+26FF 	Miscellaneous Symbols 	256 	0 BMP 	Common
;; U+2700..U+27BF 	Dingbats 	192 	0 BMP 	Common
;; U+27C0..U+27EF 	Miscellaneous Mathematical Symbols-A 	48 	0 BMP 	Common
;; U+27F0..U+27FF 	Supplemental Arrows-A 	16 	0 BMP 	Common
;; U+2800..U+28FF 	Braille Patterns 	256 	0 BMP 	Braille
;; U+2900..U+297F 	Supplemental Arrows-B 	128 	0 BMP 	Common
;; U+2980..U+29FF 	Miscellaneous Mathematical Symbols-B 	128 	0 BMP 	Common
;; U+2A00..U+2AFF 	Supplemental Mathematical Operators 	256 	0 BMP 	Common
;; U+2B00..U+2BFF 	Miscellaneous Symbols and Arrows 	256 	0 BMP 	Common
;; U+2C00..U+2C5F 	Glagolitic 	96 	0 BMP 	Glagolitic
;; U+2C60..U+2C7F 	Latin Extended-C 	32 	0 BMP 	Latin
;; U+2C80..U+2CFF 	Coptic 	128 	0 BMP 	Coptic
;; U+2D00..U+2D2F 	Georgian Supplement 	48 	0 BMP 	Georgian
;; U+2D30..U+2D7F 	Tifinagh 	80 	0 BMP 	Tifinagh
;; U+2D80..U+2DDF 	Ethiopic Extended 	96 	0 BMP 	Ethiopic
;; U+2DE0..U+2DFF 	Cyrillic Extended-A 	32 	0 BMP 	Cyrillic
;; U+2E00..U+2E7F 	Supplemental Punctuation 	128 	0 BMP 	Common
;; U+2E80..U+2EFF 	CJK Radicals Supplement 	128 	0 BMP 	Han
;; U+2F00..U+2FDF 	Kangxi Radicals 	224 	0 BMP 	Han
;; U+2FF0..U+2FFF 	Ideographic Description Characters 	16 	0 BMP 	Common
;; U+3000..U+303F 	CJK Symbols and Punctuation 	64 	0 BMP 	Han, Hangul, Common, Inherited
;; U+3040..U+309F 	Hiragana 	96 	0 BMP 	Hiragana, Common, Inherited
;; U+30A0..U+30FF 	Katakana 	96 	0 BMP 	Katakana, Common
;; U+3100..U+312F 	Bopomofo 	48 	0 BMP 	Bopomofo
;; U+3130..U+318F 	Hangul Compatibility Jamo 	96 	0 BMP 	Hangul
;; U+3190..U+319F 	Kanbun 	16 	0 BMP 	Common
;; U+31A0..U+31BF 	Bopomofo Extended 	32 	0 BMP 	Bopomofo
;; U+31C0..U+31EF 	CJK Strokes 	48 	0 BMP 	Common
;; U+31F0..U+31FF 	Katakana Phonetic Extensions 	16 	0 BMP 	Katakana
;; U+3200..U+32FF 	Enclosed CJK Letters and Months 	256 	0 BMP 	Katakana, Hangul, Common
;; U+3300..U+33FF 	CJK Compatibility 	256 	0 BMP 	Katakana, Common
;; U+3400..U+4DBF 	CJK Unified Ideographs Extension A 	6592 	0 BMP 	Han
;; U+4DC0..U+4DFF 	Yijing Hexagram Symbols 	64 	0 BMP 	Common
;; U+4E00..U+9FFF 	CJK Unified Ideographs 	20992 	0 BMP 	Han
;; U+A000..U+A48F 	Yi Syllables 	1168 	0 BMP 	Yi
;; U+A490..U+A4CF 	Yi Radicals 	64 	0 BMP 	Yi
;; U+A4D0..U+A4FF 	Lisu 	48 	0 BMP 	Lisu
;; U+A500..U+A63F 	Vai 	320 	0 BMP 	Vai
;; U+A640..U+A69F 	Cyrillic Extended-B 	96 	0 BMP 	Cyrillic
;; U+A6A0..U+A6FF 	Bamum 	96 	0 BMP 	Bamum
;; U+A700..U+A71F 	Modifier Tone Letters 	32 	0 BMP 	Common
;; U+A720..U+A7FF 	Latin Extended-D 	224 	0 BMP 	Latin, Common
;; U+A800..U+A82F 	Syloti Nagri 	48 	0 BMP 	Syloti Nagri
;; U+A830..U+A83F 	Common Indic Number Forms 	16 	0 BMP 	Common
;; U+A840..U+A87F 	Phags-pa 	64 	0 BMP 	Phags Pa
;; U+A880..U+A8DF 	Saurashtra 	96 	0 BMP 	Saurashtra
;; U+A8E0..U+A8FF 	Devanagari Extended 	32 	0 BMP 	Devanagari
;; U+A900..U+A92F 	Kayah Li 	48 	0 BMP 	Kayah Li
;; U+A930..U+A95F 	Rejang 	48 	0 BMP 	Rejang
;; U+A960..U+A97F 	Hangul Jamo Extended-A 	32 	0 BMP 	Hangul
;; U+A980..U+A9DF 	Javanese 	96 	0 BMP 	Javanese
;; U+AA00..U+AA5F 	Cham 	96 	0 BMP 	Cham
;; U+AA60..U+AA7F 	Myanmar Extended-A 	32 	0 BMP 	Myanmar
;; U+AA80..U+AADF 	Tai Viet 	96 	0 BMP 	Tai Viet
;; U+AAE0..U+AAFF 	Meetei Mayek Extensions 	32 	0 BMP 	Meetei Mayek
;; U+AB00..U+AB2F 	Ethiopic Extended-A 	48 	0 BMP 	Ethiopic
;; U+ABC0..U+ABFF 	Meetei Mayek 	64 	0 BMP 	Meetei Mayek
;; U+AC00..U+D7AF 	Hangul Syllables 	11184 	0 BMP 	Hangul
;; U+D7B0..U+D7FF 	Hangul Jamo Extended-B 	80 	0 BMP 	Hangul
;; U+D800..U+DB7F 	High Surrogates 	896 	0 BMP 	
;; U+DB80..U+DBFF 	High Private Use Surrogates 	128 	0 BMP 	
;; U+DC00..U+DFFF 	Low Surrogates 	1024 	0 BMP 	
;; U+E000..U+F8FF 	Private Use Area 	6400 	0 BMP 	
;; U+F900..U+FAFF 	CJK Compatibility Ideographs 	512 	0 BMP 	Han
;; U+FB00..U+FB4F 	Alphabetic Presentation Forms 	80 	0 BMP 	Latin, Hebrew, Armenian
;; U+FB50..U+FDFF 	Arabic Presentation Forms-A 	688 	0 BMP 	Arabic, Common
;; U+FE00..U+FE0F 	Variation Selectors 	16 	0 BMP 	Inherited
;; U+FE10..U+FE1F 	Vertical Forms 	16 	0 BMP 	Common
;; U+FE20..U+FE2F 	Combining Half Marks 	16 	0 BMP 	Inherited
;; U+FE30..U+FE4F 	CJK Compatibility Forms 	32 	0 BMP 	Common
;; U+FE50..U+FE6F 	Small Form Variants 	32 	0 BMP 	Common
;; U+FE70..U+FEFF 	Arabic Presentation Forms-B 	144 	0 BMP 	Arabic, Common
;; U+FF00..U+FFEF 	Halfwidth and fullwidth forms 	240 	0 BMP 	Latin, Katakana, Hangul, Common
;; U+FFF0..U+FFFF 	Specials 	16 	0 BMP 	Common
;; U+10000..U+1007F 	Linear B Syllabary 	128 	1 SMP 	Linear B
;; U+10080..U+100FF 	Linear B Ideograms 	128 	1 SMP 	Linear B
;; U+10100..U+1013F 	Aegean Numbers 	64 	1 SMP 	Common
;; U+10140..U+1018F 	Ancient Greek Numbers 	80 	1 SMP 	Greek
;; U+10190..U+101CF 	Ancient Symbols 	64 	1 SMP 	Common
;; U+101D0..U+101FF 	Phaistos Disc 	48 	1 SMP 	Common, Inherited
;; U+10280..U+1029F 	Lycian 	32 	1 SMP 	Lycian
;; U+102A0..U+102DF 	Carian 	64 	1 SMP 	Carian
;; U+10300..U+1032F 	Old Italic 	48 	1 SMP 	Old Italic
;; U+10330..U+1034F 	Gothic 	32 	1 SMP 	Gothic
;; U+10380..U+1039F 	Ugaritic 	32 	1 SMP 	Ugaritic
;; U+103A0..U+103DF 	Old Persian 	64 	1 SMP 	Old Persian
;; U+10400..U+1044F 	Deseret 	80 	1 SMP 	Deseret
;; U+10450..U+1047F 	Shavian 	48 	1 SMP 	Shavian
;; U+10480..U+104AF 	Osmanya 	48 	1 SMP 	Osmanya
;; U+10800..U+1083F 	Cypriot Syllabary 	64 	1 SMP 	Cypriot
;; U+10840..U+1085F 	Imperial Aramaic 	32 	1 SMP 	Imperial Aramaic
;; U+10900..U+1091F 	Phoenician 	32 	1 SMP 	Phoenician
;; U+10920..U+1093F 	Lydian 	32 	1 SMP 	Lydian
;; U+10980..U+1099F 	Meroitic Hieroglyphs 	32 	1 SMP 	Meroitic
;; U+109A0..U+109FF 	Meoritic Cursive 	96 	1 SMP 	Meroitic
;; U+10A00..U+10A5F 	Kharoshthi 	96 	1 SMP 	Kharoshthi
;; U+10A60..U+10A7F 	Old South Arabian 	32 	1 SMP 	Old South Arabian
;; U+10B00..U+10B3F 	Avestan 	64 	1 SMP 	Avestan
;; U+10B40..U+10B5F 	Inscriptional Parthian 	32 	1 SMP 	Inscriptional Parthian
;; U+10B60..U+10B7F 	Inscriptional Pahlavi 	32 	1 SMP 	Inscriptional Pahlavi
;; U+10C00..U+10C4F 	Old Turkic 	80 	1 SMP 	Old Turkic
;; U+10E60..U+10E7F 	Rumi Numeral Symbols 	32 	1 SMP 	Arabic
;; U+11000..U+1107F 	Brahmi 	128 	1 SMP 	Brahmi
;; U+11080..U+110CF 	Kaithi 	80 	1 SMP 	Kaithi
;; U+110D0..U+110FF 	Sora Sompeng 	48 	1 SMP 	Sora Sompeng
;; U+11100..U+1114F 	Chakma 	80 	1 SMP 	Chakma
;; U+11180..U+111DF 	Sharada 	96 	1 SMP 	Sharada
;; U+11680..U+116CF 	Takri 	80 	1 SMP 	Takri
;; U+12000..U+123FF 	Cuneiform 	1024 	1 SMP 	Cuneiform
;; U+12400..U+1247F 	Cuneiform Numbers and Punctuation 	128 	1 SMP 	Cuneiform
;; U+13000..U+1342F 	Egyptian Hieroglyphs 	1072 	1 SMP 	Egyptian Hieroglyphs
;; U+16800..U+16A3F 	Bamum Supplement 	576 	1 SMP 	Bamum
;; U+16F00..U+16F9F 	Miao 	160 	1 SMP 	Miao
;; U+1B000..U+1B0FF 	Kana Supplement 	256 	1 SMP 	Katakana, Hiragana
;; U+1D000..U+1D0FF 	Byzantine Musical Symbols 	256 	1 SMP 	Common
;; U+1D100..U+1D1FF 	Musical Symbols 	256 	1 SMP 	Common, Inherited
;; U+1D200..U+1D24F 	Ancient Greek Musical Notation 	80 	1 SMP 	Greek
;; U+1D300..U+1D35F 	Tai Xuan Jing Symbols 	96 	1 SMP 	Common
;; U+1D360..U+1D37F 	Counting Rod Numerals 	32 	1 SMP 	Common
;; U+1D400..U+1D7FF 	Mathematical Alphanumeric Symbols 	1024 	1 SMP 	Common
;; U+1EE00..U+1EEFF 	Arabic Mathematical Alphabetic Symbols 	256 	1 SMP 	Arabic
;; U+1F000..U+1F02F 	Mahjong Tiles 	48 	1 SMP 	Common
;; U+1F030..U+1F09F 	Domino Tiles 	112 	1 SMP 	Common
;; U+1F0A0..U+1F0FF 	Playing Cards 	96 	1 SMP 	Common
;; U+1F100..U+1F1FF 	Enclosed Alphanumeric Supplement 	256 	1 SMP 	Common
;; U+1F200..U+1F2FF 	Enclosed Ideographic Supplement 	256 	1 SMP 	Hiragana, Common
;; U+1F300..U+1F5FF 	Miscellaneous Symbols and Pictographs 	768 	1 SMP 	Common
;; U+1F600..U+1F64F 	Emoticons 	80 	1 SMP 	Common
;; U+1F680..U+1F6FF 	Transport and Map Symbols 	128 	1 SMP 	Common
;; U+1F700..U+1F77F 	Alchemical Symbols 	128 	1 SMP 	Common
;; U+20000..U+2A6DF 	CJK Unified Ideographs Extension B 	42720 	2 SIP 	Han
;; U+2A700..U+2B73F 	CJK Unified Ideographs Extension C 	4160 	2 SIP 	Han
;; U+2B740..U+2B81F 	CJK Unified Ideographs Extension D 	224 	2 SIP 	Han
;; U+2F800..U+2FA1F 	CJK Compatibility Ideographs Supplement 	544 	2 SIP 	Han
;; U+E0000..U+E007F 	Tags 	128 	14 SSP 	Common
;; U+E0100..U+E01EF 	Variation Selectors Supplement 	240 	14 SSP 	Inherited
;; U+F0000..U+FFFFF 	Supplementary Private Use Area-A 	65536 	15 PUA 	
;; U+100000..U+10FFFF 	Supplementary Private Use Area-B 	65536 	16 PUA 





;; Local Variables:
;; eval:(progn (hs-minor-mode t) (let ((hs-state '((3054 3094 hs) (3147 3306 hs) (4712 5227 hs) (5260 5540 hs))) (the-mark 'scinartspecialmarku2npbmfydfnwzwnpywxnyxjr)) (dolist (i hs-state) (if (car i) (progn (goto-char (car i)) (hs-find-block-beginning) (hs-hide-block-at-point nil nil))))) (goto-char 6996) (recenter-top-bottom))
;; End:
