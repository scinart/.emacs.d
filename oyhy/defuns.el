;;; defuns.el ---
;;; Time-stamp: <2019-12-08 11:34:15 scinart>
;;; Code:

(load "~/.emacs.d/oyhy/bare-defuns.el")

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


(defun refresh-title ()
  "refresh the title of the frame"
  (interactive)
  (setq frame-title-format (list (capitalize (substring (or (buffer-file-name) " ") 0 1))
				 (substring (or (buffer-file-name) " ") 1)
				 (format-time-string "    %B %e, %Y %H:%M:%S")
				 "    GNU Emacs: The extensible self-documenting text editor. Version"
				 (third (split-string (emacs-version))))))

(defun my-frame-size-scale-width (float)
  (floor (* float (display-pixel-width) (/ 0.976 (frame-char-width)))))
(defun my-frame-size-scale-height (float)
  (floor (* float (display-pixel-height) (/ 0.94 (frame-char-height)))))


(defun full-screen (&optional frame)
  "total full screen"
  (interactive)
  (when (display-graphic-p)
    (setq frame (or frame (selected-frame)))
    (set-frame-position frame 0 0)
    (set-frame-size frame (my-frame-size-scale-width 1.0) (my-frame-size-scale-height 1.0))))

(defun right-half (&optional frame)
  "set the frame to the right half"
  (interactive)
  (when (display-graphic-p)
    (setq frame (or frame (selected-frame)))
    (set-frame-position frame 600 0)
    (set-frame-size frame (my-frame-size-scale-width 0.548) (my-frame-size-scale-height 1.0))))
(defun down-half (&optional frame)
  "set the frame to the down half"
  (interactive)
  (when (display-graphic-p)
    (setq frame (or frame (selected-frame)))
    (set-frame-position frame 0 345)
    (set-frame-size frame (my-frame-size-scale-width 1.0) (my-frame-size-scale-height 0.514))))
(defun left-half (&optional frame)
  "set the frame to the left half"
  (interactive)
  (when (display-graphic-p)
    (setq frame (or frame (selected-frame)))
    (set-frame-position frame 0 0)
    (set-frame-size frame (my-frame-size-scale-width 0.548) (my-frame-size-scale-height 1.0))))

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
         (kill-buffer)))
  (refresh-title))
(defun smart-delete-window (arg)
  "delete-window, and if it is the only window, kill this buffer
   if arg, bury window"
  (interactive "P")
  (if (listp (or arg 1))
      (bury-buffer)
    (cond ((other-window-exists)
	   (delete-window))
	  (t
	   (kill-buffer))))
  (refresh-title))
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
                (message "%s" "arg not recognized")))))
  (refresh-title))

(defun smart-forward-window ()
  (interactive)
  (smart-other-window 1))
(defun smart-backward-window ()
  (interactive)
  (smart-other-window -1))

(defun dir-of-current-buffer ()
  (cond ((buffer-file-name)
	 (file-name-directory (buffer-file-name)))
	(dired-directory
	 dired-directory)
	(t
	 nil)))

(defun open-this-buffer-in-explorer ()
  (interactive)
  (let ((dir (dir-of-current-buffer)))
    (if dir
	(extern dir)
      (message "%s" "Buffer Not Recognized as File or Directory"))))

(defun open-this-buffer-folder-in-terminal ()
  (interactive)
  (let ((dir (dir-of-current-buffer)))
    (if dir
	(extern (concat "--working-directory=" dir) "gnome-terminal")
      (message "%s" "Buffer Not Recognized as File or Directory"))))

;; Borrowed from http://whattheemacsd.com/key-bindings.el-01.html
(defun goto-line-with-feedback ()
  "Show line numbers temporarily, while prompting for the line number input"
  (interactive)
  (let ((linum-on-p (bound-and-true-p linum-mode)))
    (unwind-protect
	(progn
	  (linum-mode 1)
	  (goto-line (read-number "Goto line: ")))
      (if linum-on-p
	  (linum-mode 1)
	(linum-mode -1)))))


;; used by command line.
;; ********************************************************************************************************************************

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
  "2013-06-23 Sunday 14:20:53
default slurp forward,
with prefix barf forward"
  (interactive "P")
  (if (listp (or arg 1))
      (paredit-forward-barf-sexp)
    (paredit-forward-slurp-sexp)))
(defun my-paredit-backward-slurp-sexp (arg)
  "2013-06-23 Sunday 14:21:13
default backward slurp
with prefix barkwark barf"
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
  (ispell-set-spellchecker-params)
  (flyspell-auto-correct-word))

(defun set-file-read-only (arg)
  "set current buffer-file as read-only
   with a prefix arg, unset buffer-file reads-only
   2013-05-27 Monday 00:15:11 by Scinart"
  (interactive "P")
  (when (buffer-file-name)
    (let ((temp-buffer-name (format-time-string "%Y%m%d.%H%M%S")))
      (when windows-p
	(shell-command (concat "attrib.exe " (if arg "-R " "+R ")
			       "\"" (buffer-file-name) "\"") temp-buffer-name))
      (when linux-p
	(shell-command (concat "chmod " (if arg "+w " "-w ")
			       "\"" (buffer-file-name) "\"") temp-buffer-name))
      (kill-buffer temp-buffer-name)
      (if arg
      	  (message "%s set as not read only" (current-buffer))
      	(message "%s set as read only" (current-buffer)))))
  (unless (buffer-file-name)
    (message "%s" "buffer not recognized as a file")))

