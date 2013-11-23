(add-hook 'before-save-hook 'hs-state-save)
(defun comment-this-line ()
  (let ((b (progn (beginning-of-line) (point)))
        (e (progn (end-of-line) (point))))
    (comment-region b e)))
(defun comment-string-and-newline (string)
  (princ string (current-buffer))
  (comment-this-line)
  (end-of-line)
  (newline))
(defun hs-state-save ()
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
		      '("lisp-mode"
			"emacs-lisp-mode"
			"scheme-mode"
			"c++-mode"
			"c-mode"
			"java-mode") :test #'string-equal))
      (save-excursion
	(let ((current-point (point)))
	  (goto-char (point-max))
	  (let ((eval-string (concatenate 'string "eval:(progn (hs-minor-mode t) (let ((hs-state '"
					  (format "%S" (delq nil (mapcar '(lambda (lst)
									    (if (null (caddr lst))
										nil
									      lst)) (omm-get-all-overlays)))) ") (the-mark 'scinartspecialmarku2npbmfydfnwzwnpywxnyxjr)) (dolist (i hs-state) (if (car i) (progn (goto-char (car i)) (hs-find-block-beginning) (hs-hide-block-at-point nil nil))))) (goto-char " (format "%S" current-point) ") (recenter-top-bottom))")))
	    ;; if the mark show only once
	    (if (search-backward "(the-mark 'scinartspecialmarku2npbmfydfnwzwnpywxnyxjr" nil t)
		(progn
		  (beginning-of-line)
		  (delete-region (point) (point-max))
		  (comment-string-and-newline eval-string)
		  (comment-string-and-newline "End:"))
	      (progn
		(goto-char (point-max))
		(newline 5)
		(comment-string-and-newline "Local Variables:")
		(comment-string-and-newline eval-string)
		(comment-string-and-newline "End:")))))))))

(provide 'hs-minor-mode-enhancement)

;; Local Variables:
;; eval:(progn (hs-minor-mode t) (let ((hs-state 'nil) (the-mark 'scinartspecialmarku2npbmfydfnwzwnpywxnyxjr)) (dolist (i hs-state) (if (car i) (progn (goto-char (car i)) (hs-find-block-beginning) (hs-hide-block-at-point nil nil))))) (goto-char 72) (recenter-top-bottom))
;; End:
