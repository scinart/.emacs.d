;;; common-lisp-config.el ---

;; Copyright 2013 Scinart Ouyang
;;
;; Author: akubeej@gmail.com
;; Version: $Id: lisp-config.el,v 0.0 2013/04/16 09:29:04 scinart Exp $
;;; Code:


;; slime required in package
(require 'slime)
(require 'slime-autoloads)

;; (slime-setup '(slime-fancy))

(setq slime-lisp-implementations
      '((sbcl ("sbcl") :coding-system utf-8-unix)))


;; use C-u M-x Slime

(setq inferior-lisp-program "sbcl")

(add-hook 'inferior-lisp-mode-hook (lambda () (inferior-slime-mode t)))

;; (setq slime-net-coding-system 'utf-8-unix)

;; for common-lisp indentation
(add-hook 'lisp-mode-hook
	  (lambda ()
	    (set (make-local-variable 'lisp-indent-function)
		 'common-lisp-indent-function)))

(require 'inf-lisp)
;; old-version not delete
;; (slime-setup '(slime-repl))

(require 'paredit)
(add-hook 'lisp-mode-hook 'paredit-mode)

(add-hook 'lisp-mode-hook 'hs-minor-mode)

(eval-after-load "lisp"
  '(progn
     ;; Establishing your own keybindings for lisp-mode.
     (define-key lisp-mode-map (kbd "RET") 'newline-and-indent)
     (define-key lisp-mode-map (kbd "C-c C-t") 'lisp-trace-procedure)
     (define-key lisp-mode-map "\C-\\" (lambda () "insert \'lambda\'" (interactive) (insert "lambda")))
     (define-key lisp-mode-map (kbd "C-/ C-d") "defun")
     (define-key lisp-mode-map (kbd "M-c M-e") 'lisp-eval-last-sexp-split-window)))
(defun lisp-split-window ()
  (let ((slime-buffer (if (buffer-exist "*slime-repl sbcl*")
			  "*slime-repl sbcl*"
			"*slime-repl ccl*")))
    (delete-other-windows)
    (split-window-horizontally (floor (* 0.68 (window-width))))
    (other-window 1)
    (switch-to-buffer slime-buffer)
    (other-window 1)))
(defun lisp-eval-last-sexp-split-window ()
  (interactive)
  (lisp-split-window)
  (slime-eval-last-expression))
(defun lisp-eval-definition-split-window ()
  (interactive)
  (lisp-split-window)
  (slime-eval-defun))



(provide 'common-lisp-config)



;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################

;;; common-lisp-config.el ends here





;; Local Variables:
;; eval:(progn (hs-minor-mode t) (let ((hs-state '((1565 1998 hs) (1370 1370 nil) (179 179 nil) (180 180 nil) (181 181 nil) (210 210 nil) (211 211 nil) (240 240 nil) (324 324 nil) (375 375 nil) (453 453 nil) (569 569 nil) (570 570 nil) (570 571 nil) (603 603 nil) (712 712 nil) (762 762 nil) (811 811 nil) (867 868 nil) (869 869 nil) (890 890 nil) (891 891 nil) (1005 1005 nil) (1041 1041 nil) (1042 1042 nil) (1069 1069 nil) (1141 1141 nil) (1142 1142 nil) (1188 1188 nil) (1189 1189 nil) (1220 1220 nil) (1246 1246 nil) (1260 1260 nil) (1314 1314 nil) (1349 1349 nil) (1350 1350 nil))) (the-mark 'scinartspecialmarku2npbmfydfnwzwnpywxnyxjr)) (dolist (i hs-state) (if (not (null (caddr i))) (progn (goto-char (car i)) (hs-find-block-beginning) (hs-hide-block-at-point nil nil))))) (goto-char 868) (recenter-top-bottom))
;; End:
