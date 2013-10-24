;;; defuns.el ---
;;; Time-stamp: <2013-10-23 12:18:43 scinart> 
;;; Code:


(defun dntbs ()
  "in defuns.el
   insert Day aNd Time By Scinart
   2013-05-05 Sunday 23:20:54"
  (interactive)
  (dnt)
  (insert " by Scinart"))

(defun zap-almost-to-char (arg char)
  "Kill up to but excluding ARG'th occurrence of CHAR.
Case is ignored if `case-fold-search' is non-nil in the current buffer.
Goes backward if ARG is negative; error if CHAR not found.
This emulates Vim's `dt` behavior, which rocks."
  "from https://github.com/defunkt/emacs/blob/master/defunkt/defuns.el"
  (interactive "p\ncZap to char: ")
  (if (char-table-p translation-table-for-input)
      (setq char (or (aref translation-table-for-input char) char)))
  (kill-region (point)
               (progn
                 (search-forward (char-to-string char) nil nil arg)
                 (- (point) 1)))
  (backward-char 1))
(defun delete-almost-to-char (arg char)
  "delete up to but excluding ARG'th occurrence of CHAR.
Case is ignored if `case-fold-search' is non-nil in the current buffer.
Goes backward if ARG is negative; error if CHAR not found.
This emulates Vim's `dt` behavior, which rocks."
  "modified https://github.com/defunkt/emacs/blob/master/defunkt/defuns.el"
  (interactive "p\ncZap to char: ")
  (if (char-table-p translation-table-for-input)
      (setq char (or (aref translation-table-for-input char) char)))
  (delete-region (point)
		 (progn
		   (search-forward (char-to-string char) nil nil arg)
		   (- (point) 1)))
  (backward-char 1))

(defun goto-line-or-char (arg)
  "goto-line, if with prefix arg, goto-buffer
at around 2013-06-04 Tuesday 00:23:22"
  (interactive "P")
  (if (and (listp arg)
           (not (null arg)))
      (goto-char (read-number "Goto Char: "))
    (goto-line-with-feedback)))


(defun switch-to-minibuffer-window ()
  "switch to minibuffer window (if active)"
  (interactive)
  (when (active-minibuffer-window)
    (select-window (active-minibuffer-window))))

(defun half-screen-down ()
  "next-line for half-screen times"
  (interactive)
  (ignore-errors
    (next-line (max 1 (/ (1- (window-height (selected-window))) 2)))))
(defun half-screen-up ()
  "previous-line for half-screen times"
  (interactive)
  (ignore-errors
    (previous-line (max 1 (/ (1- (window-height (selected-window))) 2)))))

;; full 0, 0, 1.0, 1.0
;; left 0, 0, 0.548, 1.0
;; right 600pixels , 0, 0.548, 1.0
;; down 0, 345pixels, 1.0, 0.514

;; (defvar monitor-width 1366 "defun.el 2013-05-18 Saturday 16:36:57")
;; (defvar monitor-height 768 "defun.el 2013-05-18 Saturday 16:36:59")

(defun refresh-title ()
  "refresh the title of the frame"
  (interactive)
  (setq frame-title-format (list (capitalize (substring (or (buffer-file-name) " ") 0 1))
				 (substring (or (buffer-file-name) " ") 1)
				 (format-time-string "    %B %e, %Y %H:%M:%S")
				 "    GNU Emacs: The extensible self-documenting text editor. Version"
				 (substring (emacs-version) 9 14) " 十年磨一剑")))

(defun my-frame-size-scale-width (float)
  (floor (* float monitor-width (/ 0.976 (frame-char-width)))))
(defun my-frame-size-scale-height (float)
  (floor (* float monitor-height (/ 0.94 (frame-char-height)))))


(defun full-screen (&optional frame)
  "total full screen"
  (interactive)
  (setq frame (or frame (selected-frame)))
  (set-frame-position frame 0 0)
  (set-frame-size frame (my-frame-size-scale-width 1.0) (my-frame-size-scale-height 1.0)))
(defun right-half (&optional frame)
  "set the frame to the right half"
  (interactive)
  (setq frame (or frame (selected-frame)))
  (set-frame-position frame 600 0)
  (set-frame-size frame (my-frame-size-scale-width 0.548) (my-frame-size-scale-height 1.0)))
