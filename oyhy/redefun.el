;;; redefun.el
;;; Time-stamp: <2013-11-23 15:09:12 scinart>
;;; date created around 2013-05-04 Saturday
;;;;##########################################################################
;;;; OVERRIDE SYSTEM FUNCTIONS


(defun line-move (arg &optional noerror to-end try-vscroll)
  "2013-05-03 Friday 22:29:11"
  (set-window-vscroll nil 0 t)
  (if (and line-move-visual
           (not goal-column)
           (not (> (window-hscroll) 0)))
      (line-move-visual arg noerror)
    (line-move-1 arg noerror to-end)))

(defun switch-to-buffer (buffer-or-name &optional norecord force-same-window)
  " refresh title added
   Switch to buffer BUFFER-OR-NAME in the selected window.
 If called interactively, prompt for the buffer name using the
 minibuffer.  The variable `confirm-nonexistent-file-or-buffer'
 determines whether to request confirmation before creating a new
 buffer.

 BUFFER-OR-NAME may be a buffer, a string (a buffer name), or
 nil.  If BUFFER-OR-NAME is a string that does not identify an
 existing buffer, create a buffer with that name.  If
 BUFFER-OR-NAME is nil, switch to the buffer returned by
 `other-buffer'.

 Optional argument NORECORD non-nil means do not put the buffer
 specified by BUFFER-OR-NAME at the front of the buffer list and
 do not make the window displaying it the most recently selected
 one.

 If FORCE-SAME-WINDOW is non-nil, BUFFER-OR-NAME must be displayed
 in the selected window; signal an error if that is
 impossible (e.g. if the selected window is minibuffer-only).  If
 nil, BUFFER-OR-NAME may be displayed in another window.

 Return the buffer switched to."
  (interactive
   (list (read-buffer-to-switch "Switch to buffer: ") nil 'force-same-window))
  (let ((buffer (window-normalize-buffer-to-switch-to buffer-or-name)))
    (cond
     ;; Don't call set-window-buffer if it's not needed since it
     ;; might signal an error (e.g. if the window is dedicated).
     ((eq buffer (window-buffer)))
     ((window-minibuffer-p)
      (if force-same-window
          (error "Cannot switch buffers in minibuffer window")
        (pop-to-buffer buffer norecord)))
     ((eq (window-dedicated-p) t)
      (if force-same-window
          (error "Cannot switch buffers in a dedicated window")
        (pop-to-buffer buffer norecord)))
     (t (set-window-buffer nil buffer)))

    (unless norecord
      (select-window (selected-window)))
    (set-buffer buffer))
  (refresh-title))

(defun transpose-lines-aux (arg)
  "Exchange current line and next line for arg times.
    without prompt"
  (if (> arg 0)
      (dotimes (i arg)
        (transpose-lines-aux-forward))
    (dotimes (i (- arg))
      (transpose-lines-aux-backward))))
(defun transpose-lines-aux-forward ()
  "Exchange current line and next line.
    without prompt"
  (let ((how-far-to-end (- (- (point)
                              (or (end-of-line)
                                  (point))))))
    (forward-line)
    (let* ((a (and (forward-line -1)
                   (point)))
           (b (or (end-of-line)
                  (point)))
           (c (and (forward-line)
                   (point)))
           (d (or (end-of-line)
                  (point))))
      (transpose-regions a b c d))
    (backward-char how-far-to-end)))
(defun transpose-lines-aux-backward ()
  "Exchange current line and next line.
    without prompt"
  (interactive)
  (let ((how-far-to-end (- (- (point)
                              (or (end-of-line)
                                  (point))))))
    (let* ((a (and (forward-line -1)
                   (point)))
           (b (or (end-of-line)
                  (point)))
           (c (and (forward-line)
                   (point)))
           (d (or (end-of-line)
                  (point))))
      (transpose-regions a b c d))
    (forward-line -1)
    (end-of-line)
    (backward-char how-far-to-end)))
(defun transpose-lines (arg)
  "Exchange current line and next line.
 With argument ARG, do it that times.
 With a prefix arg, set arg -1
 2013-05-27 Monday 11:55:40"
  (interactive "*P")
  (let ((repeat-key ?t))
    (if (and (listp arg)
             (not (null arg)))
        (setq arg -1))
    (setq arg (or arg 1))
    (transpose-lines-aux arg)
    (setq repeat-key-str (format-kbd-macro (vector repeat-key) nil))
    (while repeat-key
      (unless (current-message)
        (message "(Type %s to repeat)"
                 repeat-key-str))
      (if (equal repeat-key (read-event))
          (progn
            (clear-this-command-keys t)
            (transpose-lines-aux arg)
            (setq last-input-event nil))
        (setq repeat-key nil)))
    (when last-input-event
      (clear-this-command-keys t)
      (setq unread-command-events (list last-input-event)))))

(defun startup-echo-area-message ()
  "copied here 2013-05-27 Monday 21:35:17"
  ;; (cond ((daemonp)
  ;;     "Starting Emacs daemon.")
  ;;    ((eq (key-binding "\C-h\C-a") 'about-emacs)
  ;;     "For information about GNU Emacs and the GNU system, type C-h C-a.")
  ;;    (t
  ;;     (substitute-command-keys
  ;;      "For information about GNU Emacs and the GNU system, type \
  ;; \\[forward-word].")))
  (format "Today is %s, and happy hacking!" (format-time-string "%A, %B %d")))

(defun make-frame-command ()
  "Make a new frame, on the same terminal as the selected frame.
If the terminal is a text-only terminal, this also selects the
new frame.
modified 2013-06-04 Tuesday 00:23:47)"
  (interactive)
  (if (display-graphic-p)
      (progn
        (right-half
	 (make-frame (list (cons 'alpha (frame-parameter (selected-frame) 'alpha))))))
    (select-frame (make-frame))))


(defvar ido-fallback-function nil "The fallback function that will be explicitly check and can be externally modified
this variable is introduced to enhance ido-find-file functionality
search (cond ...  ((eq ido-exit 'fallback) ... )) to see where it's used.
2013-08-04 Sunday 19:35:45 by Scinart")

(defun ido-file-internal (method &optional fallback default prompt item initial switch-cmd)
  ;; Internal function for ido-find-file and friends
  (unless item
    (setq item 'file))
  (let ((ido-current-directory (ido-expand-directory default))
	(ido-context-switch-command switch-cmd)
	ido-directory-nonreadable ido-directory-too-big
	filename)

    (if (or (not ido-mode) (ido-is-slow-ftp-host))
	(setq filename t
	      ido-exit 'fallback)
      (setq ido-directory-nonreadable
	    (ido-nonreadable-directory-p ido-current-directory)
	    ido-directory-too-big
	    (and (not ido-directory-nonreadable)
		 (ido-directory-too-big-p ido-current-directory))))

    (when (and (eq item 'file)
	       (or ido-use-url-at-point ido-use-filename-at-point))
      (let (fn d)
	(require 'ffap)
	;; Duplicate code from ffap-guesser as we want different
	;; behavior for files and URLs.
	(cond
	 ((with-no-warnings
	    (and ido-use-url-at-point
		 ffap-url-regexp
		 (ffap-fixup-url (or (ffap-url-at-point)
				     (ffap-gopher-at-point)))))
	  (setq ido-exit 'ffap
		filename t))

	 ((and ido-use-filename-at-point
	       (setq fn (with-no-warnings
			  (if (eq ido-use-filename-at-point 'guess)
			      (ffap-guesser)
			    (ffap-string-at-point))))
	       (not (string-match "^http:/" fn))
	       (let ((absolute-fn (expand-file-name fn)))
		 (setq d (if (file-directory-p absolute-fn)
			     (file-name-as-directory absolute-fn)
			   (file-name-directory absolute-fn))))
	       (file-directory-p d))
	  (setq ido-current-directory d)
	  (setq initial (file-name-nondirectory fn))))))

    (let (ido-saved-vc-hb
	  (vc-handled-backends (and (boundp 'vc-handled-backends) vc-handled-backends))
	  (ido-work-directory-index -1)
	  (ido-work-file-index -1)
       	  (ido-find-literal nil))

      (unless filename
	(setq ido-saved-vc-hb vc-handled-backends)
	(let ((minibuffer-completing-file-name t))
	  (setq filename (ido-read-internal item
					    (or prompt "Find file: ")
					    'ido-file-history
					    (and (eq method 'alt-file) buffer-file-name)
					    (confirm-nonexistent-file-or-buffer) initial))))

      ;; Choose the file name: either the text typed in, or the head
      ;; of the list of matches
      (cond
       ((eq ido-exit 'fallback)
	;; Need to guard setting of default-directory here, since
	;; we don't want to change directory of current buffer.
	(let ((default-directory ido-current-directory)
	      (read-file-name-function nil))
	  (setq this-command (or fallback ido-fallback-function 'find-file))
	  (run-hook-with-args 'ido-before-fallback-functions this-command)
	  (call-interactively this-command)
	  (setq ido-fallback-function nil)))

       ((eq ido-exit 'switch-to-buffer)
	(ido-buffer-internal
	 (if (memq method '(other-window other-frame)) method ido-default-buffer-method)
	 nil nil nil ido-text))

       ((eq ido-exit 'insert-buffer)
	(ido-buffer-internal 'insert 'insert-buffer "Insert buffer: " nil ido-text 'ido-enter-insert-file))

       ((eq ido-exit 'dired)
	(dired (concat ido-current-directory (or ido-text ""))))

       ((eq ido-exit 'ffap)
	(find-file-at-point))

       ((eq method 'alt-file)
	(ido-record-work-file filename)
	(setq default-directory ido-current-directory)
	(ido-record-work-directory)
	(find-alternate-file filename))

       ((memq method '(dired list-directory))
	(if (equal filename ".")
	    (setq filename ""))
	(let* ((dirname (ido-final-slash (concat ido-current-directory filename) t))
	       (file (substring dirname 0 -1)))
	  (cond
	   ((file-directory-p dirname)
	    (ido-record-command method dirname)
	    (ido-record-work-directory dirname)
	    (funcall method dirname))
	   ((file-directory-p ido-current-directory)
	    (cond
	     ((file-exists-p file)
	      (ido-record-command method ido-current-directory)
	      (ido-record-work-directory)
	      (funcall method ido-current-directory)
	      (if (eq method 'dired)
		  (with-no-warnings
		    (dired-goto-file (expand-file-name file)))))
	     ((string-match "[[*?]" filename)
	      (setq dirname (concat ido-current-directory filename))
	      (ido-record-command method dirname)
	      (ido-record-work-directory)
	      (funcall method dirname))
	     ((y-or-n-p (format "Directory %s does not exist.  Create it? " filename))
	      (ido-record-command method dirname)
	      (ido-record-work-directory dirname)
	      (make-directory-internal dirname)
	      (funcall method dirname))
	     (t
	      ;; put make-directory command on history
	      (ido-record-command 'make-directory dirname))))
	   (t (error "No such directory")))))

       ((eq method 'write)
	(ido-record-work-file filename)
	(setq default-directory ido-current-directory)
	(setq filename (concat ido-current-directory filename))
	(ido-record-command 'write-file filename)
	(add-to-history 'file-name-history filename)
	(ido-record-work-directory)
	(write-file filename t))

       ((eq method 'read-only)
	(ido-record-work-file filename)
	(setq filename (concat ido-current-directory filename))
	(ido-record-command fallback filename)
	(ido-record-work-directory)
	(run-hook-with-args 'ido-before-fallback-functions fallback)
	(funcall fallback filename))

       ((eq method 'insert)
	(ido-record-work-file filename)
	(setq filename (concat ido-current-directory filename))
	(ido-record-command
	 (if ido-find-literal 'insert-file-literally 'insert-file)
	 filename)
	(add-to-history 'file-name-history filename)
	(ido-record-work-directory)
	(insert-file-1 filename
		       (if ido-find-literal
			   #'insert-file-contents-literally
			 #'insert-file-contents)))

       (filename
	(ido-record-work-file filename)
	(setq filename (concat ido-current-directory filename))
	(ido-record-command 'find-file filename)
	(add-to-history 'file-name-history filename)
	(ido-record-work-directory)
	(ido-visit-buffer (find-file-noselect filename nil ido-find-literal) method))))))

;; --- not redefun

(ignore)




;; Local Variables:
;; eval:(progn (hs-minor-mode t) (let ((hs-state '((277 512 hs) (592 2426 hs) (2461 2677 hs) (2716 3249 hs) (3289 3859 hs) (3889 4736 hs) (4774 5298 hs) (5329 5695 hs) (5816 5996 hs) (6090 11917 hs))) (the-mark 'scinartspecialmarku2npbmfydfnwzwnpywxnyxjr)) (dolist (i hs-state) (if (car i) (progn (goto-char (car i)) (hs-find-block-beginning) (hs-hide-block-at-point nil nil))))) (goto-char 11949) (recenter-top-bottom))
;; End:
