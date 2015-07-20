(defun company-manual-begin ()
  (interactive)
  (company-assert-enabled)
  (if (file-exists-p ".clang_complete")
      (setf company-clang-arguments (s-split "\n" (f-read ".clang_complete") t)))
  (setq company--manual-action t)
  (unwind-protect
      (let ((company-minimum-prefix-length 0))
        (or company-candidates
            (company-auto-begin)))
    (unless company-candidates
      (setq company--manual-action nil))))

