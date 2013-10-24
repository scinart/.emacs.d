;;; requires.el ---

;;; Code:


;; public
;; "~/.emacs.d/configs/

;; environments
(defvar site-lisp "d:/pro/emacs24.1/site-lisp/")
(defvar load-path-to-add (list "~/.emacs.d/configs"
			       "~/.emacs.d/configs/bookmark+"
			       "~/.emacs.d/configs/zone"
			       "~/.emacs.d/configs/w3m-lisp/" "~/.emacs.d/configs/multiple-cursors-master"
			       ))
(defvar monitor-width 1366 "defun.el 2013-05-18 Saturday 16:36:57")
(defvar monitor-height 768 "defun.el 2013-05-18 Saturday 16:36:59")
;;(defvar monitor-width 1920 "defun.el 2013-05-18 Saturday 16:36:57")
;;(defvar monitor-height 1080 "defun.el 2013-05-18 Saturday 16:36:59")

(add-to-list 'exec-path "~/.emacs.d/extra-bin/")
(add-to-list 'exec-path "~/.emacs.d/extra-bin/w3m")
(add-to-list 'exec-path "~/.emacs.d/extra-bin/Aspell/bin")


(setq org-agenda-files (list "d:/My Document/todo.org"))
(setq tramp-auto-save-directory "D:\\swap\\temp")
(setq tramp-default-method "plink")
(setq load-path (append load-path load-path-to-add))
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

;; (setenv "http_proxy" "127.0.0.1:8087")
;; (setenv "https_proxy" "127.0.0.1:8087")
(setq default-cursor-type 'box)
(setq url-proxy-services '(("http"  . "127.0.0.1:8087")
                            ("https" . "127.0.0.1:8087")))
(setq initial-scratch-message
      (format "%s%s\n%s" ";; Now is "
	      (format-time-string "%x %A %T")
	      ";; And Happy Hacking\n\n"))

(setq x-select-enable-clipboard t)
(setq kill-ring-max 200)
(setq visible-bell t)

(setq split-height-threshold nil)
(setq split-width-threshold 100)

(setq window-min-height 10)
(setq window-min-width 20)

(setq margin 2)
(setq scroll-conservatively 10000)
(setq backup-directory-alist '(("." . "~/.emacs.d/backup-files")))
(setq version-control t)
(setq kept-old-versions 2)
(setq kept-new-versions 5)
(setq delete-old-versions t)
(setq backup-by-copying t)
(setq make-backup-files nil)
(setq recentf-max-saved-items 60) ; or what ever you want

;; ***************************************************************************
;; coding settings
(setq default-buffer-file-coding-system 'utf-8-unix)
(prefer-coding-system 'utf-8-unix)

(set-language-environment 'Chinese-gbk)
(set-language-environment 'UTF-8)
(set-locale-environment "UTF-8") 

(eval-when-compile
  (require 'cl))
(require 'epa)
(require 'smart-compile+)
(require 'auto-complete)
(require 'auto-complete-config)
(require 'auto-complete-clang)
(require 'dired+)
(require 'dired-details+)
(require 'ibuffer)
(require 'desktop)
(require 'popup)
(require 'inf-lisp)
(require 'key-chord) (key-chord-mode 1)
(require 'lispbox)
(require 'inf-ruby)
(require 'multiple-cursors)
(require 'fuzzy)
(require 'pos-tip)
(require 'flex-mode)
(require 'bison-mode)
(require 'w3m-load)
(require 'init-w3m)
;; (c-mode)
;; (require 'bison-mode)
;; (lisp-interaction-mode)


(require 'zone-settings)
(require 'tramp)
(require 'everything) (setq everything-cmd "D:/pro/everything/es.exe")
(require 'session) (add-hook 'after-init-hook 'session-initialize)
(require 'smooth-scroll)
(require 'yasnippet)
(require 'xmsi-math-symbols-input)
(require 'pretty-mode-plus) (global-pretty-mode 1)

;; (require 'browse-kill-ring)
(browse-kill-ring-default-keybindings) ; set M-y to Browse Kill Ring
;; Awesome
;; 2013-04-30 Tuesday 22:20:06 by Scinart

;; Mine
;; "~/.emacs.d/oyhy/
(provide 'requires)



;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################





;;; requires.el ends here





;; Local Variables:
;; eval:(progn (hs-minor-mode t) (let ((hs-state 'nil) (the-mark 'scinartspecialmarku2npbmfydfnwzwnpywxnyxjr)) (dolist (i hs-state) (if (car i) (progn (goto-char (car i)) (hs-find-block-beginning) (hs-hide-block-at-point nil nil))))) (goto-char 3081) (recenter-top-bottom))
;; End:
