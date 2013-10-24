;;; my-smart-compile.el --- 

;;   %F  absolute pathname            ( /usr/local/bin/netscape.bin )
;;   %f  file name without directory  ( netscape.bin )
;;   %n  file name without extention  ( netscape )
;;   %e  extention of file name       ( bin )
(defvar smart-compile-alist
  '(;("\\.c$"          . "gcc -O2 %f -lm -o %n")
    ("\\.[Cc]+[Pp]*$" . "mingw32-g++.exe -Wall -fexceptions  -Wfloat-equal -Winline -Wunreachable-code -Wmissing-declarations -Wswitch-default -Weffc++ -std=c++11 -g  -Wshadow -Winit-self -Wredundant-decls -Wcast-align -Wfloat-equal -Winline -Wunreachable-code -Wmissing-include-dirs -Wswitch-default -pedantic-errors -pedantic -std=c++11  -ID:\\pro\\boost_1_50_0\  -c %f -o %n")
    ("\\.java$"       . "javac %f")
    (emacs-lisp-mode  . (emacs-lisp-byte-compile))))

(defvar smart-compile-replace-alist
  '(("%F" . (buffer-file-name))
    ("%f" . (file-name-nondirectory (buffer-file-name)))
    ("%n" . (file-name-sans-extension (file-name-nondirectory (buffer-file-name))))
    ("%e" . (file-name-extension (buffer-file-name)))))

(defvar smart-compile-check-makefile t)
(make-variable-buffer-local 'smart-compile-check-makefile)

(defvar smart-run-alist
  '(("\\.c$"          . "./%n")
    ("\\.[Cc]+[Pp]*$" . "mingw32-g++.exe -o %n.exe %n.o")
    ("\\.java$"       . "java %n")))

(defvar smart-executable-alist
  '("%n.class"))

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


(provide 'my-smart-compile)
(eval-when-compile
  (require 'cl))



;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################





;;; my-smart-compile.el ends here
(defun smart-compile (&optional arg)
  "An interface to `compile'.
It calls `compile' or other compile functions.
If you set `smart-compile-alist' in your .emacs,
you can define your own compile commands.
If arg, do compile interactively."
  (interactive)
  (let ((name (buffer-file-name))
        (not-yet t))

    (if (not name)(error "cannot get filename."))

    ;; any project tools exist?
    (cond
     ;; make ?
     ((and (or (file-readable-p "Makefile")
	       (file-readable-p "makefile"))
	   (not (and (local-variable-p 'compile-command)
		     compile-command))
	   smart-compile-check-makefile)
      (if (y-or-n-p "Makefile is found. Try 'make'? ")
	  (set (make-local-variable 'compile-command) "make ")
	(setq smart-compile-check-makefile nil)))

     ;; ant ?
     ((and (or (file-readable-p "build.xml"))
	   (not (and (local-variable-p 'compile-command)
		     compile-command))
	   smart-compile-check-makefile)
      (if (y-or-n-p "build.xml is found. Try 'ant'? ")
	  (set (make-local-variable 'compile-command) "ant ")
	(setq smart-compile-check-makefile nil)))

     ;; else lacal-variable?
     (t
      (if (and (local-variable-p 'compile-command)
	       compile-command)
	  (progn
	    (call-interactively 'compile)
	    (setq not-yet nil)))))

    ;; compile
    (let( (alist smart-compile-alist)
          (rlist smart-compile-replace-alist)
          (case-fold-search nil)
          (function nil) )
      (while (and alist not-yet)
        (if ;; one of smart-compile condition matches
	    (or (and (symbolp (car (car alist)));caar alist is symbol
		     (eq (car (car alist)) major-mode)); and matches current major mode
		(and (stringp (car (car alist)));or file name match pre-define name
		     (string-match (car (car alist)) name)))
	    ;; do the followings
            (progn 
              (setq function (cdr (car alist)))
              (if (stringp function)
                  (progn ;; if not local, make local
                    (if (not (and (local-variable-p 'compile-command)
				  compile-command))
                        (let ((command function))
			  (setq command (smart-compile-replace command))
                          (set (make-local-variable 'compile-command)
			       command)))
		    ;; apply local
		    (call-interactively 'compile))
                (eval function))
              (setq alist nil)
              (setq not-yet nil))
	  ;else
          (setq alist (cdr alist)))
	);end while
      );end let

    ;; If compile-command is not defined and the contents begins with "#!",
    ;; set file name to the default compile-command.
    (if (and not-yet
             (not (memq system-type '(windows-nt ms-dos)))
             (not (string-match "/\\.[^/]+$" name))
             (not
              (and (local-variable-p 'compile-command)
                   compile-command)))
        (save-restriction
          (widen)
          (if (equal "#!" (buffer-substring 1 (min 3 (point-max))))
              (set (make-local-variable 'compile-command) name))))

    ;; compile
    (if not-yet (call-interactively 'compile))))
