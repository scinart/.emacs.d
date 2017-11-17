(defcustom auto-hs-mode '("lisp-mode"
			"emacs-lisp-mode"
			"scheme-mode"
			"c++-mode"
			"c-mode"
			"java-mode") "mode you want to add magic hs string." )

(defconst HSmark (concat "eCMs9P" "nUiV6Z"))

(add-hook 'before-save-hook 'hs-state-hook)
(defun comment-this-line ()
  (let ((b (progn (beginning-of-line) (point)))
        (e (progn (end-of-line) (point))))
    (comment-region b e)))
(defun comment-string-and-newline (string)
  (princ string (current-buffer))
  (comment-this-line)
  (end-of-line)
  (newline))

(defun hs-state-hook ()
  (save-excursion
    (goto-char (point-max))
    (when (search-backward (concat "(HSmark '" HSmark) nil t)
      (hs-state-save))))

(defun hs-state-insert ()
  "if hs-state not in file, insert it."
  (interactive)
  (hs-state-save t))

(defun hs-state-save (&optional create)
  "Save hs-state to the end of the file."
  (defun omm-get-all-overlays ()
    "return a list of outline information for all the current buffer"
    (save-excursion
      (let ((all-overlays (overlays-in (point-min) (point-max))))
        (mapcar (lambda (o)
                  (list (overlay-start o) (overlay-end o) (overlay-get o 'invisible)))
                (reverse all-overlays)))))
  (ignore-errors
    (if (and comment-start
	   (member* (symbol-name major-mode)
		    auto-hs-mode :test #'string-equal))
	(save-excursion
	  (let* ((current-point (format "%S" (point)))
		 (eval-string
		  (concat "eval:"
			  "(progn (hs-minor-mode t)"
			  " (let ((hs-state '" (format "%S" (delq nil (mapcar #'(lambda (lst) (and (caddr lst) lst))
									    (omm-get-all-overlays)))) ")"
			        " (HSmark '" HSmark "))"
			   " (dolist (i hs-state)"
			    " (when (car i)"
			     " (goto-char (car i))"
			     " (hs-find-block-beginning)"
			     " (hs-hide-block-at-point nil nil))))"
			  " (goto-char " current-point ")"
			  " (recenter-top-bottom))")))
	    (goto-char (point-max))
	    ;; if the mark show only once
	    (let ((exist (search-backward HSmark nil t)))
	      (when exist
		(beginning-of-line)
		(delete-region (point) (point-max))
		(comment-string-and-newline eval-string)
		(comment-string-and-newline "End:"))
	      (when (not exist)
		(goto-char (point-max))
		(newline 2)
		(comment-string-and-newline "Local Variables:")
		(comment-string-and-newline eval-string)
		(comment-string-and-newline "End:"))))))))

(provide 'hs-minor-mode-enhancement)

(hs-state-save t)


;; Local Variables:
;; eval:(progn (hs-minor-mode t) (let ((hs-state 'nil) (HSmark 'eCMs9PnUiV6Z)) (dolist (i hs-state) (when (car i) (goto-char (car i)) (hs-find-block-beginning) (hs-hide-block-at-point nil nil)))) (goto-char 2510) (recenter-top-bottom))
;; End:
