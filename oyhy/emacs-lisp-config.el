;;; emacs-lisp-config.el --- 

;; Copyright 2013 Scinart Ouyang
;;
;; Author: akubeej@gmail.com
;; Version: $Id: emacs-lisp-config.el,v 0.0 2013/04/19 00:53:27 scinart Exp $
;; Keywords: 
;; X-URL: not distributed yet

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program; if not, write to the Free Software
;; Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.

;;; Commentary:

;; 

;; Put this file into your load-path and the following into your ~/.emacs:
;;   (require 'emacs-lisp-config)

;;; Code:

(require 'paredit)
;(eval-after-load "emacs-lisp"
;  '(progn
    ;; Establishing your own keybindings for lisp-mode.
(add-hook 'emacs-lisp-mode-hook 
	  '(lambda ()
	     (paredit-mode t)
	     (hs-minor-mode t)
	     (eldoc-mode t)
	     (company-mode)
	     (local-set-key (kbd "C-c C-d") 'today)
	     (local-set-key (kbd "C-c C-t") 'now)
	     (local-set-key (kbd "C-<backspace>") 'backward-kill-sexp)
	     (local-set-key (kbd "RET") 'newline-and-indent)
	     (local-set-key (kbd "C-c M-t") 'lisp-trace-procedure)
	     (local-set-key "\C-\\" (lambda () "insert \'lambda\'" (interactive) (insert "lambda")))
	     ;; (local-set-key (kbd "C-c C-c") 'comment-or-uncomment-region)
	     ;; do not bind C-c C-c for bookmark+ use this binding.
	     ))


(require 'emacs-lisp-color)
(provide 'emacs-lisp-config)


;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################





;;; emacs-lisp-config.el ends here





;; Local Variables:
;; eval:(progn (save-excursion (hs-minor-mode t) (let ((hs-state '((1107 1107 nil) (1163 1163 nil) (1196 1196 nil) (1211 1211 nil) (1234 1234 nil) (1258 1258 nil) (1279 1279 nil) (1324 1324 nil) (1367 1367 nil) (1421 1421 nil) (1481 1481 nil) (1575 1575 nil) (1645 1645 nil) (1706 1706 nil) (1715 1715 nil) (1716 1716 nil) (1717 1717 nil) (1717 1718 nil) (1743 1744 nil) (1745 1745 nil) (1774 1774 nil) (1775 1775 nil) (1777 1777 nil) (1856 1856 nil) (1886 1886 nil) (1965 1965 nil) (1966 1966 nil) (1967 1967 nil) (1968 1968 nil) (1969 1969 nil) (1970 1970 nil) (2005 2005 nil) (2006 2006 nil) (2007 2007 nil) (2008 2008 nil))) (the-mark 'scinartspecialmarku2npbmfydfnwzwnpywxnyxjr)) (dolist (i hs-state) (if (not (null (caddr i))) (progn (goto-char (car i)) (hs-find-block-beginning) (hs-hide-block-at-point nil nil))))) (message "%s" "really")) (goto-char 1717) (recenter-top-bottom))
;; End:
