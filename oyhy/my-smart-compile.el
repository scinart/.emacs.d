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
  

(defun smart-compile-replace (str)
  "Replace the smart-compile-replace-alist."
  (let ((rlist smart-compile-replace-alist))
    (while rlist
      (while (string-match (caar rlist) str)
	(setq str (replace-match (eval (cdar rlist)) t nil str)))
      (setq rlist (cdr rlist))))
  str)

(defun smart-run ()
  "Run the executable program according to the file type. If you set
`smart-run-alist' and `smart-executable-alist', then you can add new run
commands to new file types."
  (interactive)
  (let ((name (buffer-file-name))
	(alist smart-run-alist)
	(rlist smart-compile-replace-alist)
	(elist smart-executable-alist)
	(executable nil)
	(update t)
	(case-fold-search nil))

    (if (not name) (error "cannot get filename."))

    ;; dose the executable file exist and update?
    (let ((exfile (car elist)))
      (while (and elist (not executable))
	;; r is a local rlist
	(let ((r smart-compile-replace-alist))
	  (while r
	    (while (string-match (caar r) exfile)
	      (setq exfile
		    (replace-match
		     (eval (cdar r)) t nil exfile)))
	    (setq r (cdr r))))
	(let ((file (concat (file-name-directory (buffer-file-name))
			    exfile)))
	  (if (file-readable-p file)
	      (progn
		(if (file-newer-than-file-p name file)
		    (setq update nil))
		(setq executable t))
	    (setq exfile (cadr elist))))
	(setq elist (cdr elist))))

    (if (and executable update)
	(while alist
	  (let ((run-type (caar alist))
		(run-cmd (cdar alist)))
	    (cond ((and (symbolp run-type)
			(eq run-type major-mode))
		   (eval run-cmd))
		  ((and (stringp run-type)
			(string-match run-type name))
		   (progn (shell-command (smart-compile-replace run-cmd))
			  (setq alist nil)))
		  (t (setq alist (cdr alist))))))

      (if (and (not update) (y-or-n-p "File out of date, recompile? "))
	  (smart-compile)
	(if (y-or-n-p "Compile first? ")
	    (smart-compile))))))



(defun smart-run (&optional arg)
  (interactive "p")
  (let ((name (buffer-file-name))
        (not-yet t))
    (if (not name)
        (error "cannot get filename."))

    (let( (alist smart-run-alist) 
          (case-fold-search nil)
          (function nil) )
      (while (and alist not-yet)
        (if (or (and  (symbolp (caar alist))
		      (eq (caar alist) major-mode))
		(and (stringp (caar alist))
		     (string-match (caar alist) name)))
            (progn
              (setq function (cdar alist))
              (if (stringp function)
                  (progn
                    (set (make-local-variable 'compile-command)
                         (smart-compile-string function))
                    (call-interactively 'compile))
                (if (listp function)
                    (eval function)))
              (setq alist nil)
              (setq not-yet nil))
          (setq alist (cdr alist)))))))


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