(defun paredit-backward-kill-sexp ()
  "backward kill sexp.
   2013-05-26 Sunday 23:45:04 by Scinart"
  (interactive)
  (backward-sexp)
  (kill-sexp))

(defun recov ()
  "shorthands for recover this file"
  (interactive)
  (recover-this-file))



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
      (message "(Type %s to repeat)"
	       repeat-key-str)
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
      (message "(Type %s to repeat)"
	       repeat-key-str)
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
(defun create-scratch (arg)
  "before 2013-06-06 Thursday 21:01:24
or switch-to-scratch, if with prefix argument."
  (interactive "P")
  (if (listp (or arg 1))
      (switch-to-buffer "*scratch*")
    (let ((blst (buffer-list)))
      (if (memq t
		(mapcar (lambda (s) (string-equal "*scratch*" (format "%s" s))) blst))
	  (kill-buffer "*scratch*"))
      (get-buffer-create "*scratch*")
      (switch-to-buffer "*scratch*")
      (lisp-interaction-mode)
      (insert (format "%s%s\n%s" ";; Now is "
		      (format-time-string "%x %A %T")
		      ";; And Happy Hacking\n\n"))
      (setf dafault-directory "~/")
      (set-buffer-modified-p nil))))
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

(defmacro keep-until (name let-pair-list do-before do-after &optional cancelable)
  "defun NAME a function that do two things seperately before and after a single keystroke,
if cancelable, \\[keyboard-quit] is able to cancels do-after.
2013-08-16 Friday 10:16:30 by Scinart"
  `(defun ,name ()
     "in #{let-pair-list} bind \n do \n #{do-before} until a keystroke do \n #{do-after}."
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

(defun my-ibuffer ()
  "ibuffer 2013-06-14 Friday 16:02:22"
  (interactive)
  (ibuffer nil))

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

;;; these functions are no longer useful, T_T;

(defun yank-primary ()
  "Insert the primary selection at the point.
Move point to the end of the inserted text, and set mark at beginning.
Adapted from mouse-yank-primary
2014-03-02 20:02:44 by scinart"
  (interactive)
  ;; Give temporary modes such as isearch a chance to turn off.
  (run-hooks 'mouse-leave-buffer-hook)
  ;; Without this, confusing things happen upon e.g. inserting into
  ;; the middle of an active region.
  (when select-active-regions
    (let (select-active-regions)
      (deactivate-mark)))
  (let ((primary
	 (cond
	  ((eq (framep (selected-frame)) 'w32)
	   ;; MS-Windows emulates PRIMARY in x-get-selection, but not
	   ;; in x-get-selection-value (the latter only accesses the
	   ;; clipboard).  So try PRIMARY first, in case they selected
	   ;; something with the mouse in the current Emacs session.
	   (or (x-get-selection 'PRIMARY)
	       (x-get-selection-value)))
	  ((fboundp 'x-get-selection-value) ; MS-DOS and X.
	   ;; On X, x-get-selection-value supports more formats and
	   ;; encodings, so use it in preference to x-get-selection.
	   (or (x-get-selection-value)
	       (x-get-selection 'PRIMARY)))
	  ;; FIXME: What about xterm-mouse-mode etc.?
	  (t
	   (x-get-selection 'PRIMARY)))))
    (unless primary
      (error "No selection is available"))
    (push-mark (point))
    (insert primary)))

(defun combine-function (default &optional C-u-function-or-function-list 123-list)
  "given (func-d (func-u1 func-u2 func-u3 ...) (func-1 func-2 func-3 ...))
call func-d if no prefix is applied when the return function is called.
call func-uN if N C-u is pressed before the return function is called.
call func-N if prefix N is applied before the return function is called.
2014-04-29 18:20:50 by scinart."
  (defun 4-power (arg)
    "arg is 4^x where x≥1 and 4^x < INT_MAX return x"
    (if (< arg 4)
	0
      (let ((aa arg)
	    (times 0))
	(while (> (logand -4 aa) 0)
	  (setq aa (lsh aa -2))
	  (incf times))
	times)))
  (lexical-let ((default default)
		(C-u-list C-u-function-or-function-list)
		(123-list 123-list))
    #'(lambda (arg) (interactive "P")
	(cond ((null arg)
	       (funcall default))
	      ((and (listp arg) (= 1 (length arg)))
	       (funcall (if (listp C-u-list)
			    (nth (- (4-power (car arg)) 1) C-u-list)
			  C-u-list)))
	      ((and (numberp arg) (>= arg 1))
	       (funcall (if (listp 123-list)
			    (nth (- arg 1) 123-list)
			  123-list) arg))))))


;;;;##########################################################################
;;;; options, Vraiables
;;;;##########################################################################

(provide 'defuns)
;;; defuns.el ends here
