;;; Basic python setup
(require 'elpy)

(defun my-python-mode-hook ()
  (progn
    (setf python-indent-offset 2)
    (elpy-mode))
  )

(add-hook 'python-mode-hook 'my-python-mode-hook)

(provide 'my-python)
