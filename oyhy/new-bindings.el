;;; -*- coding:utf-8 -*-
;;; new-bindings.el ---
;;; Time-stamp: <2013-11-19 23:42:05 scinart>
;;; Code:

(cond
 ((string-equal system-type "windows-nt") ; Microsoft Windows
  (setq w32-pass-lwindow-to-system nil
	w32-pass-apps-to-system nil
	w32-lwindow-modifier 'super
	;; w32-apps-modifier 'super
	))
 ((string-equal system-type "darwin")   ; Mac OS X
  (progn
    (message "Mac OS X")))
 ((string-equal system-type "gnu/linux") ; linux
  (define-key key-translation-map (kbd "<menu>") (kbd "<apps>"))
  )
 )

;;; aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
;;; glabol unset key
(progn "glabol unset key"
       (global-unset-key (kbd "C-h h")) ; view-hello-file
       (global-unset-key (kbd "C-x i"))
       (global-unset-key (kbd "C-x m")) ;; post mail
       (global-unset-key (kbd "C-h C-h")); help-for-help
       (global-unset-key (kbd "M-c")) ;use as a prefix arg
       (global-unset-key (kbd "C-h C-c")) ; describe-copying
       (global-unset-key (kbd "C-/"))
       (global-unset-key (kbd "C-z"))
       (global-unset-key (kbd "C-<space>"))
       (global-unset-key (kbd "C-\\"))
       (global-unset-key (kbd "<f3>")))

;;; aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
;;; bookmarks  and registers
(progn "registers" 
       (set-register ?i '(file . "~/.emacs"))
       (set-register ?e '(file . "~/.emacs.d/emacs-note.org"))
       (set-register ?o '(file . "~/.emacs.d/oyhy"))
       (set-register ?u '(file . "~/.emacs.d/emacs-shortcuts.org"))
       (set-register ?m '(file . "~/.emacs.d/.mc-lists.el"))
       (set-register ?b '(file . "~/.emacs.d/oyhy/new-bindings.el"))

       (global-set-key (kbd "C-x r p") 'sci-push-register)
       (global-set-key (kbd "C-x r j") 'jump-to-register)
       (global-set-key (kbd "C-x r v") 'view-register)
       (global-set-key (kbd "C-x r +") 'increment-register)
       (global-set-key (kbd "C-x r i") 'insert-register)
       (global-set-key (kbd "C-x r n") 'number-to-register)
       (global-set-key (kbd "C-x r r") 'copy-rectangle-to-register)
       (global-set-key (kbd "C-x r s") 'copy-to-register)
       )

(progn "defaule rectangle bindings"
       (global-set-key (kbd "C-x r k") 'kill-rectangle)
       (global-set-key (kbd "C-x r c") 'clear-rectangle)
       (global-set-key (kbd "C-x r d") 'delete-rectangle)
       (global-set-key (kbd "C-x r t") 'string-rectangle)
       (global-set-key (kbd "C-x r y") 'yank-rectangle))

(global-set-key (kbd "C-x M-r") 'recentf-open-files)
(global-set-key (kbd "C-x C-M-r") 'recentf-open-files)
(global-set-key (kbd "C-x r b") 'find-bookmark+-file)
(global-set-key (kbd "C-x r l") 'bookmark-bmenu-list)

(global-set-key (kbd "C-x r m") 'bookmark-set)

;;; aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
;;; buffer edit expand and insert
(global-set-key (kbd "M-/") 'dabbrev-expand)
(global-set-key (kbd "C-/") 'hippie-expand)
;; insert
(global-set-key (kbd "C-x i f") 'ido-insert-file)
(global-set-key (kbd "C-x i c") 'atob)
(global-set-key (kbd "C-x i r") 'insert-register)
(global-set-key (kbd "M-c M-d") 'today)
(global-set-key (kbd "M-c M-t") 'now)
(global-set-key (kbd "M-c q") 'qdnt)
(global-set-key (kbd "M-c M-q") 'push-time)
(global-set-key (kbd "M-c M-x") 'Meta-x)



;;; eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
;;; buffer edit mark copy kill and file
(global-set-key (kbd "M-w") 'kill-ring-save)
(global-set-key (kbd "M-z") 'zap-almost-to-char)
(global-set-key (kbd "M-Z") 'delete-almost-to-char)
(global-set-key (kbd "M-@") 'mark-word)
(global-set-key (kbd "M-c m p") 'mark-paragraph)
(global-set-key (kbd "C-x h") 'mark-whole-buffer)
(global-set-key (kbd "C-x C-x") 'exchange-point-and-mark)
(global-set-key (kbd "C-x C-@") 'pop-global-mark)
(global-set-key (kbd "C-x C-#") 'server-edit);same as C-x #
(global-set-key (kbd "C-c C-r") 'not-modified)
(global-set-key (kbd "M-c M-r") 'not-modified)
;;; eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
;;; buffer edit word lines region
(progn "edit word lines region"
       (global-set-key (kbd "M-l") 'downcase-word)
       (global-set-key (kbd "M-t") 'transpose-words)
       (global-set-key (kbd "M-u") 'upcase-word)
       (global-set-key (kbd "M-$") 'ispell-word)
       (global-set-key (kbd "C-x M-c") 'capitalize-word)
       (global-set-key (kbd "M-c SPC") 'capitalize-word)
       (global-set-key (kbd "M-c c") 'continuous-capitalize-word)
       (global-set-key (kbd "M-c l") 'continuous-downcase-word)
       (global-set-key (kbd "M-c u") 'continuous-upcase-word)
       (global-set-key (kbd "M-h") 'my-flyspell-auto-correct-word)
       (global-set-key (kbd "M-H") 'flyspell-auto-correct-word)
       (global-set-key (kbd "M-%") 'query-replace)
       (global-set-key (kbd "M-c M-%") 'replace-regexp)
       (global-set-key (kbd "M-c M-&") 'replace-string)
       (global-set-key (kbd "M-c M-SPC") 'xmsi-change-to-symbol)

       (global-set-key (kbd "C-t") 'transpose-chars)
       (global-set-key (kbd "C-S-t") '(lambda () (interactive) (transpose-chars -1)))
       (global-set-key (kbd "M-t") 'transpose-words)
       (global-set-key (kbd "M-T") '(lambda () (interactive) (transpose-words -1)))
       (global-set-key (kbd "C-M-t") (lambda () (interactive) (transpose-sexps 1)))
       (global-set-key (kbd "C-M-S-t") (lambda () (interactive) (transpose-sexps -1)))

       (global-set-key (kbd "C-x C-l") 'downcase-region)
       (global-set-key (kbd "C-x C-u") 'upcase-region)
       (global-set-key (kbd "C-x C-t") 'transpose-lines))
;;; eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
;;; buffer statistics
(global-set-key (kbd "M-=") 'count-words-region)
(global-set-key (kbd "M-c n i") 'continuous-num/++)
(global-set-key (kbd "M-c n d") 'continuous-num/--)
(global-set-key (kbd "M-c n +") 'continuous-num/++)
(global-set-key (kbd "M-c n -") 'continuous-num/--)
(global-set-key (kbd "M-c M-+") 'continuous-num/++)
(global-set-key (kbd "M-c M--") 'continuous-num/--)
;;; aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
;;; buffer view cursor move
(progn "move cursor functions"
       (global-set-key (kbd "M-a") 'backward-sentence)
       (global-set-key (kbd "M-b") 'backward-word)
       (global-set-key (kbd "M-e") 'forward-sentence)
       (global-set-key (kbd "M-f") 'forward-word)
       (global-set-key (kbd "M-v") 'scroll-down-command)
       (global-set-key (kbd "M-<") 'beginning-of-buffer)
       (global-set-key (kbd "M->") 'end-of-buffer)
       (global-set-key (kbd "M-{") 'backward-paragraph)
       (global-set-key (kbd "M-}") 'forward-paragraph)
       (global-set-key (kbd "C-a") '(lambda () (interactive)
				      (if visual-line-mode
					  (beginning-of-visual-line)
					(beginning-of-line))))
       (global-set-key (kbd "C-b") 'backward-or-to-char)
       (global-set-key (kbd "C-e") '(lambda () (interactive) 
				      (if visual-line-mode
					  (end-of-visual-line)
					(end-of-line))))
       (global-set-key (kbd "C-f") 'forward-or-to-char)
       (global-set-key (kbd "C-n") 'next-line)
       (global-set-key (kbd "C-p") 'previous-line)
       ;; define this in case I occasionally press '.' insteand of p
       (global-set-key (kbd "C-.") 'previous-line)
       (global-set-key (kbd "C-v") 'scroll-up-command)
       (global-set-key (kbd "C-x C-s") 'save-buffer)
       (global-set-key (kbd "C-x C-n") 'set-goal-column)
       (global-set-key (kbd "C-M-v") 'scroll-other-window)
       (global-set-key (kbd "C-M-S-v") 'scroll-other-window-down)
       (global-set-key (kbd "C-<apps>") '(lambda () "bindings.el" (interactive) (forward-line)))
       (global-set-key (kbd "<down>") '(lambda () "bindings.el" (interactive) (forward-line)))
       (global-set-key (kbd "C-c C-n") 'half-screen-down)
       (global-set-key (kbd "C-c C-p") 'half-screen-up)
       (global-set-key (kbd "M-c M-n") 'half-screen-down)
       (global-set-key (kbd "M-c M-h") 'half-screen-up)
       (global-set-key (kbd "C-c C-S-h") 'half-screen-up)
       (global-set-key (kbd "C-c C-h") 'half-screen-up)
       (global-set-key (kbd "C-c C-S-n") 'half-screen-down)
       (global-set-key (kbd "C-S-n") (lambda () (interactive) (ignore-errors (next-line 5))))
       (global-set-key (kbd "C-S-p") (lambda () (interactive) (ignore-errors (previous-line 5))))
       (global-set-key (kbd "C-S-f") (lambda () (interactive) (ignore-errors (forward-char 5))))
       (global-set-key (kbd "C-S-b") (lambda () (interactive) (ignore-errors (backward-char 5))))
       (global-set-key (kbd "M-p") (lambda (&optional n) (interactive "p") (scroll-down (or n 1))))
       (global-set-key (kbd "M-n") (lambda (&optional n) (interactive "p") (scroll-up (or n 1))))
       (global-set-key (kbd "M-P") (lambda () (interactive) (ignore-errors (scroll-down 5))))
       (global-set-key (kbd "M-N") (lambda () (interactive) (ignore-errors (scroll-up 5))))
       (global-set-key (kbd "C-c SPC") 'ace-jump-mode)
       (global-set-key (kbd "C-M-g") 'ace-jump-mode)
       (global-set-key (kbd "M-g") 'goto-line-or-char))

;;; eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
;; multiple cursors
(global-set-key (kbd "s-.") 'mc/mark-next-like-this)
(global-set-key (kbd "s-,") 'mc/mark-previous-like-this)
(global-set-key (kbd "s-;") 'mc/mark-all-like-this)
(global-set-key (kbd "C-s-SPC") 'set-rectangular-region-anchor)
(global-set-key (kbd "C-s-;") 'mc/edit-lines)

;;; eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
;;; buffer view narrow
(global-set-key (kbd "C-x n d") 'narrow-to-defun)
(global-set-key (kbd "C-x n n") 'narrow-to-region)
(global-set-key (kbd "C-x n w") 'widen)

;;; eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
;;; buffer view text scale
(progn "text scale"
       (global-set-key (kbd "M-c +") '(lambda () (interactive) (text-scale-adjust 1)))
       (global-set-key (kbd "M-c -") '(lambda () (interactive) (text-scale-adjust -1)))
       (global-set-key (kbd "C-<kp-add>") 'text-scale-increase)
       (global-set-key (kbd "C-<kp-subtract>") 'text-scale-decrease)
       (global-set-key (kbd "C-<kp-0>") '(lambda () (interactive)
					   (text-scale-adjust (- text-scale-mode-amount))
					   (text-scale-mode -1)))
       (global-set-key (kbd "C-<wheel-up>") 'text-scale-increase)
       (global-set-key (kbd "C-<wheel-down>") 'text-scale-decrease)
       (global-set-key (kbd "<mouse-2>") '(lambda () (interactive)
					    (copy-region-as-kill (region-beginning) (region-end))))
       (global-set-key (kbd "M-c 0") '(lambda () (interactive)
					(text-scale-adjust (- text-scale-mode-amount))
					(text-scale-mode -1))))

;;; aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
;; frame command
(global-set-key (kbd "M-&") 'async-shell-command)
(global-set-key (kbd "C-x C-z") 'suspend-frame)
(global-set-key (kbd "C-x z") 'repeat)
(global-set-key (kbd "C-x Z") 'repeat-complex-command)
(global-set-key (kbd "C-x 5 2") 'make-frame-command)
(global-set-key (kbd "C-s-l") 'screensaver)
(global-set-key (kbd "s-'") 'start-button)
(global-set-key (kbd "C-x C-c") 'my-exit)
(global-set-key (kbd "C-x <return> o") 'open-this-buffer-in-explorer)
(global-set-key (kbd "C-x C-<return> o") 'open-this-buffer-in-explorer)
;; fresh frame title
(global-set-key (kbd "C-c M-q") 'refresh-title)

(progn "window position and frame alpha"
       ;; set window position
       (global-set-key (kbd "M-<up>") 'full-screen)
       (global-set-key (kbd "M-<right>") 'right-half)
       (global-set-key (kbd "M-<left>") 'left-half)
       (global-set-key (kbd "M-<down>") 'down-half)
       (global-set-key (kbd "C-x M-<up>") 'full-screen)
       (global-set-key (kbd "C-x M-<right>") 'right-half)
       (global-set-key (kbd "C-x M-<left>") 'left-half)
       (global-set-key (kbd "C-x M-<down>") 'down-half)
       (global-set-key (kbd "C-x C-M-p") 'full-screen)
       (global-set-key (kbd "C-x C-M-f") 'right-half)
       (global-set-key (kbd "C-x C-M-b") 'left-half)
       (global-set-key (kbd "C-x C-M-n") 'down-half)
       (global-set-key (kbd "C-h C-c") 'full-screen)

       (global-set-key (kbd "M-c w t") 'transparent)
       (global-set-key (kbd "M-c w p") 'peek)
       (global-set-key (kbd "M-c w o") 'opaque)
       
       (global-set-key (kbd "M-c ;") 'continuous-frame-alpha-all-increase)
       (global-set-key (kbd "M-c :") 'continuous-frame-alpha-all-decrease)
       (global-set-key (kbd "M-c ,") 'continuous-frame-alpha-active-increase)
       (global-set-key (kbd "M-c <") 'continuous-frame-alpha-active-decrease)
       (global-set-key (kbd "M-c .") 'continuous-frame-alpha-inactive-increase)
       (global-set-key (kbd "M-c >") 'continuous-frame-alpha-inactive-decrease))

;;; eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
;;; frame related function

;; color theme
(global-set-key (kbd "C-#") 'switch-skin-forword)
(global-set-key (kbd "C-`") 'switch-skin-backward)
(global-set-key (kbd "C-M-#") '(lambda () (interactive) (switch-skin-all 1)))
(global-set-key (kbd "C-M-`") '(lambda () (interactive) (switch-skin-all -1)))

(global-set-key (kbd "M-c !") 'continuous-forward-cycle-font)
(global-set-key (kbd "M-c 8") 'continuous-backward-cycle-font)

;;; eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
;;; frame windows and buffer
(progn "All kinds of window and buffer functions"
  (global-set-key (kbd "C-x +") 'balance-windows)
  (global-set-key (kbd "C-x -") 'shrink-window-if-larger-than-buffer)
  (global-set-key (kbd "C-x 0") 'delete-window)
  (global-set-key (kbd "C-x 1") 'delete-other-windows)
  (global-set-key (kbd "C-x 2") 'split-window-vertically)
  (global-set-key (kbd "C-x 3") 'split-window-horizontally)
  (global-set-key (kbd "C-x k") 'kill-current-buffer)
  (global-set-key (kbd "C-x w") 'smart-delete-window)
  (global-set-key (kbd "C-x C-w") 'smart-kill-buffer)
  (global-set-key (kbd "C-x C-S-w") 'kill-buffer-and-window)
  (global-set-key (kbd "C-h C-w") 'bury-buffer)
  (global-set-key (kbd "M-<f4>") 'smart-close-window)
  (global-set-key (kbd "C-x <C-left>") 'previous-buffer)
  (global-set-key (kbd "C-x <C-right>") 'next-buffer)
  (global-set-key (kbd "C-x <left>") 'previous-buffer)
  (global-set-key (kbd "C-x <right>") 'next-buffer)
  (global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
  (global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
  (global-set-key (kbd "S-C-<down>") 'shrink-window)
  (global-set-key (kbd "S-C-<up>") 'enlarge-window)
  (global-set-key (kbd "C-x M-f") 'windmove-right)
  (global-set-key (kbd "C-x M-b") 'windmove-left)
  (global-set-key (kbd "C-x M-p") 'windmove-up)
  (global-set-key (kbd "C-x M-n") 'windmove-down)
  (global-set-key (kbd "C-;") '(lambda () (interactive) (smart-other-window 1)))
  (global-set-key (kbd "C-:") '(lambda () (interactive) (smart-other-window -1)))
  (global-set-key (kbd "C-x o") '(lambda () (interactive) (smart-other-window 1)))
  (global-set-key (kbd "C-x O") '(lambda () (interactive) (smart-other-window -1)))
  (global-set-key (kbd "C-M-;") 'tabbar-backward-group)
  (global-set-key (kbd "C-M-:") 'tabbar-forward-group)
  (global-set-key (kbd "C-S-<tab>") 'tabbar-backward-tab)
  (global-set-key (kbd "C-<tab>") 'tabbar-forward-tab)
  (global-set-key (kbd "M-c b b") 'buf-move-left)
  (global-set-key (kbd "M-c b f") 'buf-move-right)
  (global-set-key (kbd "M-c b p") 'buf-move-up)
  (global-set-key (kbd "M-c b n") 'buf-move-down)
  (global-set-key (kbd "M-c b s") 'create-scratch)
  (global-set-key (kbd "M-c b r") 'rename-buffer) 
  (global-set-key (kbd "C-c C-m") 'switch-to-minibuffer-window))

;;; aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
;;; MISCELLARIES

;; smart compile
(global-set-key (kbd "C-<f7>") 'smart-compile)
(global-set-key (kbd "<f7>") 'smart-run)
(global-set-key (kbd "C-<f5>") 'smart-execute)
;; base64 stuff
(global-set-key (kbd "C-c C-,") 'my-base64-encode-region)
(global-set-key (kbd "C-c C-.") 'my-base64-decode-region)

;; very useful bindings

(global-set-key (kbd "C-x C-r") 'toggle-read-only)
(global-set-key (kbd "C-x M-w") 'write-file)
(global-set-key (kbd "M-c M-c") 'comment-or-uncomment-region)
(global-set-key (kbd "M-j") (lambda () (interactive) (join-line) (indent-for-tab-command)))
(global-set-key (kbd "M-k") 'sci-copy-line)
(global-set-key (kbd "M-c f r") 'set-file-read-only)
(global-set-key (kbd "M-c r") 'set-file-read-only)
(global-set-key (kbd "M-c C-r") 'set-file-read-only)
(global-set-key (kbd "M-c k p") 'temporarily-bind-prog)

(global-set-key (kbd "<f3> <f3>") 'kmacro-start-macro-or-insert-counter)
(global-set-key (kbd "C-c C-k") 'kill-whole-line)
(global-set-key (kbd "C-c M-l") 'toggle-truncate-lines)
(global-set-key (kbd "C-c M-r") 'recursive-edit)
(global-set-key (kbd "C-x <return> r") 'revert-buffer-with-coding-system)
(global-set-key (kbd "C-x <return> R") '(lambda () (interactive) (revert-buffer t t t)))
(global-set-key (kbd "C-x C-<return> r") 'revert-buffer-with-coding-system)
(global-set-key (kbd "C-x C-<return> R") '(lambda () (interactive) (revert-buffer t t t)))
(global-set-key (kbd "C-x <return> u") 'ucs-insert)
(global-set-key (kbd "C-x <return> w") 'wdired-change-to-wdired-mode)
(global-set-key (kbd "M-<return>") 'newline-and-indent)

(global-set-key (kbd "C-<f2>") 'wdired-change-to-wdired-mode)
(global-set-key (kbd "C-M-_") 'undo)
(global-set-key (kbd "C-_") 'undo)

(global-set-key (kbd "C-c d") 'delete-indentation)
(global-set-key (kbd "C-x C-b") 'my-ibuffer)
(global-set-key (kbd "C-x u") 'undo)
(global-set-key (kbd "C-c C-/") 'opaque)
(global-set-key (kbd "M-c p o") '(lambda () (interactive) (message "%s" (point))))


;;; aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
;; Custom Shortcuts ends here
;; (global-unset-key (kbd "<apps> f"))
(progn "<apps>"
  (global-set-key (kbd "<apps> a c") 'auto-complete-mode)
  (global-set-key (kbd "<apps> b") 'ignore)
  (global-set-key (kbd "<apps> c") 'ignore)
  (global-set-key (kbd "<apps> d") 'ignore)
  (global-set-key (kbd "<apps> f a") 'frame-alpha-get)
  (global-set-key (kbd "<apps> e") 'ignore)
  (global-set-key (kbd "<apps> g") 'ignore)
  (global-set-key (kbd "<apps> h l") 'hl-line-mode)
  (global-set-key (kbd "<apps> h s") 'hs-minor-mode)
  (global-set-key (kbd "<apps> i") 'ignore)
  (global-set-key (kbd "<apps> j") 'ignore)
  (global-set-key (kbd "<apps> k") 'ignore)
  (global-set-key (kbd "<apps> l") 'linum-mode)
  (global-set-key (kbd "<apps> m a p c") 'minimap-create)
  (global-set-key (kbd "<apps> m a p k") 'minimap-kill)
  (global-set-key (kbd "<apps> m e n u") 'toggle-menu-bar-mode-from-frame)
  (global-set-key (kbd "<apps> m c") 'minimap-create)
  (global-set-key (kbd "<apps> m k") 'minimap-kill)
  (global-set-key (kbd "<apps> n") 'ignore)
  (global-set-key (kbd "<apps> o") 'ignore)
  (global-set-key (kbd "<apps> p") 'paredit-mode)
  (global-set-key (kbd "<apps> q") 'ignore)
  (global-set-key (kbd "<apps> r") 'ignore)
  (global-set-key (kbd "<apps> s c r") 'toggle-scroll-bar)
  (global-set-key (kbd "<apps> s i t e") 'google-site-ishare)
  (global-set-key (kbd "<apps> t") 'tabbar-mode)
  (global-set-key (kbd "<apps> u") 'ignore)
  (global-set-key (kbd "<apps> v") 'visual-line-mode)
  (global-set-key (kbd "<apps> w") 'ignore)
  (global-set-key (kbd "<apps> x") 'ignore)
  (global-set-key (kbd "<apps> y") 'ignore)
  (global-set-key (kbd "<apps> z") 'ignore)

  (global-set-key (kbd "<scroll> a") 'ignore)
  (fset 'copy-sexp "\200\367")
  (global-set-key (kbd "M-c M-@") 'copy-sexp)
  (global-set-key (kbd "C-h C-k") 'command-keys))

(provide 'new-bindings)
;; Local Variables:
;; eval:(progn (hs-minor-mode t) (let ((hs-state 'nil) (the-mark 'scinartspecialmarku2npbmfydfnwzwnpywxnyxjr)) (dolist (i hs-state) (if (car i) (progn (goto-char (car i)) (hs-find-block-beginning) (hs-hide-block-at-point nil nil))))) (goto-char 13873) (recenter-top-bottom))
;; End:
