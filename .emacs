(package-initialize)
(setq package-enable-at-startup nil)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(bmkp-last-as-first-bookmark-file "~/.emacs.d/bookmarks")
 '(dired-listing-switches "-alk")
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

;; cross platforms settings
(defvar monitor-width (display-pixel-width) "requires.el 2013-05-18 Saturday 16:36:57")
(defvar monitor-height (display-pixel-height) "requires.el 2013-05-18 Saturday 16:36:59")

(defvar windows-p (string-match "windows" (symbol-name system-type)))
(defvar macosx-p (string-match "darwin" (symbol-name system-type)))
(defvar linux-p (string-match "linux" (symbol-name system-type)))
(defvar user-home (concat (expand-file-name "~") "/"))

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

(setq default-cursor-type 'box)
(setq cursor-in-non-selected-windows 'hollow)

;;  (setq url-proxy-services '(("http"  . "127.0.0.1:8087")
;;                             ("https" . "127.0.0.1:8087")))

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
(setq recentf-max-saved-items 200)

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
(require 'recentf)
(require 'tramp)
(require 'epa)
(epa-file-enable)
(recentf-mode 1)
(setq recentf-max-menu-items 50)

;; ELPA
(require 'ace-jump-mode)
(require 'auto-complete)
(require 'bookmark+)
(require 'browse-kill-ring)
(require 'buffer-move)
(require 'desktop)
(require 'dired+)
(require 'eldoc-extension)
(require 'key-chord)
(require 'fuzzy)
(require 'multiple-cursors)
(require 'pos-tip)
(require 'paredit)
(require 'yasnippet)
(require 'session)
(require 'pretty-mode-plus)
(require 'smart-compile)
(require 'smex)
(require 'multi-term)
(setq multi-term-program "/bin/zsh")


(auto-complete-mode)
(key-chord-mode 1)
(paredit-mode 1)
(yas/global-mode 1)
(add-hook 'after-init-hook 'session-initialize)
(global-pretty-mode 1)


;; configs
(require 'sci-math-symbol)
(require 'template)
(require 'make-regexp)
(require 'flex-mode)
(require 'bison-mode)
(require 'gas-mode)
(require 'init-hippie-expand)
(template-initialize)

;; oyhy

(require 'my-alpha)
(require 'my-time)
(require 'defuns)
(require 'enabled-commands)
(require 'my-server)
(require 'my-ido)
(require 'my-org)
(require 'my-color-theme)
(require 'gas-config)
(require 'new-bindings)
(require 'minimode)
;; not require minor-mode
(require 'major-mode)
(require 'my-smart-compile)
(require 'emacs-lisp-color)
(require 'enabled-commands)
(require 'hs-minor-mode-enhancement)
(require 'scheme-config)
(require 'scheme-mode-color)


;; load-file
(load-file "~/.emacs.d/oyhy/redefun.el")
(load-file "~/.emacs.d/oyhy/my-font.el")

;; major-modes
(require 'emacs-lisp-config)
(require 'common-lisp-config)
(require 'c++-config)


;; personal-startup-settings
;; ***************************************************************************
;; set the title of the frame.
(setq frame-title-format (list "emacs " emacs-version " " (getenv "username") " 十年磨一剑" (format-time-string " %b %e, %y %h:%m:%s")))
(frame-alpha-set-all '(90 45))
(right-half)


;; ****************************************************************
;; paredit-things.
(defun my-paredit-mode-hook ()
  "My hook for paredit modes"
  ;; eat right
  (define-key paredit-mode-map (kbd "C-<right>") 'paredit-forward-slurp-sexp)
  ;; eat left
  (define-key paredit-mode-map (kbd "C-<left>") 'paredit-backward-slurp-sexp)
  ;; vomit right
  (define-key paredit-mode-map (kbd "C-M-<left>") 'paredit-backward-barf-sexp)
  ;; vomit left
  (define-key paredit-mode-map (kbd "C-M-<right>") 'paredit-forward-barf-sexp)
  ;; be eaten backwards
  (define-key paredit-mode-map (kbd "C-M-S-<left>") 'paredit-backward-be-slurped-sexp)
  (define-key paredit-mode-map (kbd "C-<backspace>") 'paredit-backward-kill-word)
  (define-key paredit-mode-map (kbd "M-<backspace>") 'paredit-backward-kill-sexp)
  (define-key paredit-mode-map (kbd "C-(") 'my-paredit-backward-slurp-sexp)
  (define-key paredit-mode-map (kbd "C-)") 'my-paredit-forward-slurp-sexp)
  (define-key paredit-mode-map (kbd "C-M-(") 'paredit-backward-barf-sexp)
  (define-key paredit-mode-map (kbd "C-M-)") 'paredit-forward-barf-sexp))

(add-hook 'paredit-mode-hook 'my-paredit-mode-hook)

;; ****************************************************************
;; hs-mode sittings

(defun my-hs-mode-hook ()
  "My hook for hs-minor-mode
   redefun some keybindings, C-c C-@ C-c for example"
                                        ;  (hs-minor-mode)
  (interactive)
  (define-key hs-minor-mode-map (kbd "C-c @ C-h") nil)
  (define-key hs-minor-mode-map (kbd "C-c C-SPC C-c") 'hs-toggle-hiding)
  (define-key hs-minor-mode-map (kbd "C-c C-SPC C-h") 'hs-hide-block)
  (define-key hs-minor-mode-map (kbd "C-c C-SPC C-l") 'hs-hide-level)
  (define-key hs-minor-mode-map (kbd "C-c C-SPC C-s") 'hs-show-block)
  (define-key hs-minor-mode-map (kbd "C-c C-SPC C-SPC") 'hs-show-block)
  (define-key hs-minor-mode-map (kbd "C-c C-SPC C-M-h") 'hs-hide-all)
  (define-key hs-minor-mode-map (kbd "C-c C-SPC C-M-s") 'hs-show-all)
  (define-key hs-minor-mode-map (kbd "C-c C-SPC C-S-h") 'hs-hide-all)
  (define-key hs-minor-mode-map (kbd "C-c C-SPC C-S-s") 'hs-show-all))
(add-hook 'hs-minor-mode-hook 'my-hs-mode-hook)


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


(if (y-or-n-p "start tlp?")
    (async-shell-command "sudo tlp ac"))


;; Local Variables:
;; eval:(progn (hs-minor-mode t) (let ((hs-state 'nil) (the-mark 'scinartspecialmarku2npbmfydfnwzwnpywxnyxjr)) (dolist (i hs-state) (if (car i) (progn (goto-char (car i)) (hs-find-block-beginning) (hs-hide-block-at-point nil nil))))) (goto-char 4010) (recenter-top-bottom))
;; End:
