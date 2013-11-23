;;; java-config.el ---

;; Copyright 2013 Scinart Ouyang
;;
;; Author: akubeej@gmail.com
;; Version: $Id: java-config.el,v 0.0 2013/04/27 16:57:56 scinart Exp $
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
;;   (require 'java-config)

;;; Code:


;; oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
;; java-mode-settings

;; (require 'ajc-java-complete-config)
;; (add-hook 'java-mode-hook 'ajc-java-complete-mode)
;; (add-hook 'find-file-hook 'ajc-4-jsp-find-file-hook)
;; (add-hook 'java-mode-hook 'my-java-mode-hook)

(defun my-java-mode-hook ()
  "my java mode hook, Ү"
  (local-set-key "\C-c\M-n" 'c-forward-conditional)
  (local-set-key "\C-c\C-n" 'half-screen-down)
  (local-set-key (kbd "<return>") 'newline-and-indent)
  ;;;;;;;;;;;
  
  (c-set-style "java")
  (setq indent-tabs-mode nil)
  (setq comment-style "java")
  (c-set-offset 'substatement-open 0)
  (hs-minor-mode 1))
(add-hook 'java-mode-hook 'my-java-mode-hook)

(provide 'java-config)



;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################





;;; java-config.el ends here





;; Local Variables:
;; eval:(progn (hs-minor-mode t) (let ((hs-state 'nil) (the-mark 'scinartspecialmarku2npbmfydfnwzwnpywxnyxjr)) (dolist (i hs-state) (if (car i) (progn (goto-char (car i)) (hs-find-block-beginning) (hs-hide-block-at-point nil nil))))) (goto-char 1) (recenter-top-bottom))
;; End:
