(defmacro continuous-do-things (name round-expression)
  "continuous-do-things, no arg now, please.
example: (continuous-do-things continuous-downcase-word (downcase-word 1))
2013-05-30 Thursday 09:43:50 by Scinart.
so great"
  `(defun ,name ()
     (interactive)
     ,round-expression
     (let ((repeat-key (and (> (length (this-single-command-keys)) 1)
			    last-input-event))
	   repeat-key-str)
       (setq repeat-key-str (format-kbd-macro (vector repeat-key) nil))
       (while repeat-key
	 (unless (current-message)
	   (message "(Type %s to repeat)"
		    repeat-key-str))
	 (if (equal repeat-key (read-event))
	     (progn
	       (clear-this-command-keys t)
	       ,round-expression
	       (setq last-input-event nil))
	   (setq repeat-key nil)))
       (when last-input-event
	 (clear-this-command-keys t)
	 (setq unread-command-events (list last-input-event))))))

(defun eval-string (string)
  "eval this string without side effect"
  (eval (read string) t))
(defun superstring (string)
  "make ruby like string
2013-08-16 Friday 11:40:15 by scinart"
  (while (string-match "#{[^}]*?}" string)
    (let* ((b (match-beginning 0))
	   (e (match-end 0))
	   (whole (substring string b e))
	   (exp (substring string (+ 2 b) (- e 1))))
      (setq string
	    (replace-regexp-in-string (regexp-quote whole)
				      (format "%S" (eval-string exp)) string))))
  string)
;; (superstring "abc#{[]}
(defun my-exit ()
  "in bindings.el, ask for sure when you exit.
2013-06-11 Tuesday 10:36:45"
  (interactive)
  (if (yy-or-n-p "Are you sure to exit Emacs?")
      (save-buffers-kill-terminal)))


(defun buffer-exist (string)
  (let ((blst (buffer-list)))
    (if (memq t (mapcar (lambda (s) (string-equal string (format "%s" s))) blst))
	t)))


(defun is-digit (d)
  (and (not (null d))
       (>= d ?0)
       (<= d ?9)))
(defun aid-num/++ (p end)
  (let ((a (char-before p)))
    (setq a (or a ?a))
    (cond ((and (<= a ?8)
		(>= a ?0))
	   (goto-char p)
	   (backward-delete-char 1)
	   (insert (1+ a))
	   (goto-char end))
	  ((= a ?9)
	   (goto-char p)
	   (backward-delete-char 1)
	   (insert ?0)
	   (aid-num/++ (1- p) end))
	  (t
	   (goto-char p)
	   (if (is-digit (char-after p))
	       (progn 
		 (insert ?1)
		 (goto-char (1+ end)))
	     (goto-char end)))
	  )))
(defun aid-num/-- (p end)
  (let ((a (char-before p)))
    (cond ((= a ?1)
	   (goto-char p)
	   (cond ( ;; a10 -> a9
		  (and (not (is-digit (char-before (1- p))))
		       (is-digit (char-after p)))
		  (backward-delete-char 1)
		  (goto-char (1- end))
		  'shorten)
		 (t ;; a21 -> a20
		  (backward-delete-char 1)
		  (insert (1- a))
		  (goto-char end)
		  )))
	  ((and (<= a ?9)
		(>= a ?1))
	   (goto-char p)
	   (backward-delete-char 1)
	   (insert (1- a))
	   (goto-char end))
	  ((= a ?0)
	   (cond ((is-digit (char-before (1- p)))
		  (if (equal 'shorten (aid-num/-- (1- p) end))
		      (progn
			(goto-char (1- p))
			(backward-delete-char 1)
			(insert ?9)
			'shorten)
		    (progn
		      (goto-char p)
		      (backward-delete-char 1)
		      (insert ?9))))
		 (t
		  (keyboard-quit))))
	  (t ;;added later; possibly wrong
	   (aid-num/-- (1+ p) end)))))
(defun num/++ ()
  (interactive)
  (let ((p (point)))
    (aid-num/++ p p)))
(defun num/-- ()
  (interactive)
  (let ((p (point)))
    (aid-num/-- p p)))

(continuous-do-things continuous-num/++ (num/++))
(continuous-do-things continuous-num/-- (num/--))



(defun my-point ()
  "return point position"
  (interactive)
  (point))

(defun binary-to-hex ()
  "enumeration of 4 bits binary number to one bit hex number.
for special use only
2013-07-03 Wednesday 19:54:32"
  (interactive)
  (labels ((aid (string)
		(backward-delete-char 4)
		(insert string)
		(forward-char 4)))
    (let* ((p (point))
	   (ssss (buffer-substring (- p 4) p)))
      (cond ((string-equal "0000" ssss) (aid "0"))
	    ((string-equal "0001" ssss) (aid "1"))
	    ((string-equal "0010" ssss) (aid "2"))
	    ((string-equal "0011" ssss) (aid "3"))
	    ((string-equal "0100" ssss) (aid "4"))
	    ((string-equal "0101" ssss) (aid "5"))
	    ((string-equal "0110" ssss) (aid "6"))
	    ((string-equal "0111" ssss) (aid "7"))

	    ((string-equal "1000" ssss) (aid "8"))
	    ((string-equal "1001" ssss) (aid "9"))
	    ((string-equal "1010" ssss) (aid "A"))
	    ((string-equal "1011" ssss) (aid "B"))
	    ((string-equal "1100" ssss) (aid "C"))
	    ((string-equal "1101" ssss) (aid "D"))
	    ((string-equal "1110" ssss) (aid "E"))
	    ((string-equal "1111" ssss) (aid "F"))))))

(defun func-region (start end func)
  "run a function over the region between START and END in current buffer."
  (save-excursion
    (let ((text (delete-and-extract-region start end)))
      (insert (funcall func text)))))

(defun hex-region (start end)
  "urlencode the region between START and END in current buffer."
  (interactive "r")
  (func-region start end #'url-hexify-string))

(defun unhex-region (start end)
  "de-urlencode the region between START and END in current buffer."
  (interactive "r")
  (func-region start end #'url-unhex-string))


(defun temporarily-bind-key (key+ fn+)
  "Shift modifier not supported
2013-08-08 Thursday 10:25:13 by Scinart"
  (interactive
   (let ((key (read-key-sequence "Which key: "))
	 (fn (function-called-at-point))
	 (enable-recursive-minibuffers t)
	 val)
     (setq val (completing-read (if fn
				    (format "Describe function (default %s): " fn)
				  "Describe function: ")
				obarray 'fboundp t nil nil
				(and fn (symbol-name fn))))
     (list key
	   (if (equal val "")
	       fn
	     (intern val)))))
  (local-set-key key+ fn+))

(defun temporarily-bind-prog (key+ fn+)
  "Shift modifier not supported
2013-08-08 Thursday 10:25:13 by Scinart"
  (interactive
   (let ((key (read-key-sequence "Which key: "))
	 (enable-recursive-minibuffers t)
	 val)
     (setq val (read))
     (list key val)))
  (global-set-key key+ `(lambda () (interactive) ,fn+)))

(defun comment-or-uncomment-region-or-line ()
    "Comments or uncomments the region or the current line if there's no active region."
    (interactive)
    (let (beg end)
        (if (region-active-p)
            (setq beg (region-beginning) end (region-end))
            (setq beg (line-beginning-position) end (line-end-position)))
        (comment-or-uncomment-region beg end)
        (next-line)))

(defun replace-string-case-sensitive (FROM-STRING TO-STRING &optional DELIMITED START END)
  "replace string case sensitive 2013-11-19 Tuesday 22:49:42"
  (interactive)
  (let ((case-fold-search nil))
    (replace-string FROM-STRING TO-STRING DELIMITED START END)))

(defun delete-region-unless-prefix (prefix)
  "call delete-region unless with a prefix, which calls kill-region"
  (interactive "P")
  (if prefix
      (call-interactively #'kill-region)
    (let ((beg (point))
	  (end (mark)))
      (unless (or beg end)
	(error "The mark is not set now, so there is no region"))
      (delete-region beg end))))

(defmacro defparameter (symbol &optional initvalue docstring)
  "since there's no defparameter in emacs lisp let's defmacro it."
  `(progn
     (defvar ,symbol nil ,docstring)
     (setq   ,symbol ,initvalue)))


(defun revert-buffer-with-chinese-gbk (coding-system)
  "Visit the current buffer's file again using coding system CODING-SYSTEM.
For a list of possible values of CODING-SYSTEM, use \\[list-coding-systems].

If CODING-SYSTEM leaves the text conversion unspecified, or if it leaves
the end-of-line conversion unspecified, FORCE controls what to do.
If FORCE is nil, get the unspecified aspect (or aspects) from the buffer's
previous `buffer-file-coding-system' value (if it is specified there).
Otherwise, determine it from the file contents as usual for visiting a file."
  (interactive "zCoding system for visited file (default chinese-gbk): \n")
  (or coding-system (setq coding-system 'chinese-gbk))
  (check-coding-system coding-system)
  (let ((coding-system-for-read coding-system))
    (revert-buffer "from-original-file" "no confirm" "preserve mode")))

(defun revert-buffer-with-utf-8 (coding-system)
  "Visit the current buffer's file again using coding system CODING-SYSTEM.
For a list of possible values of CODING-SYSTEM, use \\[list-coding-systems].

If CODING-SYSTEM leaves the text conversion unspecified, or if it leaves
the end-of-line conversion unspecified, FORCE controls what to do.
If FORCE is nil, get the unspecified aspect (or aspects) from the buffer's
previous `buffer-file-coding-system' value (if it is specified there).
Otherwise, determine it from the file contents as usual for visiting a file."
  (interactive "zCoding system for visited file (default utf-8): \n")
  (or coding-system (setq coding-system 'utf-8))
  (check-coding-system coding-system)
  (let ((coding-system-for-read coding-system))
    (revert-buffer "from-original-file" "no confirm" "preserve mode")))


(defun save-buffer-without-hook ()
  "Doc string"
  (interactive)
  (let ((before-save-hook nil))
    (save-buffer)))

(defmacro macro-arg (function-name docstring with-arg-progn without-arg-progn)
  `(defun ,function-name (arg)
     ,docstring
     (interactive "P")
  (if (listp (or arg 1))
      ,with-arg-progn
    ,without-arg-progn)))


(macro-arg save-buffer-enhanced
  "save-buffer, if with prefix arg, without hook."
  (save-buffer-without-hook)
  (progn (set-buffer-modified-p t) (save-buffer)))

(macro-arg mark-or-copy-whole-buffer
	   "mark-whole-buffer. If with C-u, copy-whole-buffer,"
	   (copy-whole-buffer)
	   (mark-whole-buffer))


(defun my-scroll-down (&optional n)
  (interactive "p")
  (scroll-up (or n 1)))

(defun my-scroll-up (&optional n)
  (interactive "p")
  (scroll-down (or n 1)))

(defun copy-whole-buffer ()
  "Copy entire buffer to clipboard"
  (interactive)
  (clipboard-kill-ring-save (point-min) (point-max))
  (message "buffer copied."))

(defun htmlize (begin end)
  (interactive
       (if (region-active-p)
	(list (region-beginning) (region-end))
	(list (1+ (search-backward "\""))
	      (progn
		(forward-char)
		(1- (search-forward "\""))))))
  (save-excursion
    (save-restriction
      (narrow-to-region begin end)
      (goto-char (point-min))
      (replace-string "&" "&amp;")
      (goto-char (point-min))
      (replace-string "<" "&lt;")
      (goto-char (point-min))
      (replace-string ">" "&gt;")
      (goto-char (point-min))
      (replace-string "'" "&apos;")
      (goto-char (point-min))
      (replace-string "\"" "&quot;")
      )))



(defun sci-push-register (arg)
  "Push current buffer to register arg"
  ;;2013-04-08 Monday 20:01:59
  (interactive "cPush to register: ")
  (cond ((buffer-file-name)
         (set-register arg (cons 'file (buffer-file-name))))
        (dired-directory
         (set-register arg (cons 'file dired-directory)))
        (t
         (message "%s" "Buffer Not Recognized as File or Directory"))))

(defun eval-last-sexp-and-replace ()
  "like ``eval-last-sexp'', but also delete last sexp
if eval fails, nothing changes.
on eval success, last sexp is deleted and evaled, and non-nil return value is also inserted.
"
  (interactive)
  (let ((e (point))
	(b (save-excursion (progn (backward-sexp) (point))))
	str ret)
    (setf str (buffer-substring-no-properties b e))
    (delete-region b e)
    (condition-case ex
	(setf ret (eval-string str))
      ('error
       (insert str)
       (message (format "Error: %s" ex))))
    (if ret
	(insert (format "%s" ret)))))

(macro-arg eval-last-sexp-or-replace
	   "eval-last-sexp, If with C-u, delete last sexp."
	   (eval-last-sexp-and-replace)
	   (eval-last-sexp nil))
