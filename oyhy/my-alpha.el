;;; my-alpha.el --- 

;; Copyright 2013 Scinart Ouyang
;;
;; Author: akubeej@gmail.com
;; Version: $Id: my-alpha.el,v 0.0 2013/06/03 12:22:42 scinart Exp $
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
;;   (require 'my-alpha)

;;; Code:


(defvar frame-alpha-active-walk-step 2)
(defvar frame-alpha-inactive-walk-step 1)
(defvar frame-alpha-default (list 100 100))

(defconst frame-alpha-original-lower-limit 20)

(setq frame-alpha-lower-limit 10)
(defvar frame-alpha-max 100)
(defvar frame-alpha-min frame-alpha-lower-limit)


(defun frame-alpha-initialize ()
  (set-frame-parameter nil 'alpha (or (frame-parameter nil 'alpha) frame-alpha-default)))
;; important
(frame-alpha-initialize)

(defun frame-alpha-set-active (arg)
  (cond ((> arg frame-alpha-max)
	 (dolist (f (frame-list))
	   (set-frame-parameter f 'alpha (list frame-alpha-max (second (frame-parameter nil 'alpha))))))
	((< arg frame-alpha-min)
	 (dolist (f (frame-list))
	   (set-frame-parameter f 'alpha (list frame-alpha-min (second (frame-parameter nil 'alpha))))))
	(t
	 (dolist (f (frame-list))
	   (set-frame-parameter f 'alpha (list arg (second (frame-parameter nil 'alpha))))))))
(defun frame-alpha-get-active ()
  (first (frame-parameter nil 'alpha)))

(defun frame-alpha-set-inactive (arg)
  (cond ((> arg frame-alpha-max)
	 (dolist (f (frame-list))
	   (set-frame-parameter f 'alpha (list (first (frame-parameter nil 'alpha)) frame-alpha-max))))
	((< arg frame-alpha-min)
	 (dolist (f (frame-list))
	   (set-frame-parameter f 'alpha (list (first (frame-parameter nil 'alpha)) frame-alpha-min))))
	(t
	 (dolist (f (frame-list))
	   (set-frame-parameter f 'alpha (list (first (frame-parameter nil 'alpha)) arg))))))
(defun frame-alpha-get-inactive ()
  (second (frame-parameter nil 'alpha)))

(defun frame-alpha-set-all (arg)
  (if (and (list arg)
	   (list (cdr arg))
	   (null (cddr arg))
	   (numberp (first arg))
	   (numberp (second arg)))
      (progn
	(frame-alpha-set-active (first arg))
	(frame-alpha-set-inactive (second arg)))
    (message "%s in not a valid parameter like (100 80)" arg)))
(defun frame-alpha-get-all ()
  (frame-parameter nil 'alpha))

(defun frame-alpha-active-increase ()
  (interactive)
  (frame-alpha-set-active (+ (frame-alpha-get-active) frame-alpha-active-walk-step)))
(defun frame-alpha-active-decrease ()
  (interactive)
  (frame-alpha-set-active (- (frame-alpha-get-active) frame-alpha-active-walk-step)))
(defun frame-alpha-inactive-increase ()
  (interactive)
  (frame-alpha-set-inactive (+ (frame-alpha-get-inactive) frame-alpha-inactive-walk-step)))
(defun frame-alpha-inactive-decrease ()
  (interactive)
  (frame-alpha-set-inactive (- (frame-alpha-get-inactive) frame-alpha-inactive-walk-step)))
(defun frame-alpha-all-increase ()
  (frame-alpha-active-increase)
  (frame-alpha-inactive-increase))
(defun frame-alpha-all-decrease ()
  (frame-alpha-active-decrease)
  (frame-alpha-inactive-decrease))

(defun frame-alpha-get ()
  (interactive)
  (frame-parameter (selected-frame) 'alpha))
(defun frame-alpha-show ()
  (interactive)
  (message "%s" (frame-alpha-get)))
(defun frame-alpha-reset ()
  (interactive)
  (set-frame-parameter (selected-frame) 'alpha frame-alpha-default))

(provide 'my-alpha)



;;;;  User Options, Variables
;;;;##########################################################################


;;; my-alpha.el ends here



;; Local Variables:
;; eval:(progn (hs-minor-mode t) (let ((hs-state '((3894 3978 hs) (3632 3698 hs) (3530 3596 hs) (3387 3494 hs) (3239 3346 hs) (3097 3198 hs) (2957 3058 hs) (2886 2917 hs) (2580 2855 hs) (2505 2545 hs) (2045 2469 hs) (1966 2005 hs) (1505 1932 hs) (1340 1429 hs))) (the-mark 'scinartspecialmarku2npbmfydfnwzwnpywxnyxjr)) (dolist (i hs-state) (if (car i) (progn (goto-char (car i)) (hs-find-block-beginning) (hs-hide-block-at-point nil nil))))) (goto-char 1) (recenter-top-bottom))
;; End:
