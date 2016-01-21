(defun company-manual-begin ()
  (interactive)
  (company-assert-enabled)
  (setq ac-clang-cflags '("-std=c++11"))
  (if (file-exists-p ".clang_complete")
      (setf company-clang-arguments (s-split "\n" (f-read ".clang_complete") t))
    (setf company-clang-arguments nil))
  (setq company--manual-action t)
  (unwind-protect
      (let ((company-minimum-prefix-length 0))
        (or company-candidates
            (company-auto-begin)))
    (unless company-candidates
      (setq company--manual-action nil))))

