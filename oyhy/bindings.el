;;; -*- coding:utf-8 -*-
;;; bindings.el ---
;;; Time-stamp: <2013-06-16 16:38:26 scinart>
;;; Code:

;; C-x command means modified by me;
;;(glo.... 'command) means by default and not used by me.
;;#(glo... 'command) means by default and is considered to be used.
;;#&(glo... 'command) means by default and is modified slightly and used.


(setq w32-pass-lwindow-to-system nil
      w32-pass-apps-to-system nil
      w32-lwindow-modifier 'hyper
      ;; w32-apps-modifier 'super
      )

;;     【❖ Win+a】 ∅
;;     【❖ Win+b】 Put focus on Notification Area.
;;     【❖ Win+c】 ∅
;;     【❖ Win+d】 Toggle show desktop.
;;     【❖ Win+e】 Windows Explorer (view desktop)
;;     【❖ Win+f】 Windows Search.
;;     【❖ Win+g】 Desktop gadgets.
;;     【❖ Win+h】 ∅
;;     【❖ Win+i】 ∅
;;     【❖ Win+j】 ∅
;;     【❖ Win+k】 ∅
;;     【❖ Win+l】 Lock desktop.
;;     【❖ Win+m】 Minimize all windows.
;;     【❖ Win+n】 ∅
;;     【❖ Win+o】 ∅
;;     【❖ Win+p】 display and projector toggle.
;;     【❖ Win+q】 ∅
;;     【❖ Win+r】 Run dialog.
;;     【❖ Win+s】 ∅
;;     【❖ Win+t】 Put focus on the Taskbar
;;     【❖ Win+u】 Ease of Access
;;     【❖ Win+v】 ∅
;;     【❖ Win+w】 ∅
;;     【❖ Win+x】 Windows Mobility Center.
;;     【❖ Win+y】 ∅
;;     【❖ Win+z】 ∅
;; (w32-registered-hot-keys)
;; (w32-reconstruct-hot-key)

;; default key bindings
;; default M-? oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
(global-set-key (kbd "M-a") 'backward-sentence)
(global-set-key (kbd "M-b") 'backward-word)
(global-set-key (kbd "M-e") 'forward-sentence)
(global-set-key (kbd "M-f") 'forward-word)
(global-set-key (kbd "M-l") 'downcase-word)
(global-set-key (kbd "M-t") 'transpose-words)
(global-set-key (kbd "M-u") 'upcase-word)
(global-set-key (kbd "M-v") 'scroll-down-command)
(global-set-key (kbd "M-w") 'kill-ring-save)
;;(global-set-key (kbd "M-x") 'execute-extended-command)
;;##(global-set-key (kbd "M-z") 'zap-to-char)
(global-set-key (kbd "M-z") 'zap-almost-to-char)
(global-set-key (kbd "M-Z") 'delete-almost-to-char)
;; ;,.:<>/@\?^|-_'"
;;(global-set-key (kbd "M-,") 'tags-loop-continue)
;;(global-set-key (kbd "M-.") 'find-tag)
;;(global-set-key (kbd "M-;") 'comment-dwim)
;;(global-set-key (kbd "M-:") 'eval-expression)
(global-set-key (kbd "M-<") 'beginning-of-buffer)
(global-set-key (kbd "M->") 'end-of-buffer)
;;(global-set-key (kbd "M-/") 'dabbrev-expand)
(global-set-key (kbd "M-@") 'mark-word)
;;(global-set-key (kbd "M-\\") 'delete-horizontal-space)
;;(global-set-key (kbd "M-^") 'delete-indentation)
;;(global-set-key (kbd "M-|") 'shell-command-on-region)
;;(global-set-key (kbd "M--") 'negative-argument)
;;(global-set-key (kbd "M-'") 'abbrev-prefix-mark)
;;(global-set-key (kbd "M-$") 'ispell-word)
(global-set-key (kbd "M-&") 'async-shell-command)
;;(global-set-key (kbd "M-{") 'backward-paragraph)
;;(global-set-key (kbd "M-}") 'forward-paragraph)
;;(global-set-key (kbd "M-(") 'insert-parentheses)
(global-set-key (kbd "M-=") 'count-words-region)
;;(global-set-key (kbd "M-*") 'pop-tag-mark)
;;(global-set-key (kbd "M-)") move-past-close-and-reindent)
;;#(global-set-key (kbd "M-!") 'shell-command)
;;#(global-set-key (kbd "M-~") 'not-modified)
(global-set-key (kbd "M-%") 'query-replace)
;;(global-set-key (kbd "M-`") 'tmm-menubar)

;; default C-? oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
(global-set-key (kbd "C-f") 'forward-char)
(global-set-key (kbd "C-b") 'backward-char)
(global-set-key (kbd "C-n") 'next-line)
(global-set-key (kbd "C-p") 'previous-line)
(global-set-key (kbd "C-a") 'beginning-of-visual-line)
(global-set-key (kbd "C-e") 'end-of-visual-line)
(global-set-key (kbd "C-v") 'scroll-up-command)


;; C-x prefix command oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
;; C-x C-b ido-list-buffers
;; C-x C-d ido-list-directory
(global-set-key (kbd "C-x C-e") 'eval-last-sexp)
;; C-x C-f ido-find-file
;;(global-set-key (kbd "C-x TAB") 'indent-rigidly)
(global-set-key (kbd "C-x C-l") 'downcase-region)
(global-set-key (kbd "C-x C-n") 'set-goal-column)
;;(global-set-key (kbd "C-x C-o") 'delete-blank-lines)
;;(global-set-key (kbd "C-x C-p") 'mark-page)
;;(global-set-key (kbd "C-x C-q") 'toggle-read-only)
;; C-x C-r toggle-only
(global-set-key (kbd "C-x C-s") 'save-buffer)
(global-set-key (kbd "C-x C-t") 'transpose-lines)
(global-set-key (kbd "C-x C-u") 'upcase-region)
;; C-x C-v find-alternate-file
;; C-x C-w write-file
(global-set-key (kbd "C-x C-x") 'exchange-point-and-mark)
(global-set-key (kbd "C-x C-z") 'suspend-frame)
;;(global-set-key (kbd "C-x $") 'set-selective-display)
;;(global-set-key (kbd "C-x '") 'expand-abbrev)
;;(global-set-key (kbd "C-x (") 'kmacro-start-macro)
;;(global-set-key (kbd "C-x )") 'kmacro-end-macro)
;;(global-set-key (kbd "C-x *") 'calc-dispatch)
(global-set-key (kbd "C-x +") 'balance-windows)
(global-set-key (kbd "C-x -") 'shrink-window-if-larger-than-buffer)
;;(global-set-key (kbd "C-x .") 'set-fill-prefix)
(global-set-key (kbd "C-x 0") 'delete-window)
(global-set-key (kbd "C-x 1") 'delete-other-windows)
(global-set-key (kbd "C-x 2") 'split-window-vertically)
(global-set-key (kbd "C-x 3") 'split-window-horizontally)
;;#(global-set-key (kbd "C-x ;") 'comment-set-column)
;;#(global-set-key (kbd "C-x <") 'scroll-left)
;;#(global-set-key (kbd "C-x =") 'what-cursor-position)
;;#(global-set-key (kbd "C-x >") 'scroll-right)
;;#(global-set-key (kbd "C-x [") 'backward-page)
;;#(global-set-key (kbd "C-x ]") 'forward-page)
;;(global-set-key (kbd "C-x ^") 'enlarge-window)
;;(global-set-key (kbd "C-x `") 'next-error)


;;(global-set-key (kbd "C-x a C-a") 'add-mode-abbrev)
;;(global-set-key (kbd "C-x a '") 'expand-abbrev)
;;(global-set-key (kbd "C-x a +") 'add-mode-abbrev)
;;(global-set-key (kbd "C-x a -") 'inverse-add-global-abbrev)
;;(global-set-key (kbd "C-x a e") 'expand-abbrev)
(global-set-key (kbd "C-x a g") 'add-global-abbrev)
(global-set-key (kbd "C-x a i g") 'inverse-add-global-abbrev)
(global-set-key (kbd "C-x a i l") 'inverse-add-mode-abbrev)
(global-set-key (kbd "C-x a l") 'add-mode-abbrev)
;;(global-set-key (kbd "C-x a n") 'expand-jump-to-next-slot)
;;(global-set-key (kbd "C-x a p") 'expand-jump-to-previous-slot)
;; C-x b switch-to-buffer
;; C-x d dired
(global-set-key (kbd "C-x e") 'kmacro-end-and-call-macro)
;;#(global-set-key (kbd "C-x f") 'set-fill-column)
;; C-x g undefined
(global-set-key (kbd "C-x h") 'mark-whole-buffer)
;; C-x i insert-file
;; C-x k kill-buffer
;; C-x j undefined
;; C-x k kill-buffer
;;#(global-set-key (kbd "C-x l") 'count-lines-page)
;;(global-set-key (kbd "C-x m") 'compose-mail)
;;(global-set-key (kbd "C-x n d") 'narrow-to-defun)
;;(global-set-key (kbd "C-x n n") 'narrow-to-region)
;;(global-set-key (kbd "C-x n p") 'narrow-to-page)
;;(global-set-key (kbd "C-x n w") 'widen)
;; C-x o other-window
;; C-x p undefined
;;#(global-set-key (kbd "C-x q") 'kbd-macro-query)
;;#(global-set-key (kbd "C-x r C-@") 'point-to-register)
;;#(global-set-key (kbd "C-x r SPC") 'point-to-register)
(global-set-key (kbd "C-x r +") 'increment-register)
(global-set-key (kbd "C-x r c") 'clear-rectangle)
(global-set-key (kbd "C-x r d") 'delete-rectangle)
;; (global-set-key (kbd "C-x r f") 'frame-configuration-to-register)
;;(global-set-key (kbd "C-x r g") 'insert-register)
(global-set-key (kbd "C-x r i") 'insert-register)
(global-set-key (kbd "C-x r j") 'jump-to-register)
(global-set-key (kbd "C-x r k") 'kill-rectangle)
(global-set-key (kbd "C-x r l") 'bookmark-bmenu-list)
(global-set-key (kbd "C-x r m") 'bookmark-set)
(global-set-key (kbd "C-x r n") 'number-to-register)
;;(global-set-key (kbd "C-x r o") 'open-rectangle)
(global-set-key (kbd "C-x r r") 'copy-rectangle-to-register)
(global-set-key (kbd "C-x r s") 'copy-to-register)
(global-set-key (kbd "C-x r t") 'string-rectangle)
;;(global-set-key (kbd "C-x r w") 'window-configuration-to-register)
;;#(global-set-key (kbd "C-x r x") 'copy-to-register)
(global-set-key (kbd "C-x r y") 'yank-rectangle)
;;#(global-set-key (kbd "C-x r C-SPC") 'point-to-register)
;;(global-set-key (kbd "C-x s") 'save-some-buffers)
;;C-x t undefined
(global-set-key (kbd "C-x u") 'undo)
;;(global-set-key (kbd "C-x v +") 'vc-update)
;;(global-set-key (kbd "C-x v =") 'vc-diff)
;;(global-set-key (kbd "C-x v D") 'vc-root-diff)
;;(global-set-key (kbd "C-x v L") 'vc-print-root-log)
;;(global-set-key (kbd "C-x v a") 'vc-update-change-log)
;;(global-set-key (kbd "C-x v b") 'vc-switch-backend)
;;(global-set-key (kbd "C-x v c") 'vc-rollback)
;;(global-set-key (kbd "C-x v d") 'vc-dir)
;;(global-set-key (kbd "C-x v g") 'vc-annotate)
;;(global-set-key (kbd "C-x v h") 'vc-insert-headers)
;;(global-set-key (kbd "C-x v i") 'vc-register)
;;(global-set-key (kbd "C-x v l") 'vc-print-log)
;;(global-set-key (kbd "C-x v m") 'vc-merge)
;;(global-set-key (kbd "C-x v r") 'vc-retrieve-tag)
;;(global-set-key (kbd "C-x v s") 'vc-create-tag)
;;(global-set-key (kbd "C-x v u") 'vc-revert)
;;(global-set-key (kbd "C-x v v") 'vc-next-action)
;;(global-set-key (kbd "C-x v ~") 'vc-revision-other-window)
;; C-x w undefined
;; C-x x undefined
;; C-x y undefined
(global-set-key (kbd "C-x z") 'repeat)
;;(global-set-key (kbd "C-x {") 'shrink-window-horizontally)
;;(global-set-key (kbd "C-x }") 'enlarge-window-horizontally)
;;(global-set-key (kbd "C-x DEL") 'backward-kill-sentence)
;;(global-set-key (kbd "C-x C-SPC") 'pop-global-mark)
;;(global-set-key (kbd "C-x C-+") 'text-scale-adjust)
;;(global-set-key (kbd "C-x C--") 'text-scale-adjust)
;;(global-set-key (kbd "C-x C-0") 'text-scale-adjust)
;; C-x C-= text-scale-adjust
(global-set-key (kbd "C-x <C-left>") 'continuous-previous-buffer)
(global-set-key (kbd "C-x <C-right>") 'continuous-next-buffer)
(global-set-key (kbd "C-x <left>") 'previous-buffer)
(global-set-key (kbd "C-x <right>") 'next-buffer)
;;#(global-set-key (kbd "C-x C-k C-a") 'kmacro-add-counter)
;;#(global-set-key (kbd "C-x C-k C-c") 'kmacro-set-counter)
;;(global-set-key (kbd "C-x C-k C-d") 'kmacro-delete-ring-head)
;;(global-set-key (kbd "C-x C-k C-e") 'kmacro-edit-macro-repeat)
;;(global-set-key (kbd "C-x C-k C-f") 'kmacro-set-format)
;;#(global-set-key (kbd "C-x C-k TAB") 'kmacro-insert-counter)
;;(global-set-key (kbd "C-x C-k C-k") 'kmacro-end-or-call-macro-repeat)
;;(global-set-key (kbd "C-x C-k C-l") 'kmacro-call-ring-2nd-repeat)
;;(global-set-key (kbd "C-x C-k RET") 'kmacro-edit-macro)
;;(global-set-key (kbd "C-x C-k C-n") 'kmacro-cycle-ring-next)
;;(global-set-key (kbd "C-x C-k C-p") 'kmacro-cycle-ring-previous)
(global-unset-key (kbd "C-x C-k C-s"))
(global-set-key (kbd "C-x C-k s") 'kmacro-start-macro)
;;(global-set-key (kbd "C-x C-k C-t") 'kmacro-swap-ring)
;;(global-set-key (kbd "C-x C-k C-v") 'kmacro-view-macro-repeat)
;;(global-set-key (kbd "C-x C-k SPC") 'kmacro-step-edit-macro)
;;(global-set-key (kbd "C-x C-k b") 'kmacro-bind-to-key)
;;#(global-set-key (kbd "C-x C-k e") 'edit-kbd-macro)
;;(global-set-key (kbd "C-x C-k l") 'kmacro-edit-lossage)
;;#(global-set-key (kbd "C-x C-k n") 'kmacro-name-last-macro)
;;(global-set-key (kbd "C-x C-k q") 'kbd-macro-query)
;;(global-set-key (kbd "C-x C-k r") 'apply-macro-to-region-lines)
;;(global-set-key (kbd "C-x C-k s") 'kmacro-start-macro)
;; C-x RET C-\	set-input-method
;; C-x RET F	set-file-name-coding-system
;; C-x RET X	set-next-selection-coding-system
;; C-x RET c	universal-coding-system-argument
;; C-x RET f	set-buffer-file-coding-system
;; C-x RET k	set-keyboard-coding-system
;; C-x RET l	set-language-environment
;; C-x RET p	set-buffer-process-coding-system
;; C-x RET r	revert-buffer-with-coding-system
;; C-x RET t	set-terminal-coding-system
;; C-x RET x	set-selection-coding-system
;;(global-set-key (kbd "C-x ESC ESC") 'repeat-complex-command)
;;(global-set-key (kbd "C-x M-:") 'repeat-complex-command)
;;(global-set-key (kbd "C-x 4 C-f") 'find-file-other-window)
;;(global-set-key (kbd "C-x 4 C-o") 'display-buffer)
;;(global-set-key (kbd "C-x 4 .") 'find-tag-other-window)
;;(global-set-key (kbd "C-x 4 0") 'kill-buffer-and-window)
;;(global-set-key (kbd "C-x 4 a") 'add-change-log-entry-other-window)
;;(global-set-key (kbd "C-x 4 b") 'switch-to-buffer-other-window)
;;(global-set-key (kbd "C-x 4 c") 'clone-indirect-buffer-other-window)
;;(global-set-key (kbd "C-x 4 d") 'dired-other-window)
;;(global-set-key (kbd "C-x 4 f") 'find-file-other-window)
;;(global-set-key (kbd "C-x 4 m") 'compose-mail-other-window)
;;(global-set-key (kbd "C-x 4 r") 'find-file-read-only-other-window)
;;(global-set-key (kbd "C-x 5 C-f") 'find-file-other-frame)
;;(global-set-key (kbd "C-x 5 C-o") 'display-buffer-other-frame)
;;(global-set-key (kbd "C-x 5 .") 'find-tag-other-frame)
;;(global-set-key (kbd "C-x 5 0") 'delete-frame)
;;(global-set-key (kbd "C-x 5 1") 'delete-other-frames)
(global-set-key (kbd "C-x 5 2") 'make-frame-command)
;;(global-set-key (kbd "C-x 5 b") 'switch-to-buffer-other-frame)
;;(global-set-key (kbd "C-x 5 d") 'dired-other-frame)
;;(global-set-key (kbd "C-x 5 f") 'find-file-other-frame)
;;(global-set-key (kbd "C-x 5 m") 'compose-mail-other-frame)
;;(global-set-key (kbd "C-x 5 o") 'other-frame)
;;(global-set-key (kbd "C-x 5 r") 'find-file-read-only-other-frame)
;;(global-set-key (kbd "C-x 8 RET") 'ucs-insert)
;;(global-set-key (kbd "C-x @ S") 'event-apply-shift-modifier)
;;(global-set-key (kbd "C-x @ a") 'event-apply-alt-modifier)
;;(global-set-key (kbd "C-x @ c") 'event-apply-control-modifier)
;;(global-set-key (kbd "C-x @ h") 'event-apply-hyper-modifier)
;;(global-set-key (kbd "C-x @ m") 'event-apply-meta-modifier)
;;(global-set-key (kbd "C-x @ s") 'event-apply-super-modifier)
(global-set-key (kbd "C-x C-@") 'pop-global-mark)
;; C-c C-b help-go-back
;; C-c C-c help-follow-symbol
;; C-c C-f help-go-forward


(global-set-key (kbd "C-M-v") 'scroll-other-window)
(global-set-key (kbd "C-M-S-v") 'scroll-other-window-down)





;; global unset key
;; oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
(global-unset-key (kbd "C-h h")) ; view-hello-file
(global-unset-key (kbd "C-x i"))
(global-unset-key (kbd "C-h C-h")); help-for-help
(global-unset-key (kbd "M-c")) ;use as a prefix arg
(global-unset-key (kbd "C-h C-c")) ; describe-copying
(global-unset-key (kbd "C-/"))
(global-unset-key (kbd "C-z"))
(global-unset-key (kbd "C-<space>"))
(global-unset-key (kbd "C-\\")) ; bound to "lambda" at line 388 & 378 in lisp-y mode
(global-unset-key (kbd "<f3>"))

;; Bookmarks and registers
;; oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
;; use C-x r j -- register jump
(set-register ?i '(file . "~/.emacs.d/init.el"))
(set-register ?e '(file . "~/.emacs.d/emacs-note.org"))
(set-register ?o '(file . "~/.emacs.d/"))
(set-register ?a '(file . "D:/My Document/"))
(set-register ?u '(file . "~/.emacs.d/emacs-shortcuts.org"))
(set-register ?p '(file . "d:/pro/emacs-24.1/site-lisp/"))
(set-register ?y '(file . "d:/pro/emacs-24.1/bin"))
(set-register ?m '(file . "~/.emacs.d/.mc-lists.el"))

(global-set-key (kbd "C-x r p") 'sci-push-register)
(global-set-key (kbd "C-x <return> o") 'open-this-buffer-in-explorer)
(global-set-key (kbd "C-x M-r") 'recentf-open-files)
(global-set-key (kbd "C-x C-M-r") 'recentf-open-files)

;; programs
;; oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
(global-set-key (kbd "C-<f7>") 'smart-compile)
(global-set-key (kbd "<f7>") 'smart-run)
(global-set-key (kbd "C-<f5>") 'smart-execute)
(global-set-key (kbd "C-x C-c") '(lambda ()
				   "in bindings.el, ask for sure when you exit."
				   (interactive)
				   (if (yy-or-n-p "Are you sure to exit Emacs?")
				       (save-buffers-kill-terminal))))

(global-set-key (kbd "C-H-l") 'screensaver)
(global-set-key (kbd "H-'") 'start-button)

;; frame and window
;; oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
;; fresh frame title
(global-set-key (kbd "C-c M-q") 'refresh-title)

;; color theme
(global-set-key (kbd "C-#") '(lambda () (interactive) (switch-skin 1)))
(global-set-key (kbd "C-`") '(lambda () (interactive) (switch-skin -1)))
(global-set-key (kbd "C-M-#") '(lambda () (interactive) (switch-skin-all 1)))
(global-set-key (kbd "C-M-`") '(lambda () (interactive) (switch-skin-all -1)))

;; adjust window size and transparency
(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)
(global-set-key (kbd "M-c t r") 'perspective)
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
;; @override describe-copying
(global-set-key (kbd "C-h C-c") 'full-screen)

;; handle window
(global-set-key (kbd "C-x k") 'kill-current-buffer)
;; try delete window catch kill buffer
(global-set-key (kbd "C-x w") 'smart-delete-window)
;; kill buffer try delete window
(global-set-key (kbd "C-x C-w") 'smart-close-window)
(global-set-key (kbd "C-h C-w") 'smart-close-window)
(global-set-key (kbd "M-<f4>") 'smart-close-window)
(global-set-key (kbd "C-x C-#") 'server-edit);same as C-x #

;; move between window
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
;; move window
(global-set-key (kbd "M-c b b") 'buf-move-left)
(global-set-key (kbd "M-c b f") 'buf-move-right)
(global-set-key (kbd "M-c b p") 'buf-move-up)
(global-set-key (kbd "M-c b n") 'buf-move-down)
(global-set-key (kbd "M-c b s") 'create-scratch)
;; switch-to-minibuffer-window
(global-set-key (kbd "C-c C-m") 'switch-to-minibuffer-window)

;; register
;; oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
(global-set-key (kbd "C-x r v") 'view-register)
(global-set-key (kbd "C-x r b") 'find-bookmark+-file)
;; Editor view -- not change content
;; oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo

(global-set-key (kbd "M-c ;") 'continuous-frame-alpha-all-increase)
(global-set-key (kbd "M-c :") 'continuous-frame-alpha-all-decrease)
(global-set-key (kbd "M-c ,") 'continuous-frame-alpha-active-increase)
(global-set-key (kbd "M-c <") 'continuous-frame-alpha-active-decrease)
(global-set-key (kbd "M-c .") 'continuous-frame-alpha-inactive-increase)
(global-set-key (kbd "M-c >") 'continuous-frame-alpha-inactive-decrease)

(global-set-key (kbd "M-c !") 'continuous-forward-cycle-font)
(global-set-key (kbd "M-c 8") 'continuous-backward-cycle-font)


(global-set-key (kbd "C-<apps>") '(lambda () "bindings.el" (interactive) (forward-line)))
(global-set-key (kbd "<down>") '(lambda () "bindings.el" (interactive) (forward-line)))
(global-set-key (kbd "C-c C-r") 'not-modified)
;; move cursor
(global-set-key (kbd "C-f") 'forward-or-to-char)
(global-set-key (kbd "C-b") 'backward-or-to-char)
(global-set-key (kbd "C-c C-n") 'half-screen-down)
(global-set-key (kbd "C-c C-p") 'half-screen-up)(global-set-key (kbd "M-c M-n") 'half-screen-down)
(global-set-key (kbd "M-c M-h") 'half-screen-up)
(global-set-key (kbd "C-S-c C-S-h") 'half-screen-up)
(global-set-key (kbd "C-c C-S-h") 'half-screen-up)
(global-set-key (kbd "C-c C-h") 'half-screen-up)
(global-set-key (kbd "C-S-c C-S-n") 'half-screen-down)
(global-set-key (kbd "C-c C-S-n") 'half-screen-down)
(global-set-key (kbd "C-S-n") (lambda () (interactive) (ignore-errors (next-line 5))))
(global-set-key (kbd "C-S-p") (lambda () (interactive) (ignore-errors (previous-line 5))))
(global-set-key (kbd "C-S-f") (lambda () (interactive) (ignore-errors (forward-char 5))))
(global-set-key (kbd "C-S-b") (lambda () (interactive) (ignore-errors (backward-char 5))))
(global-set-key (kbd "M-p") (lambda (&optional n) (interactive "p") (scroll-down (or n 1))))
(global-set-key (kbd "M-n") (lambda (&optional n) (interactive "p") (scroll-up (or n 1))))
(global-set-key (kbd "M-P") (lambda () (interactive) (ignore-errors (scroll-down 5))))
(global-set-key (kbd "M-N") (lambda () (interactive) (ignore-errors (scroll-up 5))))
;; not so satisfing
;;(global-set-key (kbd "M-c f") 'jump-char-forward)
;;(global-set-key (kbd "M-c b") 'jump-char-backward)
(global-set-key (kbd "C-c SPC") 'ace-jump-mode)
(global-set-key (kbd "C-M-g") 'ace-jump-mode)
;; transpose
(global-set-key (kbd "C-t") 'transpose-chars)
(global-set-key (kbd "C-S-t") '(lambda () (interactive) (transpose-chars -1)))
(global-set-key (kbd "M-t") 'transpose-words)
(global-set-key (kbd "M-T") '(lambda () (interactive) (transpose-words -1)))
(global-set-key (kbd "C-M-t") (lambda () (interactive) (transpose-sexps 1)))
(global-set-key (kbd "C-M-S-t") (lambda () (interactive) (transpose-sexps -1)))

;; bindings text scale
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
				     (text-scale-adjust (- text-scale-mode-amount))
				     (text-scale-mode -1)))
(global-set-key (kbd "M-c 0") '(lambda () (interactive)
				 (text-scale-adjust (- text-scale-mode-amount))
				 (text-scale-mode -1)))

;; search
(global-set-key (kbd "C-s") 'isearch-forward)
;; (global-set-key (kbd "C-S-s") 'isearch-backward)

;; Editor Edit
;; oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
;; flyspell-correct
;; @override mark paragraph
(global-set-key (kbd "M-h") 'my-flyspell-auto-correct-word)
(global-set-key (kbd "M-H") 'flyspell-auto-correct-word)

;; replace
(global-set-key (kbd "M-c M-%") 'replace-regexp)
(global-set-key (kbd "M-c M-&") 'replace-string)
(global-set-key (kbd "M-c M-SPC") 'xmsi-change-to-symbol)
;; intent
(global-set-key (kbd "M-j") (lambda () (interactive) (join-line) (indent-for-tab-command)))
(global-set-key (kbd "M-<return>") 'newline-and-indent)
(global-set-key (kbd "C-c d") 'delete-indentation)
(global-set-key (kbd "M-c M-c") 'comment-or-uncomment-region)
(global-set-key (kbd "C-x M-c") 'capitalize-word)
(global-set-key (kbd "M-c SPC") 'capitalize-word)
(global-set-key (kbd "M-c c") 'continuous-capitalize-word)
(global-set-key (kbd "M-c l") 'continuous-downcase-word)
(global-set-key (kbd "M-c u") 'continuous-upcase-word)
(global-set-key (kbd "C-/") 'hippie-expand)

;; multiple cursors
(global-set-key (kbd "H-.") 'mc/mark-next-like-this)
(global-set-key (kbd "H-,") 'mc/mark-previous-like-this)
(global-set-key (kbd "H-;") 'mc/mark-all-like-this)
(global-set-key (kbd "C-H-SPC") 'set-rectangular-region-anchor)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
;; mark
(global-set-key (kbd "M-c m p") 'mark-paragraph)
;; insert
(global-set-key (kbd "C-x i f") 'ido-insert-file)
(global-set-key (kbd "C-x i c") 'atob)
(global-set-key (kbd "C-x i r") 'insert-register)
(global-set-key (kbd "M-c M-d") 'today)
(global-set-key (kbd "M-c M-t") 'now)
(global-set-key (kbd "M-c q") 'qdnt)
(global-set-key (kbd "M-c M-q") 'push-time)
(global-set-key (kbd "M-c d n t b s") 'dntbs)
(global-set-key (kbd "M-c M-x") 'Meta-x)
;; kmacro
(global-set-key (kbd "<f3> <f3>") 'kmacro-start-macro-or-insert-counter)
;; todo


;; miscellaries
;; lines
(global-set-key (kbd "C-c M-l") 'toggle-truncate-lines)
(global-set-key (kbd "M-g") 'goto-line-or-char)
(fset 'delete-line [C-S-backspace])
(global-set-key (kbd "C-c C-k") 'delete-line)
(global-set-key (kbd "M-k") 'sci-copy-line)

(global-set-key (kbd "C-c M-r") 'recursive-edit)
(global-set-key (kbd "C-x <return> w") 'wdired-change-to-wdired-mode)
(global-set-key (kbd "C-<f2>") 'wdired-change-to-wdired-mode)
(global-set-key (kbd "C-x <return> u") 'ucs-insert)
(global-set-key (kbd "C-x <return> r") 'revert-buffer-with-coding-system)
(global-set-key (kbd "C-x <return> f") 'set-buffer-file-coding-system)
(global-set-key (kbd "C-x C-<return> u") 'ucs-insert)
(global-set-key (kbd "C-x C-<return> r") 'revert-buffer-with-coding-system)
(global-set-key (kbd "C-x C-<return> f") 'set-buffer-file-coding-system)
(global-set-key (kbd "C-x C-r") 'toggle-read-only)
(global-set-key (kbd "M-c C-r") 'set-file-read-only)
(global-set-key (kbd "M-c f r") 'set-file-read-only)
(global-set-key (kbd "M-c r") 'set-file-read-only)
(global-set-key (kbd "C-x M-w") 'write-file)
(global-set-key (kbd "C-x u") 'undo)
(global-set-key (kbd "C-_") 'undo)
(global-set-key (kbd "C-M-_") 'undo)
(global-set-key (kbd "C-x C-b") 'my-ibuffer)

;; base-64 stuff
(global-set-key (kbd "C-c C-,") 'my-base64-encode-region)
(global-set-key (kbd "C-c C-.") 'my-base64-decode-region)

;; define this in case I occasionally press '.' insteand of p
(global-set-key (kbd "C-.") 'previous-line)


;; ********************************************************************************************************************************
;; Custom Shortcuts ends here
;; (global-unset-key (kbd "<apps> f"))
(global-set-key (kbd "<apps> a c") 'auto-complete-mode)
(global-set-key (kbd "<apps> b") 'empty-command)
(global-set-key (kbd "<apps> c") 'empty-command)
(global-set-key (kbd "<apps> d") 'empty-command)
(global-set-key (kbd "<apps> f a") 'frame-alpha-get)
(global-set-key (kbd "<apps> e") 'empty-command)
(global-set-key (kbd "<apps> g") 'empty-command)
(global-set-key (kbd "<apps> h l") 'hl-line-mode)
(global-set-key (kbd "<apps> h s") 'hs-minor-mode)
(global-set-key (kbd "<apps> i") 'empty-command)
(global-set-key (kbd "<apps> j") 'empty-command)
(global-set-key (kbd "<apps> k") 'empty-command)
(global-set-key (kbd "<apps> l") 'linum-mode)
(global-set-key (kbd "<apps> m a p c") 'minimap-create)
(global-set-key (kbd "<apps> m a p k") 'minimap-kill)
(global-set-key (kbd "<apps> m e n u") 'toggle-menu-bar-mode-from-frame)
(global-set-key (kbd "<apps> m c") 'minimap-create)
(global-set-key (kbd "<apps> m k") 'minimap-kill)
(global-set-key (kbd "<apps> n") 'empty-command)
(global-set-key (kbd "<apps> o") 'empty-command)
(global-set-key (kbd "<apps> p") 'paredit-mode)
(global-set-key (kbd "<apps> q") 'empty-command)
(global-set-key (kbd "<apps> r") 'empty-command)
(global-set-key (kbd "<apps> s c r") 'toggle-scroll-bar)
(global-set-key (kbd "<apps> s i t e") 'google-site-ishare)
(global-set-key (kbd "<apps> t") 'tabbar-mode)
(global-set-key (kbd "<apps> u") 'empty-command)
(global-set-key (kbd "<apps> v") 'visual-line-mode)
(global-set-key (kbd "<apps> w") 'empty-command)
(global-set-key (kbd "<apps> x") 'empty-command)
(global-set-key (kbd "<apps> y") 'empty-command)
(global-set-key (kbd "<apps> z") 'empty-command)

(global-set-key (kbd "<scroll> a") 'empty-command)

(fset 'copy-sexp
   "\200\367")
(global-set-key (kbd "M-c M-@") 'copy-sexp)
(global-set-key (kbd "C-h C-k") 'command-keys)
(defun empty-command ()
  "This is an empty command"
  (interactive)
  (message "empty-command"))


(provide 'bindings)

;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################





;;; bindings.el ends here





;; Local Variables:
;; eval:(progn (hs-minor-mode t) (let ((hs-state '((24574 24574 nil) (24647 24647 nil) (24655 24655 nil) (24656 24656 nil) (24657 24657 nil) (24673 24673 nil) (24682 24682 nil) (24738 24738 nil) (24786 24786 nil) (24822 24822 nil) (24868 24868 nil) (24912 24912 nil) (24913 24913 nil) (24962 24962 nil) (25032 25032 nil) (25094 25094 nil) (25146 25146 nil) (25220 25220 nil) (25291 25291 nil) (25345 25345 nil) (25421 25421 nil) (25494 25494 nil) (25494 25495 nil) (25543 25544 nil) (25545 25545 nil) (25598 25598 nil) (25651 25651 nil) (25702 25702 nil) (25747 25747 nil) (25784 25784 nil) (25819 25819 nil) (25856 25856 nil) (25901 25901 nil) (25902 25902 nil) (25919 25919 nil) (25977 25977 nil))) (the-mark 'scinartspecialmarku2npbmfydfnwzwnpywxnyxjr)) (dolist (i hs-state) (if (not (null (caddr i))) (progn (goto-char (car i)) (hs-find-block-beginning) (hs-hide-block-at-point nil nil))))) (goto-char 25494) (recenter-top-bottom))
;; End:
