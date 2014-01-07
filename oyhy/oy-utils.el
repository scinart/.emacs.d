;;; this is a file that is supposed to be independent with other files.
;;; it will only depend on Emacs build-in functions

(defun push-file-name ()
  "push current buffer file name to kill-ring"
  (interactive)
  (kill-new (format "\"%s\"" (buffer-file-name))))