(defun down-half (&optional frame)
  "set the frame to the down half"
  (interactive)
  (setq frame (or frame (selected-frame)))
  (set-frame-position frame 0 345)
  (set-frame-size frame (my-frame-size-scale-width 1.0) (my-frame-size-scale-height 0.514)))
(defun left-half (&optional frame)
  "set the frame to the left half"
  (interactive)
  (setq frame (or frame (selected-frame)))  
  (set-frame-position frame 0 0)
  (set-frame-size frame (my-frame-size-scale-width 0.548) (my-frame-size-scale-height 1.0)))

;; (frame-char-width)
;; (frame-char-height)

(defun text-scale-reset ()
  "set the buffer to text scale 0"
  (interactive)
  (text-scale-set 0))
(defun sci-copy-line (arg)
  "Copy lines (as many as prefix argument) in the kill ring"
  (interactive "p")
  (let ((line-head (line-beginning-position))
        (line-end (line-end-position arg)))
    (kill-ring-save line-head line-end)
    (message "%d line%s copied" arg (if (= 1 arg) "" "s"))))
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
(require 'server)
(defun start-server ()
  "Start Server and Remove 'kull-buffer-query unless server-running is true"
  (interactive)
  (if (file-exists-p (getenv "EMACS_SERVER_FILE"))
      (delete-file (getenv "EMACS_SERVER_FILE")))
  (if (and (fboundp 'server-running-p)
           (not (server-running-p)))
      (progn
        (server-start)
        (remove-hook 'kill-buffer-query-functions
                     'server-kill-buffer-query-function))))
(defun other-window-exists ()
  "Return if current frame contains many windows"
  (cond ((car (cdr (window-list))) t)
        (t nil)))
(defun smart-kill-buffer (arg)
  "kill buffer, with arg, bury buffer."
  (interactive "P")
  (cond ((listp (or arg 1))
	 (bury-buffer))
	(t
         (kill-buffer))))
(defun smart-delete-window (arg)
  "delete-window, and if it is the only window, kill this buffer
   if arg, bury window"
  (interactive "P")
  (if (listp (or arg 1))
      (bury-buffer)
    (cond ((other-window-exists)
	   (delete-window))
	  (t
	   (kill-buffer)))))
(defun kill-current-buffer ()
  "kill current buffer and disable prompt! 2013-04-27 Saturday 23:59:19 by sci"
  (interactive)
  (kill-buffer))
(defun my-base64-encode-region (&optional s)
  "Turn region and then base64 encode it"
  (interactive)
  (encode-coding-region (mark) (point) 'binary)
  (base64-encode-region (mark) (point) t))
(defun my-base64-decode-region ()
  "base64-decode and turn to utf-8 coding, point must be succeeding mark"
  (interactive)
  (let ((m (mark))
	(p (point)))
    (if (< m (point))
	(progn (base64-decode-region m p)
	       (decode-coding-region m (point) 'utf-8))
      (progn (base64-decode-region p m)
	     (forward-sexp)
	     (decode-coding-region p (point) 'utf-8)))))
(defun smart-other-window (arg)
  "If other window, do it. else next buffur"
  (interactive n)
  (cond ((other-window-exists)
         (other-window arg))
        (t
         (cond ((= arg 1)
                (next-buffer))
               ((= arg -1)
                (previous-buffer))
               (t
                (message "%s" "arg not recognized"))))))
(defun open-this-buffer-in-explorer ()
  "Open this buffer or this buffer's directory in Explorer
   2013-04-18 Thursday 14:27:04"
  (interactive)
  (cond ((eq 'gnu/linux system-type)
	 (cond ((buffer-file-name)
		(call-process "gnome-open" nil 0 nil (file-name-directory (buffer-file-name))))
	       (dired-directory
		(call-process "gnome-open" nil 0 nil dired-directory))
	       (t
		(message "%s" "Buffer Not Recognized as File or Directory"))))
	((eq 'windows-nt system-type)
	 (cond ((buffer-file-name)
		(w32-shell-execute 1 (file-name-directory (buffer-file-name))))
	       (dired-directory
		(w32-shell-execute 1 dired-directory))
	       (t
		(message "%s" "Buffer Not Recognized as File or Directory"))))))

;; Borrowed from http://whattheemacsd.com/key-bindings.el-01.html
(defun goto-line-with-feedback ()
  "Show line numbers temporarily, while prompting for the line number input"
  (interactive)
  (unwind-protect
      (progn
        (linum-mode 1)
        (goto-line (read-number "Goto line: ")))
    (linum-mode 1)))


;; used by command line.
;; ********************************************************************************************************************************

;; group of very short keyboard commands
(defun iwb()
  "Make the whole buffer pretty and consistent, iwb for Indent Whole Buffer"
  (interactive)
  (delete-trailing-whitespace)
  (indent-region (point-min) (point-max) nil)
  (untabify (point-min) (point-max)))
(defun om ()
  "shorthands for org-mode 2013-04-28 Sunday 00:03:45 by scinart"
  (interactive)
  (org-mode))
(defun lm ()
  "shorthands for lisp-mode 2013-05-04 Saturday 23:00:08 by scinart"
  (interactive)
  (lisp-mode))
(defun elm ()
  "shorthands for emacs lisp mode 2013-05-05 Sunday 20:15:42 by scinart"
  (interactive)
  (emacs-lisp-mode))
(defun clm ()
  "shorthands for common-lisp-mode about 2013 April"
  (interactive)
  (common-lisp-mode))
(defun scm ()
  "shorthands for scheme-mode"
  (interactive)
  (scheme-mode))

(defun lim ()
  "shorthands for lisp-interactive-mode 2013-05-27 Monday 22:38:27 by Scinart"
  (interactive)
  (lisp-interaction-mode))
(defun rsm ()
  "shorthands for run-slime. 2013-05-05 Sunday 12:31:53 by Scinart"
  (interactive)
  (run-slime))
(defun tm ()
  "shorthands for text-mode. 2013-05-11 Saturday 10:57:55 by Scinart"
  (interactive)
  (text-mode))
(defun atoz ()
  "insert a to z
   2013-05-23 Thursday 22:48:23 by Scinart"
  (interactive)
  (dotimes (i 25)
    (insert (+ i ?a) " "))
  (insert (+ 25 ?a)))
(defun atob ()
  "insert from a to b
   2013-05-23 Thursday 22:48:29 by Scinart"
  (interactive)
  (let ((a (read-char "insert from"))
	(b (read-char "to")))
    (dotimes (i (- b a))
      (insert (+ i a) " "))
    (insert b)))

(defun shutdown ()
  "shutdown after /input/ seconds. NOT WORKING"
  (interactive)
  (let ((seconds (read-number "Shutdown after seconds ")))
    (if (>= seconds 0)
	(w32-shell-execute 1 "c:/Windows/System32/shutdown.exe" (concat "-s -f -t " (format "%d" seconds)))
      (w32-shell-execute 1 "c:/Windows/System32/shutdown.exe" "-a"))))

(defun shutn ()
  "shutdown now.
   2013-05-27 Monday 10:18:15 by Scinart NOT WORKING"
  (interactive)
  (let ((seconds 15))
    ;; (w32-shell-execute 1 "c:/Windows/System32/shutdown.exe" (concat "-s -f -t " (format "%d" seconds)))
    (call-process "shutdown" nil 0 nil "--version")
    (save-some-buffers t t)
    "Optional argument (the prefix) non-nil means save all with no questions.
     Optional second argument PRED determines which buffers are considered:
     If PRED is nil, all the file-visiting buffers are considered.
     If PRED is t, then certain non-file buffers will also be considered."
    (run-hook-with-args-until-failure 'kill-emacs-query-functions)
    (kill-emacs)))

(defun paredit-wrap-round-from-behind ()
  "backward round sexp? I'm not sure What I'm thinking about, even though it is only a few days ago. Commented at 2013-05-01 Wednesday 22:51:19"
  (interactive)
  (forward-sexp -1)
  (paredit-wrap-round)
  (insert " ")
  (forward-char -1))
(defun paredit-backward-be-slurped-sexp ()
  "defined 2013-05-01 Wednesday 21:17:36 by scinart
   this sexp to move inside last sexp
   should only be used in a parenthesis."
  (interactive)
  (paredit-backward-up)
  (search-backward "(")
  (forward-char)
  (paredit-forward-slurp-sexp)
  (backward-char)
  (paredit-forward)
  (backward-char))
(defun paredit-backward-swap-sexp ()
  "defined 2013-05-01 Wednesday 21:23:13 by Scinart
   should only be used in a parenthesis."
  (interactive)
  (paredit-backward-up)
  (transpose-sexps 1))
(defun my-paredit-forward-slurp-sexp (arg)
  "2013-06-23 Sunday 14:20:53 make C-) and C-( more convenient"
  (interactive "P")
  (if (listp (or arg 1))
      (paredit-forward-barf-sexp)
    (paredit-forward-slurp-sexp)))
(defun my-paredit-backward-slurp-sexp (arg)
  "2013-06-23 Sunday 14:21:13 see previous"
  (interactive "P")
  (if (listp (or arg 1))
      (paredit-backward-barf-sexp)
    (paredit-backward-slurp-sexp)))
(defun my-flyspell-auto-correct-word ()
  "defined 2013-05-11 Saturday 11:28:15 by Scinart
   auto-correct next-word.
   @see global set key."
  (interactive)
  (forward-word)
  (flyspell-auto-correct-word))
(defun yy-or-nn-p (str)
  "ask twice, if answers are the same, give the answer,
   else, ask for sure using yes or no.
   by Sciart 2013-05-19 Sunday 13:30:12"
  (let ((a (y-or-n-p str))
	(b (y-or-n-p (concat "Really " (downcase str)))))
    (if (and a b)
	t
      (if (not (or a b))
	  nil
	(yes-or-no-p (concat "TELL ME, " (downcase str) " "))))))
(defun yy-or-n-p (str)
  "ask twice, if answers are the yes, give t,
   once no, give nil.
   by Sciart 2013-05-23 Thursday 00:01:08"
  (if (y-or-n-p str)
      (if (y-or-n-p-with-timeout (concat "Really " str) 8 t)
	  t
	nil)
    nil))
(defun hexnumberp (number)
  "return t if number is 0-9, a-f, A-F
   2013-05-26 Sunday 14:30:22 by Scinart"
  (or (and (<= ?0 number)
	   (<= number ?9))
      (and (<= ?a number)
	   (<= number ?f))
      (and (<= ?A number)
	   (<= number ?F))))

(defun Meta-x ()
  "Mimic Microsoft word Alt-x function
   2013-05-26 Sunday 14:54:22 by Scinart"
  (interactive)
  (let ((p (point)))
    (if (> p 4)
	(let ((ssss (buffer-substring (- p 4) p))
	      (a (char-before p))
	      (b (char-before (- p 1)))
	      (c (char-before (- p 2)))
	      (d (char-before (- p 3))))
	  (if (and (hexnumberp a)
		   (hexnumberp b)
		   (hexnumberp c)
		   (hexnumberp d))
	      (progn
		(backward-delete-char 4) 
		(insert-char (string-to-number ssss 16) 1))
	    (progn
	      (backward-delete-char 1)
	      (insert (format "%04X" a)))))
      (progn
	(let ((a (char-before p)))
	  (backward-delete-char 1)
	  (insert (format "%04X" a)))))))
(defun init ()
  "start foobar mouseInc and objectdock"
  (interactive)
  (foobar2000)
  (MouseInc)
  (stardock))


(defun set-file-read-only (arg)
  "set current buffer-file as read-only
   with a prefix arg, unset buffer-file reads-only
   2013-05-27 Monday 00:15:11 by Scinart"
  (interactive "P")
  (when (buffer-file-name)
    (let ((temp-buffer-name (format-time-string "%Y%m%d.%H%M%S")))
      (shell-command (concat "attrib.exe "
			     (if arg
				 "-R "
			       "+R ") "\"" (buffer-file-name) "\"") temp-buffer-name)
      (if arg
	  (message "%s set as not read only" (current-buffer))
	(message "%s set as read only" (current-buffer)))
      (kill-buffer temp-buffer-name)))
  (unless (buffer-file-name)
    (message "%s" "buffer not recognized as a file")))

(defun paredit-backward-kill-sexp ()
  "backward kill sexp.
   2013-05-26 Sunday 23:45:04 by Scinart"
  (interactive)
  (backward-sexp)
  (kill-sexp))

(defun google-site-ishare ()
  "push \"site:ishare.iask.sina.com.cn\" to clipboard
   this function is useful.
   2013-05-28 Tuesday 15:36:18"
  (interactive)
  (with-temp-buffer
    (insert "site:ishare.iask.sina.com.cn")
    (clipboard-kill-region (point-min) (point-max))))


(defun command-keys ()
  "by which key is a command bound
  2013-05-28 Tuesday 20:34:34"
  (interactive)
  (let ((f (read-string "function: ")))
    (if (fboundp (intern f))
	(message "%s in bound to %s" f (substitute-command-keys (concat "\\[" f "]")))
      (message "%s is not a function" f))))

(defun recov ()
  "shorthands for recover this file"
  (interactive)
  (recover-this-file))

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

(progn "continuous-do-things"
       (continuous-do-things continuous-downcase-word (downcase-word 1))
       (continuous-do-things continuous-upcase-word (upcase-word 1))
       (continuous-do-things continuous-capitalize-word (capitalize-word 1))
       (continuous-do-things continuous-forward-cycle-font (switch-font 1))
       (continuous-do-things continuous-backward-cycle-font (switch-font -1))
       (continuous-do-things continuous-frame-alpha-active-increase (frame-alpha-active-increase))
       (continuous-do-things continuous-frame-alpha-active-decrease (frame-alpha-active-decrease))
       (continuous-do-things continuous-frame-alpha-inactive-increase (frame-alpha-inactive-increase))
       (continuous-do-things continuous-frame-alpha-inactive-decrease (frame-alpha-inactive-decrease))
       (continuous-do-things continuous-frame-alpha-all-increase (frame-alpha-all-increase))
       (continuous-do-things continuous-frame-alpha-all-decrease (frame-alpha-all-decrease))
       (continuous-do-things continuous-next-buffer (next-buffer))
       (continuous-do-things continuous-previous-buffer (previous-buffer)))


(defun backward-to-char ()
  (let* ((char (read-char "backward until: "))
	 (repeat-key char)
	 (ori-case-censitivity case-fold-search))
    (setq case-fold-search nil)
    (backward-char)
    (search-backward (char-to-string char))
    (forward-char)
    (setq repeat-key-str (format-kbd-macro (vector repeat-key) nil))
    (while repeat-key
      (unless (current-message)
	(message "(Type %s to repeat)"
		 repeat-key-str))
      (if (equal repeat-key (read-event))
	  (progn
	    (clear-this-command-keys t)
	    (backward-char)
	    (search-backward (char-to-string char))
	    (forward-char)
	    (setq last-input-event nil))
	(setq repeat-key nil)))
    (when last-input-event
      (setq case-fold-search ori-case-censitivity)
      (clear-this-command-keys t)
      (setq unread-command-events (list last-input-event)))))
(defun forward-to-char ()
  (let* ((char (read-char "forward after: "))
	 (repeat-key char)
	 (ori-case case-fold-search))
    (setq case-fold-search nil)
    (search-forward (char-to-string char))
    (setq repeat-key-str (format-kbd-macro (vector repeat-key) nil))
    (while repeat-key
      (unless (current-message)
	(message "(Type %s to repeat)"
		 repeat-key-str))
      (if (equal repeat-key (read-event))
	  (progn
	    (clear-this-command-keys t)
	    (search-forward (char-to-string char))
	    (setq last-input-event nil))
	(setq repeat-key nil)))
    (when last-input-event
      (clear-this-command-keys t)
      (setq case-fold-search ori-case)
      (setq unread-command-events (list last-input-event)))))
(defun forward-or-to-char (arg)
  "with prefix list arg, forward to char like vim
else forward char arg times
2013-05-29 Wednesday 21:32:17 by Scinart"
  (interactive "P")
  (if (listp (or arg 1))
      (forward-to-char)
    (forward-char arg)))
(defun backward-or-to-char (arg)
  "with prefix list arg, backward until char like vim
else forward char arg times
2013-05-29 Wednesday 21:32:40 by Scinart"
  (interactive "P")
  (if (listp (or arg 1))
      (backward-to-char)
    (backward-char arg)))
(defun create-scratch ()
  "before 2013-06-06 Thursday 21:01:24 "
  (interactive)
  (let ((blst (buffer-list)))
    (if (memq t
	      (mapcar (lambda (s) (string-equal "*scratch*" (format "%s" s))) blst))
	(kill-buffer "*scratch*"))
    (get-buffer-create "*scratch*")
    (switch-to-buffer "*scratch*")
    (lim)
    (insert (format "%s%s\n%s" ";; Now is "
	      (format-time-string "%x %A %T")
	      ";; And Happy Hacking\n\n"))
    (if (eql 'gnu/linux system-type)
	(setq dafault-directory "~/")
      (setq default-directory "D:/My Document/"))
    (not-modified)))
(defun peek (arg)
  "temorary set transparent to arg seconds
2013-06-06 Thursday 22:45:34 by Scinart"
  (interactive "p")
  (let ((alpha (car (frame-alpha-get-all)))
	(time (1+ (log (+ 1 (abs arg)) 4))))
    (when (< 50 alpha)
      (frame-alpha-set-active 33)
      (message "%d" time)
      (sleep-for (abs time) 500)
      (frame-alpha-set-active alpha))))

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

(defmacro keep-until (name let-pair-list do-before do-after &optional cancelable)
  "defun NAME a function that do two things seperately before and after a single keystroke,
if cancelable, \\[keyboard-quit] is able to cancels do-after.
2013-08-16 Friday 10:16:30 by Scinart"
  `(defun ,name ()
     ,(superstring "in #{let-pair-list} bind \n do \n #{do-before} until a keystroke do \n #{do-after}.")
     (interactive)
     (let ,let-pair-list
       ,do-before
       ,(if (not cancelable) 
	    `(define-key (current-local-map) [remap keyboard-quit] 'ignore))
       (read-key)
       (when last-input-event
	 ,(if (not cancelable)
	      `(define-key (current-local-map) [remap keyboard-quit] 'keyboard-quit))
	 ,do-after
	 (setq unread-command-events (list last-input-event))))))

;; (macroexpand '(keep-until translucent
;; 			  ((ori-alpha (frame-alpha-get)))
;; 			  (frame-alpha-set-all '(90 40))
;; 			  (frame-alpha-set-all ori-alpha)
;; 			  nil))

(keep-until translucent
	    ((ori-alpha (frame-alpha-get)))
	    (frame-alpha-set-all '(90 40))
	    (frame-alpha-set-all ori-alpha)
	    nil)


(keep-until transparent
	    ((active-alpha (frame-alpha-get-active))
	     (inactive-alpha (frame-alpha-get-inactive)))
	    (frame-alpha-set (list frame-alpha-min frame-alpha-min))
	    (frame-alpha-set (list active-alpha inactive-alpha))
	    nil)

(keep-until opaque
	    ((active-alpha (frame-alpha-get-active))
	     (inactive-alpha (frame-alpha-get-inactive)))
	    (frame-alpha-set-all (list frame-alpha-max frame-alpha-max))
	    (frame-alpha-set-all (list active-alpha inactive-alpha))
	    nil)


(defun find-bookmark+-file ()
  "use find-file to open file in bookmark list
2013-06-07 Friday 00:11:03 by Scinart"
  (interactive)
  (let ((str (cdr 
	      (find-if #'(lambda (x)
			   (and (listp x)
				(equal (car x) (intern "filename"))))
		       (bookmark-get-bookmark (bookmark-completing-read "Jump to bookmark" (bmkp-default-bookmark-name)) 'NOERROR)))))
    (if (file-exists-p str)
	(find-file str))))

(defun my-exit ()
  "in bindings.el, ask for sure when you exit.
2013-06-11 Tuesday 10:36:45"
  (interactive)
  (if (yy-or-n-p "Are you sure to exit Emacs?")
      (save-buffers-kill-terminal)))
(defun my-ibuffer ()
  "ibuffer 2013-06-14 Friday 16:02:22"
  (interactive)
  (ibuffer nil))


(defun buffer-exist (string)
  (let ((blst (buffer-list)))
    (if (memq t (mapcar (lambda (s) (string-equal string (format "%s" s))) blst))
	t)))

;;;;    Site-Specific Variables 

;; See if we're on MS Windows or some other OS
(defvar mswindows-p (string-match "windows" (symbol-name system-type)))
(defvar macosx-p (string-match "darwin" (symbol-name system-type)))
(defvar use-home (concat (expand-file-name "~") "/"))

;; the following is defined 2013-06-11 Tuesday 10:35:47
(defun move-frame ()
  (interactive)
  (w32-send-sys-command 61456))
(defun resize-frame ()
  (interactive)
  (w32-send-sys-command 61440))
(defun start-button ()
  (interactive)
  (w32-send-sys-command 61744))
(defun screensaver ()
  (interactive)
  (w32-send-sys-command 61760))
;; 61440 - resize the window via keyboard
;; 61456 - move window via keyboard
;; 61472 - minimize current frame
;; 61488 - maximize current frame
;; 61504 - next window (not very practical)
;; 61520 - previous window (not very practical)
;; 61536 - close the window (this will quit the application)
;; 61552 - vertical scroll – doesn’t seem to do anything for me
;; 61568 - horizontal scroll – doesn’t seem to do anything for me
;; 61584 - mouse menu(?) – doesn’t seem to do anything for me
;; 61696 - activate menubar (will not de-activate it, though)
;; 61712 - arrange(?) – doesn’t seem to do anything for me
;; 61728 - restore current frame
;; 61744 - simulate pressing Windows Start button
;; 61760 - activate screensaver
;; 61776 - hotkey(?) – doesn’t seem to do anything for me

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

(defun decode-google-link (string &optional start end)
  "extract url in google jump link
2013-07-27 Saturday 22:37:15 by scinart
param string is not used"
  (interactive
    (if (region-active-p)
	(list nil (region-beginning) (region-end))
      (let ((p (point))
	    (b (line-beginning-position))
	    (e (line-end-position)))
	(list nil b e))))
  (let* ((string (buffer-substring-no-properties start end))
	 (b (string-match "http" string 4))
	 (e (string-match "&ei=" string b)))
    (kill-new (url-unhex-string (substring string b e)))))


(defun line-snippet (command-string num)
  "基本上这是一个查找替换的活，
把每一行都变成\"yourstring -- %line% 的形式
%line%是关键字
2013-08-05 Monday 11:02:03 by Scinart"
  (interactive "sCommand: (%%line%% for line-text) \nP")
  (beginning-of-buffer)
  (setq num (or num (count-lines 1 (1+ (buffer-size)))))
  (setq num (if (listp num) (car num) num))
  (while (> num 0)
    (let ((line-head (line-beginning-position))
	  (line-tail (line-end-position))
	  (line-text (buffer-substring-no-properties (line-beginning-position) (line-end-position))))
      (delete-region line-head line-tail)
      (insert (replace-regexp-in-string "%line%" line-text command-string))
      (next-line)
      (decf num))))


	 (key-binding "" t)
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

(defun root-current-buffer ()
  "Edit the file that is associated with the current buffer as root\nhttp://wenshanren.org/?p=298"
  (interactive)
  (if (buffer-file-name)
      (progn
        (setq file (concat "/sudo:root@localhost:" (buffer-file-name)))
        (find-file file))
    (message "Current buffer does not have an associated file.")))


;;;;##########################################################################
;;;; Options, Vraiables
;;;;##########################################################################


;;;;##########################################################################
					;(setq auto-window-vscroll nil)

(setq redisplay-dont-pause t)

(provide 'defuns)
;;; defuns.el ends here






;; Local Variables:
;; eval:(progn (hs-minor-mode t) (let ((hs-state 'nil) (the-mark 'scinartspecialmarku2npbmfydfnwzwnpywxnyxjr)) (dolist (i hs-state) (if (car i) (progn (goto-char (car i)) (hs-find-block-beginning) (hs-hide-block-at-point nil nil))))) (goto-char 2515) (recenter-top-bottom))
;; End:
