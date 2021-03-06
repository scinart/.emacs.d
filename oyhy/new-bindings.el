;;; -*- coding:utf-8 -*-
;;; new-bindings.el ---
;;; Time-stamp: <2019-12-08 11:22:17 scinart>
;;; Code:

;;; aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
;;; glabol unset key
(when t
  "glabol unset key"
  (global-unset-key (kbd "C-h h")) ; view-hello-file
  (global-unset-key (kbd "C-x i"))
  (global-unset-key (kbd "C-x m")) ;; post mail
  (global-unset-key (kbd "C-h C-h")); help-for-help
  (global-unset-key (kbd "M-c")) ;use as a prefix arg
  (global-unset-key (kbd "C-h C-c")) ; describe-copying
  (global-unset-key (kbd "C-/"))
  (global-unset-key (kbd "C-z"))
  (global-unset-key (kbd "C-x C-z")) ;; suspend-frame
  (global-unset-key (kbd "C-\\"))
  (global-set-key (kbd "M-m") 'ignore) ;; for dictionaries
  (global-set-key (kbd "C-x C-g") 'ignore) ;; I often use C-g to cancel C-x
  (global-unset-key (kbd "<f3>"))
  (global-unset-key (kbd "<f2>"))) ;; for dired mode rename.

;;; aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
;;; bookmarks and registers
(when t
  "registers"
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
;; (global-set-key (kbd "M-/") 'semantic-ia-complete-symbol-menu)
(global-set-key (kbd "C-/") 'hippie-expand)
(global-set-key (kbd "C-\\") 'yas-expand)
;; insert
(global-set-key (kbd "C-x i r") 'insert-register)
(global-set-key (kbd "M-c M-d") 'today)
(global-set-key (kbd "M-c M-t") 'now)
(global-set-key (kbd "M-c q") 'qdnt)
(global-set-key (kbd "M-c d") 'today)
(global-set-key (kbd "M-c M-q") 'push-time)

;;; eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
;;; buffer edit mark copy kill and file
(global-set-key (kbd "M-w") 'kill-ring-save)
(global-set-key (kbd "M-z") 'zap-almost-to-char)
(global-set-key (kbd "M-Z") 'delete-almost-to-char)
(global-set-key (kbd "M-@") 'mark-word)
(global-set-key (kbd "M-c m p") 'mark-paragraph)
(global-set-key (kbd "C-x h") 'mark-or-copy-whole-buffer)
(global-set-key (kbd "C-x C-x") 'exchange-point-and-mark)
(global-set-key (kbd "C-x C-@") 'pop-global-mark)
(global-set-key (kbd "C-x C-#") 'server-edit);same as C-x #
(global-set-key (kbd "C-c C-r") 'not-modified)
(global-set-key (kbd "M-c M-r") 'not-modified)
(global-set-key (kbd "C-S-y") 'yank-primary)
;;; eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
;;; buffer edit word lines region
(when t
  "edit word lines region"
  (global-set-key (kbd "S-<backspace>") 'subword-backward-kill)
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
  (global-set-key (kbd "M-c M-SPC") 'sci-change-to-symbol)

  (global-set-key (kbd "C-t") 'transpose-chars)
  (global-set-key (kbd "C-S-t") '(lambda () (interactive) (transpose-chars -1)))
  (global-set-key (kbd "M-t") 'transpose-words)
  (global-set-key (kbd "M-T") '(lambda () (interactive) (transpose-words -1)))
  (global-set-key (kbd "C-M-t") (lambda () (interactive) (transpose-sexps 1)))
  (global-set-key (kbd "C-M-S-t") (lambda () (interactive) (transpose-sexps -1)))

  (global-set-key (kbd "C-x C-l") 'downcase-region)
  (global-set-key (kbd "C-x C-u") 'upcase-region)
  (global-set-key (kbd "C-x C-t") 'transpose-lines)
  (global-set-key (kbd "C-w") 'delete-region-unless-prefix)

  (global-set-key (kbd "M-=") 'count-words-region)
  (global-set-key (kbd "M-c M-+") 'continuous-num/++)
  (global-set-key (kbd "M-c M--") 'continuous-num/--))

;;; aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
;;; buffer view cursor move
(when t
  "move cursor functions"
  (global-set-key (kbd "M-a") 'backward-sentence)
  (global-set-key (kbd "M-b") 'backward-word)
  (global-set-key (kbd "M-e") 'forward-sentence)
  (global-set-key (kbd "M-f") 'forward-word)
  (global-set-key (kbd "M-v") 'scroll-down-command)
  (global-set-key (kbd "M-<") 'beginning-of-buffer)
  (global-set-key (kbd "M->") 'end-of-buffer)
  (global-set-key (kbd "M-{") 'backward-paragraph)
  (global-set-key (kbd "M-}") 'forward-paragraph)
  (global-set-key (kbd "C-a") 'move-beginning-of-line)
  (global-set-key (kbd "C-b") 'backward-or-to-char)
  (global-set-key (kbd "C-e") 'move-end-of-line)
  (global-set-key (kbd "C-f") 'forward-or-to-char)
  (global-set-key (kbd "C-v") 'scroll-up-command)
  (global-set-key (kbd "C-x C-s") 'save-buffer-enhanced)
  (global-set-key (kbd "C-x C-n") 'set-goal-column)
  (global-set-key (kbd "C-M-v") 'scroll-other-window)
  (global-set-key (kbd "C-M-S-v") 'scroll-other-window-down)

  (global-set-key (kbd "C-n") 'next-line)
  (global-set-key (kbd "C-p") 'previous-line)
  (global-set-key (kbd "C-S-n") (lambda () (interactive) (ignore-errors (next-line 5))))
  (global-set-key (kbd "C-S-p") (lambda () (interactive) (ignore-errors (next-line -5))))
  (global-set-key (kbd "C-c C-n") 'continuous-drift-down)
  (global-set-key (kbd "C-c C-p") 'continuous-drift-up)
  (global-set-key (kbd "M-c M-n") 'continuous-drift-down/5)
  (global-set-key (kbd "M-c M-p") 'continuous-drift-up/5)
  (global-set-key (kbd "M-p") '(lambda () (interactive) (scroll-up -1)))
  (global-set-key (kbd "M-n") '(lambda () (interactive) (scroll-up 1)))
  (global-set-key (kbd "M-P") (lambda () (interactive) (ignore-errors (scroll-down 5))))
  (global-set-key (kbd "M-N") (lambda () (interactive) (ignore-errors (scroll-up 5))))

  (global-set-key (kbd "M-.") 'find-tag) ;; extremely useful
  (global-set-key (kbd "C-M-g") 'ace-jump-mode)
  (global-set-key (kbd "M-g") 'goto-line-or-char))

;;; eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
;; multiple cursors
(global-set-key (kbd "s-.") 'mc/mark-next-like-this)
(global-set-key (kbd "s-,") 'mc/mark-previous-like-this)
(global-set-key (kbd "s-;") 'mc/mark-all-like-this)
;; super key is not working in console mode.
(global-set-key (kbd "C-c .") 'mc/mark-next-like-this)
(global-set-key (kbd "C-c ,") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c ;") 'mc/mark-all-like-this)
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
       (global-set-key (kbd "<mouse-2>") 'mouse-yank-primary)
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
(global-set-key (kbd "C-x C-c") 'my-exit)
(global-set-key (kbd "C-x <return> o") 'open-this-buffer-in-explorer)
(global-set-key (kbd "C-x <return> t") 'open-this-buffer-folder-in-terminal)
(global-set-key (kbd "M-x") 'smex)

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
       (global-set-key (kbd "C-x C-M-.") 'full-screen)
       (global-set-key (kbd "C-x C-M-,") 'full-screen)
       (global-set-key (kbd "C-x C-M-f") 'right-half)
       (global-set-key (kbd "C-x C-M-e") 'right-half)
       (global-set-key (kbd "C-x C-M-b") 'left-half)
       (global-set-key (kbd "C-x C-M-a") 'left-half)
       (global-set-key (kbd "C-x C-M-n") 'down-half)
       (global-set-key (kbd "C-x C-M-o") 'down-half)
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
  (global-set-key (kbd "C-;") 'smart-backward-window)
  (global-set-key (kbd "C-:") 'smart-forward-window)
  (global-set-key (kbd "C-,") 'next-buffer)
  (global-set-key (kbd "C-<") 'previous-buffer)

  ;; (global-set-key (kbd "C-;") 'tabbar-forward-tab)
  ;; (global-set-key (kbd "C-:") 'tabbar-backward-tab)
  ;; (global-set-key (kbd "C-<tab>") 'tabbar-forward-group)
  ;; (global-set-key (kbd "<C-S-iso-lefttab>") 'tabbar-backward-group)

  (global-set-key (kbd "C-x o") '(lambda () (interactive) (smart-other-window 1)))
  (global-set-key (kbd "C-x O") '(lambda () (interactive) (smart-other-window -1)))
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

;; base64 stuff
(global-set-key (kbd "C-c C-,") 'my-base64-encode-region)
(global-set-key (kbd "C-c C-.") 'my-base64-decode-region)

;; very useful bindings

(global-set-key (kbd "C-x C-r") 'read-only-mode)
(global-set-key (kbd "C-x M-w") 'write-file)
(global-set-key (kbd "M-c M-c") 'comment-or-uncomment-region)
(global-set-key (kbd "M-j") (lambda () (interactive) (join-line) (indent-for-tab-command)))
(global-set-key (kbd "M-k") 'sci-copy-line)
(global-set-key (kbd "M-c f r") 'set-file-read-only)
(global-set-key (kbd "M-c k p") 'temporarily-bind-prog)

(global-set-key (kbd "<f3> <f3>") 'kmacro-start-macro-or-insert-counter)
(global-set-key (kbd "C-k") 'kill-line)
(global-set-key (kbd "C-c M-l") 'toggle-truncate-lines)
(global-set-key (kbd "C-c M-r") 'recursive-edit)

(global-set-key (kbd "C-<return>") 'up-list)
(global-set-key (kbd "M-<return>") 'company-complete)

;; coding systems
(global-set-key (kbd "C-x C-m s") 'set-buffer-file-coding-system)
(global-set-key (kbd "C-x <return> s") 'set-buffer-file-coding-system)
(global-set-key (kbd "C-x C-m f") 'revert-buffer-with-utf-8)
(global-set-key (kbd "C-x <return> f") 'revert-buffer-with-utf-8)
(global-set-key (kbd "C-x C-m r") 'revert-buffer-with-chinese-gbk)
(global-set-key (kbd "C-x <return> r") 'revert-buffer-with-chinese-gbk)
(global-set-key (kbd "C-x C-m R")
		'(lambda () (interactive) (let ((coding-system buffer-file-coding-system))
				       (revert-buffer "from-original-file" "no confirm" "preserve mode"))))
(global-set-key (kbd "C-x <return> R")
		'(lambda () (interactive) (let ((coding-system buffer-file-coding-system))
				       (revert-buffer "from-original-file" "no confirm" "preserve mode"))))

(global-set-key (kbd "C-x <return> u") 'ucs-insert)
(global-set-key (kbd "C-x <return> w") 'wdired-change-to-wdired-mode)

(global-set-key (kbd "<f2> <f2>") 'wdired-change-to-wdired-mode)
(global-set-key (kbd "C-M-_") 'undo)
(global-set-key (kbd "C-_") 'undo)

(global-set-key (kbd "C-c d") 'delete-indentation)
;; (global-set-key (kbd "C-x C-b") 'my-ibuffer)
;; I mistype C-x C-s to C-x C-b C-s so often that I decide to change this.
(global-unset-key (kbd "C-x C-b"))
(global-set-key (kbd "C-x C-S-b") 'my-ibuffer)
(global-set-key (kbd "C-x C-b C-b") 'my-ibuffer)
(global-set-key (kbd "C-x C-b C-s") 'save-buffer-enhanced)
(global-set-key (kbd "C-x u") 'undo)
(global-set-key (kbd "C-c C-/") 'opaque)
(global-set-key (kbd "M-c p o") '(lambda () (interactive) (message "%s" (point))))
(global-set-key (kbd "C-S-f") '(lambda () (interactive) (ignore-errors (forward-char 5))))
(global-set-key (kbd "C-S-b") '(lambda () (interactive) (ignore-errors (backward-char 5))))
(global-set-key (kbd "C-S-x") 'helm-M-x)


;;; aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
;; Custom Shortcuts ends here

(provide 'new-bindings)
