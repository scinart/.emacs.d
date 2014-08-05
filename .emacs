(defun package--read-archive-file (file)
  "Re-read archive file FILE, if it exists.
Will return the data from the file, or nil if the file does not exist.
Will throw an error if the archive version is too new."
  (let ((filename (expand-file-name file package-user-dir)))
    (when (file-exists-p filename)
      (with-temp-buffer
	(insert-file-contents filename)
	(let ((contents (read (current-buffer))))
	  (if (> (car contents) package-archive-version)
	      (error "Package archive version %d is higher than %d"
		     (car contents) package-archive-version))
	  (cdr contents))))))

(package-initialize)
(setq package-enable-at-startup nil)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(bmkp-last-as-first-bookmark-file "~/.emacs.d/bookmarks")
 '(enable-local-eval t)
 '(enable-recursive-minibuffers t)
 '(inhibit-startup-screen t)
 '(large-file-warning-threshold 1048576)
 '(major-mode (quote text-mode))
 '(recenter-positions (quote (middle top bottom)))
 '(safe-local-variable-values (quote ((encoding . utf-8))))
 '(session-use-package t nil (session))
 '(template-default-directories (quote ("~/.emacs.d/.templates/")))
 '(truncate-lines t))

(setq user-full-name "Scinart O")
(setq user-mail-address "akubeej@gmail.com")

;; (setq shell-file-name "zsh")

(setq load-path (cons "~/.emacs.d/oyhy" load-path))
(add-to-list 'load-path "~/.emacs.d/configs")
(add-to-list 'load-path "~/.emacs.d/purcell/lisp")

;; cross platforms settings
(defvar monitor-width (display-pixel-width) "requires.el 2013-05-18 Saturday 16:36:57")
(defvar monitor-height (display-pixel-height) "requires.el 2013-05-18 Saturday 16:36:59")

(defvar windows-p (string-match "windows" (symbol-name system-type)))
(defvar macosx-p (string-match "darwin" (symbol-name system-type)))
(defvar linux-p (string-match "linux" (symbol-name system-type)))
(defvar user-home (concat (expand-file-name "~") "/"))

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")
			 ))

(setq default-cursor-type 'box)
(setq cursor-in-non-selected-windows 'hollow)

;;  (setq url-proxy-services '(("http"  . "127.0.0.1:8087")
;;                             ("https" . "127.0.0.1:8087")))

(setq initial-scratch-message
      (format "%s%s\n%s" ";; Now is "
              (format-time-string "%x %A %T")
              ";; And Happy Hacking\n\n"))

;; This makes emacs works better when marking large regions
(setq select-active-regions 'only)

(setq x-select-enable-clipboard t)
(setq kill-ring-max 200)
(setq visible-bell nil)

(setq split-height-threshold nil)
(setq split-width-threshold 100)

(setq window-min-height 10)
(setq window-min-width 20)

(setq margin 2)
(setq scroll-conservatively 10000)
(setq recentf-max-menu-items 50)
(setq recentf-max-saved-items 600)
(setq backup-directory-alist '(("." . "~/.emacs.d/backup-files")))
(setq version-control t)
(setq kept-old-versions 2)
(setq kept-new-versions 5)
(setq delete-old-versions t)
(setq echo-keystrokes -1)
(setq backup-by-copying t)
(setq make-backup-files nil)
(setq time-stamp-pattern "8/[Tt]ime-?stamp:[ \t]+\\\\?[\"<]+%:y-%02m-%02d %02H:%02M:%02S %u\\\\?[\">]")

;; ***************************************************************************
;; coding settings
(setq default-buffer-file-coding-system 'utf-8-unix)
(prefer-coding-system 'utf-8-unix)
(set-language-environment 'UTF-8)
(set-locale-environment "UTF-8")

;; ****************************************************************
;; Abbrev-mode settings
(setq default-abbrev-mode t)
(setq abbrev-file-name "~/.emacs.d/abbrev_defs")
(setq save-abbrevs t)
(quietly-read-abbrev-file)




(eval-when-compile
  (require 'cl))

;; default
(require 'ibuffer)
(require 'inf-lisp)
(require 'flyspell)
(require 'ispell)
(require 'recentf)
(require 'tramp)
(require 'epa)
(epa-file-enable)
(recentf-mode 1)
(global-subword-mode)


;; ELPA
;; (require 'slime)
(require 'ace-jump-mode)
(require 'auto-complete)
(require 'bookmark+)
(require 'browse-kill-ring)
(require 'buffer-move)
(require 'cedet)
(require 'company)
(require 'desktop)
(require 'dired+)
(require 'eldoc-extension)
(require 'key-chord)
(require 'fuzzy)
(require 'git-gutter)
(require 'git-gutter-fringe)
(require 'multiple-cursors)
(require 'pos-tip)
(require 'paredit)
(require 'yasnippet)
(require 'on-screen)
(require 'session)
(require 'rainbow-delimiters)
(when (display-graphic-p) (require 'pretty-mode-plus))
(require 'smart-compile)
(require 'smex)
(require 'semantic)
(require 'multi-term)
(require 'inf-ruby)
(require 'ruby-end)
(require 'ruby-mode)
(require 'ruby-electric)
(require 'w3m)
(require 'yari)
(require 'yaml-mode)
(require 'anything)
(require 'keyfreq)


;; (require 'mwe-log-commands)
;; mwe:log-keyboard-commands
;; mwe:open-command-log-buffer

(keyfreq-mode 1)
(keyfreq-autosave-mode 1)

(setq multi-term-program "/bin/zsh")

(browse-kill-ring-default-keybindings)
(company-mode)
;; (auto-complete-mode)
(global-git-gutter-mode)
(global-rainbow-delimiters-mode)
(key-chord-mode 1)
(paredit-mode 1)
(on-screen-global-mode 1)
(yas/global-mode 1)
(add-hook 'after-init-hook 'session-initialize)
(when (display-graphic-p) (global-pretty-mode 1))


;; configs
(require 'sci-math-symbol)
(require 'template)
(template-initialize)
(require 'make-regexp)
(require 'flex-mode)
(require 'bison-mode)
(require 'gas-mode)
(require 'psilord-lisp-colors)
(require 'mwe-color-box)
;; (require 'cambridge-permute)
;; M-x mwe:cambridge-permute-buffer

;; purcell's
(require 'purcell-adapt) ;; oyhy/purcell-adapt.el
(require 'init-hippie-expand)
(require 'init-utils)


;; oyhy
(require 'hs-minor-mode-enhancement)
(require 'my-alpha)
(require 'my-time)
(require 'defuns)
(require 'enabled-commands)
(require 'my-server)
(require 'my-ido)
(require 'my-org)
(require 'my-scheme)
(require 'my-color-theme)
(require 'my-ruby)
(require 'my-common-lisp)
(require 'gas-config)
(require 'new-bindings)
(require 'minimode)
(require 'minor-mode)
(require 'major-mode)
(require 'my-smart-compile)
(require 'emacs-lisp-color)
(require 'enabled-commands)


(require 'scheme-mode-color)


;; load-file
(load-file "~/.emacs.d/oyhy/redefun.el")
(if (display-graphic-p)
    (load-file "~/.emacs.d/oyhy/my-font.el"))

;; major-modes
(require 'emacs-lisp-config)
(require 'cc-config)


;; personal-startup-settings
;; ***************************************************************************
;; set the title of the frame.
;; (setq frame-title-format (list "emacs " emacs-version " " (getenv "username") " 十年磨一剑" (format-time-string " %b %e, %y %h:%m:%s")))
(frame-alpha-set-all '(90 45))
(full-screen)



;; Local Variables:
;; eval:(progn (hs-minor-mode t) (let ((hs-state '((41 589 hs))) (the-mark 'scinartspecialmarku2npbmfydfnwzwnpywxnyxjr)) (dolist (i hs-state) (if (car i) (progn (goto-char (car i)) (hs-find-block-beginning) (hs-hide-block-at-point nil nil))))) (goto-char 6333) (recenter-top-bottom))
;; End:
