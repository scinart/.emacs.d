(provide 'my-time)

;; see also : C-h f format-time-string
(defun now ()
  "(insert (format-time-string '%T' (current-time))) \n where %T is like '%H:%M:%S'"
  (interactive) 
;; %T is like "%H:%M:%S"
  (insert (format-time-string "%T" (current-time)))
)
(defun today ()
  "Insert string for today's date nicely formatted in American style,
e.g. Sunday, September 17, 2000.
 (format-time-string \"%x %A \")"
  (interactive)                 ; permit invocation in minibuffer
;  (insert (format-time-string "%A, %B %e, %Y" (current-time)))
  (insert (format-time-string "%x %A " (time-add (current-time)  (seconds-to-time 0)))))
(defun tomorrow ()
  "Insert string for tomorrow's date nicely formatted in American style,
e.g. Sunday, September 17, 2000."
  (interactive)                 ; permit invocation in minibuffer
  (insert (format-time-string "%x" (time-add (current-time)  (seconds-to-time 86400)))))
(defun yesterday ()
  (interactive)                 ; permit invocation in minibuffer
  (insert (format-time-string "%x" (time-add (current-time)  (seconds-to-time -86400)))))
(defun dnt ()
  "Insert Date aNd Time\n(format-time-string \"%x %A %T\")"
  (interactive)
  (insert (format-time-string "%x %A %T")))
(defun qdnt (arg)
  "Insert Date and Time in YYYYMMDD.HHMMSS format
  (format-time-string \\\"%Y%m%d.%H%M%S\\\")"
  (interactive "P")
  (if  (listp (or arg 1))
      (insert (format-time-string "%Y-%m-%d"))
    (let ((s (format-time-string "%Y%m%d.%H%M%S")))
      (insert s))))
(defun fdnt()
  "Insert Date and Time in a full pattern"
  (interactive)
  (insert (format-time-string "%B %d, %Y %A %T")))
(defun push-time ()
  "Push current time to kill ring in the form of YYYYMMDD.HHMMSS"
  (interactive)
  (let ((s (format-time-string "%Y%m%d.%H%M%S")))
    (kill-new s)))
(defun week ()
  "Insert day in the Week"
  (interactive)
  (insert (format-time-string "%A")))

(setq current-date-time-format "%x %T")
(setq current-time-format "%a %H:%M:%S")




;; Local Variables:
;; eval:(progn (hs-minor-mode t) (let ((hs-state '((1640 1790 hs) (1510 1619 hs) (1235 1495 hs) (1097 1216 hs) (645 906 hs) (73 253 hs))) (the-mark 'scinartspecialmarku2npbmfydfnwzwnpywxnyxjr)) (dolist (i hs-state) (if (car i) (progn (goto-char (car i)) (hs-find-block-beginning) (hs-hide-block-at-point nil nil))))) (goto-char 624) (recenter-top-bottom))
;; End:
