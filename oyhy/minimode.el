;;; minimode.el ---

;;; Code:

;; public
;; "~/.emacs.d/oyhy/
(add-hook 'before-save-hook 'time-stamp)
(global-linum-mode t)
(global-visual-line-mode t)
(show-paren-mode t)
;; Turn off mouse interface early in startup to avoid momentary display
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
;; (if (fboundp 'tabbar-mode) (tabbar-mode))

;; text-scale-mode
(setq text-scale-mode-step 1.1)
(column-number-mode 1)
;; (setq desktop-dirname             "~/.emacs.d/desktop/"
;;       desktop-base-file-name      "emacs.desktop"
;;       desktop-base-lock-name      "lock"
;;       desktop-path                (list desktop-dirname)
;;       desktop-save                t
;;       desktop-files-not-to-save   "^$" ;reload tramp paths
;;       desktop-load-locked-desktop nil)
(sci-mode)
;; encrypt
(epa-file-enable)
;; whitespace-mode
(setq whitespace-style '(face trailing tabs lines-tail newline tab-mark))
(setq whitespace-line-column 120)

;; hippie-expand
(setq hippie-expand-try-functions-list
      '(try-complete-file-name-partially
        try-complete-file-name
        try-expand-dabbrev
        try-expand-dabbrev-all-buffers
        try-expand-dabbrev-from-kill))

(provide 'minimode)


;;; minimode.el ends here
