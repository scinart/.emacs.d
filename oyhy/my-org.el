;;; my-org.el ---
;;; Time-stamp: <2013-11-24 00:49:31 scinart>
;;; Code:


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

(provide 'my-org)





;; Local Variables:
;; eval:(progn (hs-minor-mode t) (let ((hs-state 'nil) (the-mark 'scinartspecialmarku2npbmfydfnwzwnpywxnyxjr)) (dolist (i hs-state) (if (car i) (progn (goto-char (car i)) (hs-find-block-beginning) (hs-hide-block-at-point nil nil))))) (goto-char 1) (recenter-top-bottom))
;; End:
