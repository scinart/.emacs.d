(provide 'emacs-lisp-color)
(defface my-emacs-lisp-quote-face
  '((t (:foreground "floral white" :slant oblique :weight bold)))
  "moved here 2013-06-05 Wednesday 21:14:05")
(defface my-emacs-lisp-pre-defined-function-face
  '((((class color) (min-colors 88) (background light)) (:foreground "Orange"))
    (((class color) (min-colors 88) (background dark)) (:foreground "LightCyan"))
    (((class color) (min-colors 16) (background light)) (:foreground "Orange"))
    (((class color) (min-colors 16) (background dark)) (:foreground "LightCyan"))
    (((class color) (min-colors 8)) (:foreground "blue" :bold t))
    (t (:bold t)))
  "user defined face using PowderBlue for emacs-lisp pre-defined function.")
(defface my-emacs-lisp-symbol-face
  '((t (:foreground "snow1" :weight bold)))
  "")
(defface my-emacs-lisp-quote-face
  '((t (:foreground "orange red" :box (:line-width 2 :color "PowderBlue" :style pressed-button) :slant oblique :weight bold)))
  "")

(defun emacs-lisp-add-keywords (face-name keyword-rules)
  (let* ((keyword-list (mapcar #'(lambda (x) (symbol-name (cdr x))) keyword-rules))
         (keyword-regexp (concat "(\\(" (regexp-opt keyword-list) "\\)[ \n]")))
    (font-lock-add-keywords 'emacs-lisp-mode
                            `((,keyword-regexp 1 ',face-name))))
  (mapc #'(lambda (x)
            (put (cdr x)
                 'emacs-lisp-indent-function
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

(add-keywords 'emacs-lisp-mode
              'my-emacs-lisp-symbol-face
              "\\([\\+\\-\\\\\*\\/\\=\\<\\>]\\)+?")

;;(strong-regexp 'emacs-lisp-mode
;;              'my-emacs-lisp-symbol-face
;;              2
;;good          "\\([0-9]+\\)")
;;              "\\([ \n]\\)")
;;              "\\([ \n\t]\\)\\([0-9]+\\)")

;; 对于数学的着色
(font-lock-add-keywords
 'emacs-lisp-mode
 ;; '(("\\([] %()[{|}]\\)\\([0-9]+\\)\\([ \n\t()]\\)" . 2))) 这个是插花的
 ;; '(("\\([] %()[{|}]\\)\\([0-9]+\\)\\([] %()[{|}]\\)" . 2)))
 ;; 终于知道为什么插花了，
 ;; 这个是基于搜索的，没有zero-width look-ahead assertion
 ;; 上式一个数字占了仨格，接下来那个没法搜了。
 ;; 想了想，这样插花也好。别人设计还设计不出来呢。！！！
 ;; 2013-01-25 Friday 23:36:45 灵机一动，明白原因了。
 `((,"\\([] %()[{|}]\\)\\([0-9]+\\)\\([] %\\n()[{|}]\\)" 2 ', 'my-emacs-lisp-symbol-face)))

;; 对于 ' 的着色
;; (font-lock-add-keywords
;;  'emacs-lisp-mode
;;  `((,"\\('\\)" 1 ', 'my-emacs-lisp-quote-face)))
;; (font-lock-add-keywords
;;  'emacs-lisp-mode
;;  `((,"\\(`\\)" 1 ', 'my-emacs-lisp-quote-face)))
(font-lock-add-keywords
 'emacs-lisp-mode
 `((,"\\(lambda\\)" 1 ', 'my-emacs-lisp-quote-face)))
;;(strong-regexp 'emacs-lisp-mode
;;              'my-emacs-lisp-quote-face
;;              1
;;              "\\('\\)")



;;(font-lock-add-keywords 'emacs-lisp-mode
;; '(("" 9 the-face prepend)
;;   ("" . face)))

(emacs-lisp-add-keywords
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

   (0 . and)
   (0 . catch)
   (0 . cond)
   (0 . cons)
   (0 . consp)
   (0 . defmacro)
   (0 . defun)
   (0 . defvar)
   (0 . elt)
   (0 . eq)
   (0 . equal)
   (0 . funcall)
   (0 . if)
   (0 . let)
   (0 . let*)
   (0 . list)
   (0 . member)
   (0 . memq)
   (0 . or)
   (0 . quote)
   (0 . set)
   (0 . setq)
   (0 . string)
   (0 . string-equal)
   (0 . t)
   (0 . throw)
   (0 . unless)
   (0 . vector)
   (0 . when)
   (0 . while)

   (0 . require)
   (0 . progn)
   (0 . provide)
   (0 . push)
   (0 . prin1)
   (0 . princ)
   (0 . print)

   (0 . put)
   (0 . pop)
   (0 . mapc)
   (0 . mapcar)
   (0 . integerp)
   (0 . last)
   (0 . length)
   (0 . nil)
   (0 . not)
   (0 . nth)
   (0 . nthcdr)
   (0 . null)
   (0 . regexp-opt)
   (0 . regexp-quote)
   (0 . number-to-string)
   (0 . reverse)
   (0 . sleep-for)
   (0 . sort)
   (0 . split-string)
   (0 . string-match)
   (0 . string-match-p)
   (0 . string-to-number)
   (0 . string=)
   (0 . stringp)
   (0 . substring)
   (0 . add-to-list)
   (0 . append)
   (0 . apply)
   (0 . aref)
   (0 . aset)
   (0 . assoc)
   (0 . assq)
   (0 . boundp)
   (0 . char-to-string)
   (0 . concat)
   (0 . function)
   (0 . get)
   (0 . gethash)

   ))

(emacs-lisp-add-keywords
 'my-emacs-lisp-pre-defined-function-face
 '(

   (0 . commandp)
   (0 . condition-case)
   (0 . expt)
   (0 . fboundp)
   (0 . featurep)
   (0 . floatp)
   (0 . format)
   (0 . format-time-string)
   (0 . hash-table-count)
   (0 . make-hash-table)
   (0 . mapconcat)
   (0 . maphash)
   (0 . max)
   (0 . message)
   (0 . min)
   (0 . puthash)
   (0 . random)
   (0 . rassoc)
   (0 . remhash)
   (0 . subrp)
   (0 . symbol-function)
   (0 . symbol-name)
   (0 . symbol-plist)
   (0 . symbol-value)
   (0 . symbolp)
   (0 . float)
   ))





;; Local Variables:
;; eval:(progn (hs-minor-mode t) (let ((hs-state '((1608 1608 nil) (1 1 nil) (29 29 nil) (29 30 nil) (63 63 nil) (129 129 nil) (173 174 nil) (175 175 nil) (224 224 nil) (304 304 nil) (386 386 nil) (466 466 nil) (548 548 nil) (614 614 nil) (633 633 nil) (710 710 nil) (745 745 nil) (789 789 nil) (795 795 nil) (829 829 nil) (956 956 nil) (962 962 nil) (963 963 nil) (1020 1020 nil) (1104 1104 nil) (1184 1184 nil) (1229 1229 nil) (1294 1294 nil) (1316 1316 nil) (1341 1341 nil) (1386 1386 nil) (1413 1413 nil) (1437 1437 nil) (1481 1481 nil) (1521 1521 nil) (1561 1561 nil))) (the-mark 'scinartspecialmarku2npbmfydfnwzwnpywxnyxjr)) (dolist (i hs-state) (if (not (null (caddr i))) (progn (goto-char (car i)) (hs-find-block-beginning) (hs-hide-block-at-point nil nil))))) (goto-char 174) (recenter-top-bottom))
;; End:
