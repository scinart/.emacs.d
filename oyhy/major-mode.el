;;; major-mode.el ---

;;; 2013-05-28 Tuesday 16:11:56 by Scinart

;;; Code:


;;; Edit Bookmark Record

;;; dired-mode

(setq dired-listing-switches "-alhF")

(add-hook 'dired-mode-hook
          (lambda ()
            (make-local-variable 'coding-system-for-read)
            (setq coding-system-for-read 'utf-8)
	    (defparameter dired-deletion-confirmer 'y-or-n-p)
            (visual-line-mode -1)))

;; from http://whattheemacsd.com/setup-dired.el-02.html
(defun dired-back-to-top ()
  (interactive)
  (beginning-of-buffer)
  (dired-next-line (if dired-omit-mode 2 4)))
(defun dired-jump-to-bottom ()
  (interactive)
  (end-of-buffer)
  (dired-next-line -1))

(define-key dired-mode-map (vector 'remap 'beginning-of-buffer) 'dired-back-to-top)
(define-key dired-mode-map (vector 'remap 'end-of-buffer) 'dired-jump-to-bottom)
(define-key dired-mode-map (kbd "M-p") nil)
(define-key dired-mode-map (kbd "l") 'recenter-top-bottom)

(eval-after-load "dired" '(progn (define-key dired-mode-map
				    (kbd "C-c C-<return>")
				    (lambda ()
				      (interactive)
				      (if windows-p
					  (extern (dired-replace-in-string "/" "\\" (dired-get-filename)))
					(extern (dired-get-filename) "xdg-open"))))
				 (define-key dired-mode-map (kbd "M-c") nil)))



;; ibuffer-mode
(add-hook 'ibuffer-hook
          (lambda ()
            (local-unset-key (kbd "h"))))

;; ****************************************************************
;; org-mode
(add-hook 'org-mode-hook '(lambda ()
                            (local-set-key (kbd "M-c &") 'org-mark-ring-goto)
                            (local-set-key (kbd "M-c %") 'org-mark-ring-push)
                            (local-set-key (kbd "M-h") 'my-flyspell-auto-correct-word)
                            (local-set-key (kbd "M-H") 'flyspell-auto-correct-word)
;                            (local-set-key (kbd "C-c C-h") 'outline-previous-visible-heading)
;                            (local-set-key (kbd "C-c C-n") 'outline-next-visible-heading)
			    (local-set-key (kbd "C-c C-SPC C-c") 'org-cycle)
			    (local-set-key (kbd "M-c M-v") 'org-table-edit-field)
			    ))


(require 'org)
(define-key org-mode-map (kbd "M-c &") 'org-mark-ring-goto)
(define-key org-mode-map (kbd "M-c %") 'org-mark-ring-push)
(define-key org-mode-map (kbd "M-h") 'my-flyspell-auto-correct-word)
(define-key org-mode-map (kbd "M-H") 'flyspell-auto-correct-word)
(define-key org-mode-map (kbd "C-c C-h") 'outline-previous-visible-heading)
(define-key org-mode-map (kbd "C-c C-n") 'outline-next-visible-heading)

;; ****************************************************************
;; recentf-dialog mode


;;other file associations.

(add-to-list 'auto-mode-alist '("\\.f?lex\\'" . flex-mode))
(add-to-list 'auto-mode-alist '("\\.y\\(acc\\)?\\'" . bison-mode))
(add-to-list 'auto-mode-alist '("\\.zsh\\'" . conf-mode))

; (defparameter auto-hs-mode (append auto-hs-mode '("bison-mode")) )

(if (boundp 'auto-hs-mode)
    (add-to-list 'auto-hs-mode "bison-mode"))


(provide 'major-mode)



;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################





;;; major-mode.el ends here





;; Local Variables:
;; eval:(progn (hs-minor-mode t) (let ((hs-state 'nil) (the-mark 'scinartspecialmarku2npbmfydfnwzwnpywxnyxjr)) (dolist (i hs-state) (if (car i) (progn (goto-char (car i)) (hs-find-block-beginning) (hs-hide-block-at-point nil nil))))) (goto-char 3740) (recenter-top-bottom))
;; End:
