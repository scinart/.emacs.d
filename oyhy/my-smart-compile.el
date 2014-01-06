;;; my-smart-compile.el --- 

;;   see \\[describe-variable] smart-compile-replace-alist

;;   %F  absolute pathname            ( /usr/local/bin/netscape.bin )
;;   %f  file name without directory  ( netscape.bin )
;;   %n  file name without extention  ( netscape )
;;   %e  extention of file name       ( bin )

(defparameter  smart-compile-alist '(
  (emacs-lisp-mode    . (emacs-lisp-byte-compile))
;  (html-mode          . (browse-url-of-buffer))
;  (nxhtml-mode        . (browse-url-of-buffer))
;  (html-helper-mode   . (browse-url-of-buffer))
;  (octave-mode        . (run-octave))
  ("\\.c\\'"          . "clang %f -o %n")
  ("\\.[Cc]+[Pp]*\\'" . "clang++ %f -o %n")
;  ("\\.m\\'"          . "gcc -O2 %f -lobjc -lpthread -o %n")
;  ("\\.java\\'"       . "javac %f")
;  ("\\.php\\'"        . "php -l %f")
;  ("\\.f90\\'"        . "gfortran %f -o %n")
;  ("\\.[Ff]\\'"       . "gfortran %f -o %n")
;  ("\\.cron\\(tab\\)?\\'" . "crontab %f")
;  ("\\.tex\\'"        . (tex-file))
;  ("\\.texi\\'"       . "makeinfo %f")
;  ("\\.mp\\'"         . "mptopdf %f")
  ("\\.l\\'"          . "flex %f -o %n.c")
  ("\\.y\\'"          . "bison %f")
  ("\\.pl\\'"         . "perl -cw %f")
  ("\\.rb\\'"         . "ruby -cw %f")
  ))

(defparameter smart-run-alist
  '(("\\.c$"          . "./%n")
    ("\\.[Cc]+[Pp]*$" . "./%n")
    ))



;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################



(provide 'my-smart-compile)
(eval-when-compile
  (require 'cl))

;;; my-smart-compile.el ends here





;; Local Variables:
;; eval:(progn (hs-minor-mode t) (let ((hs-state 'nil) (the-mark 'scinartspecialmarku2npbmfydfnwzwnpywxnyxjr)) (dolist (i hs-state) (if (car i) (progn (goto-char (car i)) (hs-find-block-beginning) (hs-hide-block-at-point nil nil))))) (goto-char 623) (recenter-top-bottom))
;; End:
