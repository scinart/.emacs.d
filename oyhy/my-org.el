;;; my-org.el ---
;;; Time-stamp: <2019-03-02 19:39:08 mama>
;;; Code:

(setf org-latex-pdf-process '("sed -i 's/	/        /g' %f"
			      "xelatex -interaction nonstopmode -shell-escape %f"
			      "xelatex -interaction nonstopmode -shell-escape %f")
      org-export-in-background t
      org-src-tab-acts-natively t)

(unless (boundp 'org-export-latex-classes)
  (setq org-export-latex-classes nil))

(setq org-latex-default-packages-alist
      '(("T1" "fontenc" t)

	"% \\usepackage{fixltx2e}"
	"% \\usepackage{graphicx}"
	"% \\usepackage{longtable}"
	"% \\usepackage{float}"
	"% \\usepackage{wrapfig}"
	"% \\usepackage{rotating}"
	"% \\usepackage[normalem]{ulem}"
	"% \\usepackage{amsmath}"
	"% \\usepackage{textcomp}"
	"% \\usepackage{marvosym}"
	"% \\usepackage{wasysym}"
	"% \\usepackage{amssymb}"

	("" "hyperref" nil)
	("" "fontspec" nil)
	("" "xeCJK" nil)
	("a4paper,left=3cm,right=2cm,top=2.5cm,bottom=2.5cm" "geometry" nil)
	;; ("a4paper" "geometry" nil)

	"\\setlength{\\parskip}{1em}"
	"\\tolerance=1000"
	"\\setmainfont{Linux Libertine}"
	"\\setmonofont{Ubuntu Mono}"
	"\\setCJKmainfont{Microsoft YaHei}"
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

(provide 'my-org)

;; Local Variables:
;; eval:(progn (hs-minor-mode t) (let ((hs-state 'nil) (HSmark 'eCMs9PnUiV6Z)) (dolist (i hs-state) (when (car i) (goto-char (car i)) (hs-find-block-beginning) (hs-hide-block-at-point nil nil)))) (goto-char 2647) (recenter-top-bottom))
;; End:
