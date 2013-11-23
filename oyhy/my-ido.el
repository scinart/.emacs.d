;;; Interactive do, find-file and iswitchb replacement with fuzzy/flex matching.

(ido-mode t)
(ido-everywhere)
;; fuzzy matching is a must have
(setq ido-enable-flex-matching t)
;; forget latest selected directory names
(setq ido-enable-last-directory-history t)

;; <!-- important -->
(defvar ido-enable-replace-completing-read t
  "If t, use ido-completing-read instead of completing-read if possible.

    Set it to nil using let in around-advice for functions where the
    original completing-read is required.  For example, if a function
    foo absolutely must use the original completing-read, define some
    advice like this:

    (defadvice foo (around original-completing-read-only activate)
      (let (ido-enable-replace-completing-read) ad-do-it))")

;; Replace completing-read wherever possible, unless directed otherwise
(defadvice completing-read
  (around use-ido-when-possible activate)
  (if (or (not ido-enable-replace-completing-read) ; Manual override disable ido
          (and (boundp 'ido-cur-list)
               ido-cur-list)) ; Avoid infinite loop from ido calling this
      ad-do-it
    (let ((allcomp (all-completions "" collection predicate)))
      (if allcomp
          (setq ad-return-value
                (ido-completing-read prompt
                                     allcomp
                                     nil require-match initial-input hist def))
        ad-do-it))))

(defun my-buffer-menu-hook ()
  ""
  (local-unset-key (kbd "h")))
(add-hook 'buffer-menu-mode-hook 'my-buffer-menu-hook)
(add-hook 'dired-mode-hook 'my-buffer-menu-hook)
(add-hook 'bookmark-bmenu-mode-hook 'my-buffer-menu-hook)


;; disable auto searching for files unless called explicitly
(setq ido-auto-merge-delay-time 99999)

(define-key ido-file-dir-completion-map (kbd "C-c C-s") 
  (lambda () 
    (interactive)
    (ido-initiate-auto-merge (current-buffer))))

;; TODO; disable h in ido-buffer etc.
;; 2013-05-27 Monday 13:08:07
;; ****************************************************************
;; ido-minor-mode settings
(add-hook 'ido-minibuffer-setup-hook 'ido-my-keys)
(defun ido-my-keys ()
  "My Keybindings for ido
especially for extending ido-find-file functionality
2013-08-04 Sunday 17:25:03"
  (define-key ido-completion-map (kbd "<return>") 'ido-exit-minibuffer) ;; for find-file
  (define-key ido-completion-map (kbd "RET") 'ido-magic-open)
  (define-key ido-completion-map (kbd "C-M-<return>") 'ido-sudo-open))

(defun ido-magic-open ()
  "This should be used when ido-minibuffer is active"
  (interactive)
  ;;   (let ((i (length ido-text)))
  ;;     (while (> i 0)
  ;;       (push (aref ido-text (setq i (1- i))) unread-command-events)))
  (setq ido-exit 'fallback)
  (setq ido-fallback-function
        '(lambda () (interactive)
           (let ((dir ido-current-directory)
                 (file (car ido-matches)))
             (extern (concat dir file)))))
  (exit-minibuffer))


(defun ido-sudo-open ()
  "Sudo open this buffer 2013-11-23 Saturday 15:44:04 by scinart"
  (interactive)
  (setq ido-exit 'fallback)
  (setq ido-fallback-function
        '(lambda () (interactive)
           (let ((dir ido-current-directory)
                 (file (car ido-matches)))
             (find-file (concat "/sudo::" dir file)))))
  (exit-minibuffer))



(provide 'my-ido)





;; Local Variables:
;; eval:(progn (hs-minor-mode t) (let ((hs-state '((990 990 nil) (1028 1028 nil) (1102 1102 nil) (1117 1117 nil) (1180 1180 nil) (1198 1198 nil) (1230 1230 nil) (1274 1274 nil) (1319 1319 nil) (1399 1399 nil) (1420 1420 nil) (1421 1421 nil) (1451 1451 nil) (1456 1456 nil) (1487 1487 nil) (1542 1542 nil) (1591 1591 nil) (1649 1649 nil) (1650 1650 nil) (1651 1651 nil) (1712 1712 nil) (1751 1751 nil) (1752 1752 nil) (1752 1753 nil) (1809 1809 nil) (1823 1823 nil) (1841 1841 nil) (1888 1889 nil) (1890 1890 nil) (1891 1891 nil) (1929 1929 nil) (1959 1959 nil) (1960 1960 nil) (1961 1961 nil))) (the-mark 'scinartspecialmarku2npbmfydfnwzwnpywxnyxjr)) (dolist (i hs-state) (if (not (null (caddr i))) (progn (goto-char (car i)) (hs-find-block-beginning) (hs-hide-block-at-point nil nil))))) (goto-char 1889) (recenter-top-bottom))
;; End:
