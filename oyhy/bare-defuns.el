;; cross platforms settings
(defvar monitor-width (display-pixel-width) "requires.el 2013-05-18 Saturday 16:36:57")
(defvar monitor-height (display-pixel-height) "requires.el 2013-05-18 Saturday 16:36:59")
(defvar windows-p (string-match "windows" (symbol-name system-type)))
(defvar macosx-p (string-match "darwin" (symbol-name system-type)))
(defvar linux-p (string-match "linux" (symbol-name system-type)))

;;
(defun hexnumberp (number)
  "return t if number is 0-9, a-f, A-F
   2013-05-26 Sunday 14:30:22 by Scinart"
  (or (and (<= ?0 number) (<= number ?9))
     (and (<= ?a number) (<= number ?f))
     (and (<= ?A number) (<= number ?F))))

(defun char-name ()
  "Show the Unicode name of previous char"
  (interactive)
  (let* ((char (char-before (point)))
	 (char-name (get-char-code-property char 'name)))
    (message "U%04X %s" char char-name)))

(defun is-digit (d)
  (and (not (null d))
       (>= d ?0)
       (<= d ?9)))


(defmacro continuous-do-things (name round-expression &optional init-hook finish-hook)
  "continuous-do-things, no arg now, please.
example: (continuous-do-things continuous-downcase-word (downcase-word 1))
2013-05-30 Thursday 09:43:50 by Scinart.
so great"
  `(defun ,name ()
     (interactive)
     ,init-hook
     ,round-expression
     (unwind-protect
	 (let ((repeat-key (and (> (length (this-single-command-keys)) 1)
			      last-input-event))
	       repeat-key-str)
	   (setq repeat-key-str (format-kbd-macro (vector repeat-key) nil))
	   (message "(Type %s to repeat)" repeat-key-str)
	   (while repeat-key
	     (if (equal repeat-key (read-event))
		 (progn
		   (clear-this-command-keys t)
		   ,round-expression
		   (setq last-input-event nil))
	       (setq repeat-key nil)))
	   (when last-input-event
	     (clear-this-command-keys t)
	     (setq unread-command-events (list last-input-event))))
       ,finish-hook)))

(defun yy-or-n-p (str)
  "yes-or-no. If yes, ask again.
   by Sciart 2013-05-23 Thursday 00:01:08"
  (and (y-or-n-p str)
     (y-or-n-p-with-timeout (concat "Really " str) 8 t)))

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

(defun copy-whole-buffer ()
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

(defun drift (&optional n)
  "scroll-buffer with fixed cursor on screen"
  (let ((column-position (current-column))
	(n (or n 1)))
    (next-line n)
    (scroll-up n)))

(defun drift-down (&optional arg)
  "scroll-buffer with fixed cursor on screen"
  (interactive "P")
  (let ((n (if (numberp arg) arg 1)))
    (drift_ n)))

(defun drift-up (&optional arg)
  "scroll-buffer with fixed cursor on screen"
  (interactive "P")
  (let ((n (if (numberp arg) arg 1)))
    (drift_ (- n))))

(defun set-goal-column-as-current ()
  (set-goal-column (current-column)))

(continuous-do-things continuous-drift-up (drift-up)
		      (setf oy-drift-goal-column goal-column
			    goal-column (or goal-column (current-column)))
		      (setf goal-column oy-drift-goal-column))
(continuous-do-things continuous-drift-down (drift-down)
		      (setf oy-drift-goal-column goal-column
			    goal-column (or goal-column (current-column)))
		      (setf goal-column oy-drift-goal-column))

(continuous-do-things continuous-drift-up/5 (ignore-errors (drift-up 5)))
(continuous-do-things continuous-drift-down/5 (ignore-errors (drift-down 5)))

(defun root-current-buffer ()
  "Edit the file that is associated with the current buffer as root\nhttp://wenshanren.org/?p=298"
  (interactive)
  (if (buffer-file-name)
      (find-file (concat "/sudo:root@localhost:" (buffer-file-name)))
    (message "Current buffer does not have an associated file.")))

(defun extern (str &optional command-name)
  "use native application to open [string]"
  (interactive)
  (setq command-name (or command-name "xdg-open"))
  (cond (linux-p
	 (call-process command-name nil 0 nil str))
	(windows-p
	 (w32-shell-execute 1 str))))
