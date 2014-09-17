(defcustom auto-hs-mode '("lisp-mode"
			"emacs-lisp-mode"
			"scheme-mode"
			"c++-mode"
			"c-mode"
			"java-mode") "mode you want to add magic hs string." )




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
    (when (search-backward "(the-mark 'scinartspecialmarku2npbmfydfnwzwnpywxnyxjr" nil t)
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
	(let ((current-point (point)))
	  (goto-char (point-max))
	  (let ((eval-string (concatenate 'string "eval:(progn (hs-minor-mode t) (let ((hs-state '"
					  (format "%S" (delq nil (mapcar #'(lambda (lst)
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
	      (when create
		(goto-char (point-max))
		(newline 5)
		(comment-string-and-newline "Local Variables:")
		(comment-string-and-newline eval-string)
		(comment-string-and-newline "End:")))))))))

(provide 'hs-minor-mode-enhancement)

;; Local Variables:
;; eval:(progn (hs-minor-mode t) (let ((hs-state 'nil) (the-mark 'scinartspecialmarku2npbmfydfnwzwnpywxnyxjr)) (dolist (i hs-state) (if (car i) (progn (goto-char (car i)) (hs-find-block-beginning) (hs-hide-block-at-point nil nil))))) (goto-char 2505) (recenter-top-bottom))
;; End:
