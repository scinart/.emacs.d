;;; my-org.el ---
;;; Time-stamp: <2015-08-07 12:16:12 scinart>
;;; Code:

(setq org-latex-pdf-process '("xelatex -interaction nonstopmode -shell-escape %f"))

(setq org-latex-default-packages-alist
      '(("T1" "fontenc" t)
	("" "fixltx2e" nil)
	("" "graphicx" t)
	("" "longtable" nil)
	("" "float" nil)
	("" "wrapfig" nil)
	("" "rotating" nil)
	("normalem" "ulem" t)
	("" "amsmath" t)
	("" "textcomp" t)
	("" "marvosym" t)
	("" "wasysym" t)
	("" "amssymb" t)
	("" "hyperref" nil)
	("" "ucharclasses" nil)
	("" "fontspec" nil)
	("" "xeCJK" nil)
	;; ("" "listings")
	;; ("" "color")
	"\\tolerance=1000"
	"\\setDefaultTransitions{\\fontspec{Code2000}}{}"
	"\\setTransitionsForLatin{\\fontspec{Linux Libertine O}}{}"
	"\\setTransitionsForGreek{\\fontspec{Galatia SIL}}{}"
	"\\setCJKmainfont{Microsoft YaHei}"
	"\\setmainfont{Ubuntu}"
	"\\setmonofont{Ubuntu Mono}"
	"\\XeTeXlinebreaklocale \"zh\" %這行及下一行使中文能自動換行"
	"\\XeTeXlinebreakskip = 0pt plus 1pt"))

(setq org-export-with-sub-superscripts nil)

(defun my-org-hook ()
  "my hook for org-mode, which has the following functions"
  (local-set-key (kbd "C-c C-<return>") 'org-open-at-point)
  (local-set-key (kbd "C-x a t") 'org-set-tags)
  (local-unset-key (kbd "C-c C-n"))
  (local-set-key (kbd "C-c C-n") 'half-screen-down)
  (local-set-key (kbd "C-c M-n") 'outline-next-visible-heading)
  (local-set-key (kbd "C-c M-p") 'outline-previous-visible-heading)
  (local-set-key (kbd "C-c C-d") 'today)
  (local-set-key (kbd "C-c C-t") 'now)
  (local-set-key (kbd "C-\\") 'org-set-tags-command)
  (local-set-key (kbd "C-c C-q") 'push-time)
  (local-set-key (kbd "C-c M-d") 'org-deadline)
  (local-set-key (kbd "C-c M-t") 'org-todo)
  (local-set-key (kbd "C-c M-s") 'org-schedule)
  (local-set-key (kbd "C-c s") 'org-table-sort-lines)
  (local-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
  (local-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
  (local-set-key (kbd "C-x M-<up>") 'full-screen)
  (local-set-key (kbd "C-x M-<left>") 'left-half)
  (local-set-key (kbd "C-x M-<right>") 'right-half)
  ;;...
  )
(add-hook 'org-mode-hook 'my-org-hook)

(setq org-src-fontify-natively t)
(setq org-export-latex-listings t)

(require 'ox-latex)
(setq org-latex-listings 'minted)
(setq org-latex-packages-alist '(("" "minted")))
;; apt-get install python-pygment

;; listings work poorly
;; (setq org-latex-listings t)
;; (setq org-latex-packages-alist '(("" "color") ("" "listings")))


(provide 'my-org)





;; Local Variables:
;; eval:(progn (hs-minor-mode t) (let ((hs-state 'nil) (the-mark 'scinartspecialmarku2npbmfydfnwzwnpywxnyxjr)) (dolist (i hs-state) (if (car i) (progn (goto-char (car i)) (hs-find-block-beginning) (hs-hide-block-at-point nil nil))))) (goto-char 2548) (recenter-top-bottom))
;; End:
