(provide 'scheme-mode-color)
(defface my-scheme-quote-face '((t (:foreground "orange red" :box (:line-width 2 :color "grey75" :style pressed-button) :slant oblique :weight bold))) "moved here 2013-06-05 Wednesday 21:14:05")
(defface my-scheme-pre-defined-function-face
  '((((class color) (min-colors 88) (background light)) (:foreground "Orange"))
    (((class color) (min-colors 88) (background dark)) (:foreground "LightCyan"))
    (((class color) (min-colors 16) (background light)) (:foreground "Orange"))
    (((class color) (min-colors 16) (background dark)) (:foreground "LightCyan"))
    (((class color) (min-colors 8)) (:foreground "blue" :bold t))
    (t (:bold t)))
  "user defined face using PowderBlue for scheme pre-defined function.")

(defface my-scheme-symbol-face
  '((t (:foreground "snow1" :weight bold)))
"")

(defface my-scheme-quote-face
  '((t (:foreground "orange red" :box (:line-width 2 :color "grey75" :style pressed-button) :slant oblique :weight bold)))
"")

(defface my-scheme-exclamation-face
; '((t (:foreground "" :box (:line-width 2 :color "" :style ) :slant oblique :weight bold))) "")
  '((t (:foreground "yellow1" :weight bold)))
"")


(defun scheme-add-keywords (face-name keyword-rules)
  (let* ((keyword-list (mapcar #'(lambda (x)
				   (symbol-name (cdr x)))
			       keyword-rules))
	 (keyword-regexp (concat "(\\("
				 (regexp-opt keyword-list)
				 "\\)[ \n]")))
    (font-lock-add-keywords 'scheme-mode
			    `((,keyword-regexp 1 ',face-name))))
  (mapc #'(lambda (x)
	    (put (cdr x)
		 'scheme-indent-function
		 (car x)))
	keyword-rules))

(defun add-keywords (mode face-name regexp)
  (let* ((keyword-regexp (concat "(\\("
				 regexp
				 "\\)[ \n]")))
     (font-lock-add-keywords mode
                             `((,keyword-regexp 1 ',face-name)))))
(defun strong-regexp (mode face-name group regexp)
  (font-lock-add-keywords mode
			  `((,regexp group ',face-name))))

(add-keywords 'scheme-mode
	      'my-scheme-symbol-face
	      "\\([\\+\\-\\\\\*\\/\\=\\<\\>]\\)+?")

;(strong-regexp 'scheme-mode
;	       'my-scheme-symbol-face
;	       2
;good 	       "\\([0-9]+\\)")
;	       "\\([ \n]\\)")
;	       "\\([ \n\t]\\)\\([0-9]+\\)")

; 对于数学的着色
(font-lock-add-keywords
 'scheme-mode
; '(("\\([] %()[{|}]\\)\\([0-9]+\\)\\([ \n\t()]\\)" . 2))) 这个是插花的
; '(("\\([] %()[{|}]\\)\\([0-9]+\\)\\([] %()[{|}]\\)" . 2)))
;; 终于知道为什么插花了，
;; 这个是基于搜索的，没有zero-width look-ahead assertion
;; 上式一个数字占了仨格，接下来那个没法搜了。
;; 想了想，这样插花也好。别人设计还设计不出来呢。！！！
;; 2013-01-25 Friday 23:36:45 灵机一动，明白原因了。
  `((,"\\([] %()[{|}]\\)\\([0-9]+\\)\\([] %\\n()[{|}]\\)" 2 ', 'my-scheme-symbol-face)))

; 对于 ' 的着色
(font-lock-add-keywords
 'scheme-mode
 `((,"\\('\\)" 1 ', 'my-scheme-quote-face)))




;(strong-regexp 'scheme-mode
;	       'my-scheme-quote-face
;	       1
;	       "\\('\\)")



;(font-lock-add-keywords 'scheme-mode
; '(("" 9 the-face prepend)
;   ("" . face)))

(scheme-add-keywords
 'font-lock-keyword-face
 '(
   (0 . caaaar)
   (0 . caaadr)
   (0 . caaar)
   (0 . caadar)
   (0 . caaddr)
   (0 . caadr)
   (0 . caar)
   (0 . cadaar)
   (0 . cadadr)
   (0 . cadar)
   (0 . caddar)
   (0 . cadddr)
   (0 . caddr)
   (0 . cadr)
   (0 . car)
   (0 . cdaaar)
   (0 . cdaadr)
   (0 . cdaar)
   (0 . cdadar)
   (0 . cdaddr)
   (0 . cdadr)
   (0 . cdar)
   (0 . cddaar)
   (0 . cddadr)
   (0 . cddar)
   (0 . cdddar)
   (0 . cddddr)
   (0 . cdddr)
   (0 . cddr)
   (0 . cdr)
))

(scheme-add-keywords
 'my-scheme-exclamation-face
 '(
   (0 . set!)
   (0 . set-mcar!)
   (0 . set-car!)
   (0 . set-cdr!)
   (0 . set-mcdr!)
   (0 . string-copy!)
   (0 . string-fill!)
   (0 . string-set!)
   (0 . vector-copy!)
   (0 . vector-fill!)
   (0 . vector-set!)
  ))   

(scheme-add-keywords 
 'my-scheme-pre-defined-function-face
 '(   
   (1 . append)
   (0 . cons)
   (0 . error)
   (1 . filter)
   (0 . list)
   (0 . map)
   (0 . newline)
   (0 . not)
   (0 . remove)
   (0 . remove*)


   (0 . boolean?)
   (0 . cons?)
   (0 . empty?)
   (0 . eq?)
   (0 . equal?)
   (0 . even?)
   (0 . exact-integer?)
   (0 . exact-nonnegative-integer?)
   (0 . exact-positive-integer?)
   (0 . exact?)
   (0 . false?)
   (0 . inexact?)
   (0 . keyword?)
   (0 . list?)
   (0 . negative)
   (0 . null?)
   (0 . number?)
   (0 . odd?)
   (0 . pair?)
   (0 . positive?)
   (0 . primitive?)
   (0 . procedure?)
   (0 . rational?)
   (0 . real?)
   (0 . sequence?)
   (0 . string?)
   (0 . symbol?)
   (0 . vector?)
   (0 . void?)
   (0 . zero?)


   ))





;; Local Variables:
;; eval:(progn (save-excursion (hs-minor-mode t) (let ((hs-state '((2162 2162 nil) (1 1 nil) (30 30 nil) (225 225 nil) (270 270 nil) (350 350 nil) (432 432 nil) (512 512 nil) (594 594 nil) (660 660 nil) (679 679 nil) (269 750 hs) (752 752 nil) (753 753 nil) (784 784 nil) (828 828 nil) (783 830 hs) (832 832 nil) (833 833 nil) (863 863 nil) (986 986 nil) (862 988 hs) (990 990 nil) (991 991 nil) (1027 1027 nil) (1124 1124 nil) (1170 1170 nil) (1026 1172 hs) (1174 1174 nil) (1175 1175 nil) (1176 1176 nil) (1229 1229 nil) (1274 1274 nil) (1304 1304 nil) (1330 1330 nil) (1363 1363 nil) (1394 1394 nil) (1413 1413 nil) (1454 1454 nil) (1498 1498 nil) (1520 1520 nil) (1538 1538 nil) (1565 1565 nil) (1578 1578 nil) (1228 1593 hs) (1595 1595 nil) (1596 1596 nil) (1596 1597 nil) (1640 1640 nil) (1680 1680 nil) (1692 1692 nil) (1711 1711 nil) (1745 1745 nil) (1810 1811 nil) (1812 1812 nil) (1863 1863 nil) (1894 1894 nil) (1932 1932 nil) (1933 1933 nil) (1960 1960 nil) (1990 1990 nil) (2035 2035 nil) (2036 2036 nil) (2065 2065 nil) (2097 2097 nil) (2108 2108 nil) (2138 2138 nil))) (the-mark 'scinartspecialmarku2npbmfydfnwzwnpywxnyxjr)) (dolist (i hs-state) (if (not (null (caddr i))) (progn (goto-char (car i)) (hs-find-block-beginning) (hs-hide-block-at-point nil nil))))) (message "%s" "really")) (goto-char 1596) (recenter-top-bottom))
;; End:
