;;; my-common-lisp.el ---

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

(if (file-readable-p "/home/scinart/.emacs.d/HyperSpec/")
    (setf common-lisp-hyperspec-root "/home/scinart/.emacs.d/HyperSpec/")
  '())
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
     (define-key lisp-mode-map (kbd "C-<backspace>") 'backward-kill-sexp)
     (define-key lisp-mode-map (kbd "RET") 'newline-and-indent)
     (define-key lisp-mode-map (kbd "C-c C-t") 'lisp-trace-procedure)
     (define-key lisp-mode-map "\C-\\" (lambda () "insert \'lambda\'" (interactive) (insert "lambda")))
     (define-key lisp-mode-map (kbd "C-/") 'hippie-expand)
     (define-key lisp-mode-map (kbd "M-c M-e") 'lisp-eval-last-sexp-split-window)
     (define-key lisp-mode-map (kbd "C-h C-h") 'slime-describe-symbol)
     (define-key slime-mode-map (kbd "M-p") 'my-scroll-up)
     (define-key slime-mode-map (kbd "M-n") 'my-scroll-down)
     (define-key lisp-mode-map (kbd "C-h C-<space>") 'hyperspec-lookup)
     (define-key lisp-mode-map [remap describe-function] 'hyperspec-lookup)
     (define-key lisp-mode-map [remap lisp-eval-last-sexp] 'slime-eval-last-expression)
     (setq browse-url-browser-function ;;todo use add-to-list
	   `((,(concat common-lisp-hyperspec-root "*") . w3m-browse-url)
	     ("." . browse-url-default-browser)))
     (if (fboundp 'comint-previous-input)
	 (progn (define-key lisp-mode-map (kbd "M-<up>") 'comint-previous-input)
		(define-key lisp-mode-map (kbd "M-<down>") 'comint-next-input))
       '())
     )
  )
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




(provide 'my-common-lisp)



;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################

;;; common-lisp-config.el ends here



