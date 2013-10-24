;;; c++-config.el ---

;; Copyright 2013 Scinart Ouyang
;;
;; Author: akubeej@gmail.com
;; Version: $Id: c++-config.el,v 0.0 2013/04/27 16:59:26 scinart Exp $
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
;;   (require 'c++-config)

;;; Code:

;; oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
;; cpp-mode-settings

(add-hook 'c++-mode-hook 'my-c++-mode-hook)
(defun my-c++-mode-hook ()
  "my cpp mode hook, yeah!"
  (local-set-key "\C-c\M-n" 'c-forward-conditional)
  (local-set-key "\C-c\C-n" 'half-screen-down)
  (local-set-key (kbd "<return>") 'newline-and-indent)
  (local-set-key (kbd "C-c C-c") 'comment-or-uncomment-region)
  (hs-minor-mode 1)
  (setq comment-start "//" comment-end ""))
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.c\\'" . c++-mode))

(provide 'c++-config)


;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################





;;; c++-config.el ends here
