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
;; eval:(progn (hs-minor-mode t) (let ((hs-state '((1983 1983 nil) (1982 1982 nil) (1981 1981 nil) (1980 1980 nil) (1901 1901 nil) (1871 1871 nil) (1792 1792 nil) (1790 1790 nil) (1789 1789 nil) (1788 1788 nil) (1765 1765 nil) (1764 1764 nil) (1762 1763 nil) (1025 1025 nil) (1026 1026 nil) (1130 1130 nil) (1152 1152 nil) (1153 1153 nil) (1192 1192 nil) (1246 1246 nil) (1302 1302 nil) (1351 1351 nil) (1352 1352 nil) (1380 1380 nil) (1405 1405 nil) (1457 1457 nil) (1504 1504 nil) (1559 1559 nil) (1573 1573 nil) (1576 1576 nil) (1599 1599 nil) (1629 1629 nil) (1659 1659 nil) (1697 1697 nil) (1718 1718 nil) (1718 1719 nil))) (the-mark 'scinartspecialmarku2npbmfydfnwzwnpywxnyxjr)) (dolist (i hs-state) (if (not (null (caddr i))) (progn (goto-char (car i)) (hs-find-block-beginning) (hs-hide-block-at-point nil nil))))) (goto-char 1763) (recenter-top-bottom))
;; End:
