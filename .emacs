;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; this paragraph initialize package before anything else
;; by default package is loaded after .emacs. It is too late.
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
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(bmkp-last-as-first-bookmark-file "~/.emacs.d/bookmarks")
 '(delete-selection-mode nil)
 '(enable-local-eval t)
 '(enable-recursive-minibuffers t)
 '(frame-background-mode (quote dark))
 '(inhibit-startup-screen t)
 '(large-file-warning-threshold 1048576)
 '(major-mode (quote text-mode))
 '(package-selected-packages
   (quote
    (slime-company flycheck yasnippet yari yaml-mode web-beautify w3m w3 typing-game typing tabbar solarized-theme smex smarter-compile smart-compile session rust-mode ruby-mode ruby-end ruby-electric robe rainbow-delimiters pretty-mode-plus pos-tip php-mode paredit org on-screen noflet nodejs-repl multiple-cursors multi-term minimap markdown-mode kill-ring-ido key-chord julia-mode js2-mode highlight-tail haskell-mode git-rebase-mode git-gutter-fringe git-commit-mode fuzzy f erlang emms eldoc-extension dired+ desktop cppcheck color-theme buffer-move bookmark+ auto-complete-clang-async ace-jump-buffer ac-inf-ruby)))
 '(python-indent-offset 2)
 '(recenter-positions (quote (middle top bottom)))
 '(safe-local-variable-values (quote ((encoding . utf-8))))
 '(session-use-package t nil (session))
 '(template-default-directories (quote ("~/.emacs.d/.templates/")))
 '(truncate-lines t))

(setq user-full-name "Scinart")
(setq user-mail-address "akubeej@gmail.com")

(setq load-path (cons "~/.emacs.d/oyhy" load-path))
(add-to-list 'load-path "~/.emacs.d/configs")

;; cross platforms settings
(defvar monitor-width (display-pixel-width) "requires.el 2013-05-18 Saturday 16:36:57")
(defvar monitor-height (display-pixel-height) "requires.el 2013-05-18 Saturday 16:36:59")

(defvar windows-p (string-match "windows" (symbol-name system-type)))
(defvar macosx-p (string-match "darwin" (symbol-name system-type)))
(defvar linux-p (string-match "linux" (symbol-name system-type)))
(defvar user-home (expand-file-name "~"))

(setq package-archives
      '(("GNU ELPA"     . "http://elpa.gnu.org/packages/")
        ("MELPA Stable" . "https://stable.melpa.org/packages/")
        ("MELPA"        . "https://melpa.org/packages/"))
      package-archive-priorities
      '(("MELPA Stable" . 10)
        ("GNU ELPA"     . 5)
        ("MELPA"        . 0)))


(setq cursor-type 'box)
(setq cursor-in-non-selected-windows 'hollow)

(setq initial-scratch-message
      (format "%s%s\n%s" ";; Now is "
              (format-time-string "%x %A %T")
              ";; And Happy Hacking\n\n"))

;; This makes emacs works better when marking large regions
(setq select-active-regions 'only)

(setq x-select-enable-clipboard t)
(setq kill-ring-max 200)
(setq visible-bell nil)
(setq ring-bell-function 'ignore)

(setq split-height-threshold nil)
(setq split-width-threshold 100)

(setq window-min-height 10)
(setq window-min-width 20)

(setq margin 2)
(setq scroll-conservatively 10000)
(setq recentf-max-menu-items 50)
(setq recentf-max-saved-items 600)
(setq echo-keystrokes 0.0001)

(setq mode-require-final-newline nil)
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
(setq abbrev-mode t)
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
(require 'slime)
(require 'ace-jump-mode)
(require 'auto-complete)
(require 'bookmark+)
(require 'kill-ring-ido)
(require 'buffer-move)
(require 'company)
(require 'desktop)
(require 'dired+)
(require 'eldoc-extension)
(require 'key-chord)
(require 'fuzzy)
(require 'git-gutter)
(require 'multiple-cursors)
(require 'pos-tip)
(require 'paredit)
(require 'yasnippet)
(setf yas/root-directory '("~/.emacs.d/oyhy/snippets" yas-installed-snippets-dir))
(require 'on-screen)
(require 'session)
(require 'rainbow-delimiters)
(when (display-graphic-p)
  (require 'pretty-mode-plus)
  (require 'git-gutter-fringe)
  )
(require 'smart-compile)
(require 'smex)
(require 'semantic)
(and (executable-find "w3m")
     (require 'w3m))
(require 'yari)
(require 'yaml-mode)
(require 'xcscope)
(cscope-setup)
(require 'f)
(require 's)

(company-mode)
(global-git-gutter-mode)
; (global-rainbow-delimiters-mode)
;; (helm-mode 1)
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

;; flex, bison, gas mode were used when I wrote my compiler homework.
;; (require 'flex-mode)
;; (require 'bison-mode)
;; (require 'gas-mode)

;; oyhy
(require 'init-utils)
(require 'hs-minor-mode-enhancement)
(require 'my-alpha)
(require 'my-time)
(require 'defuns)
(require 'enabled-commands)
(require 'my-server)
(require 'my-ido)
(require 'my-org)
(require 'my-scheme)
; (require 'my-color-theme)
;; (require 'my-ruby)
(require 'my-common-lisp)
; (require 'my-tex)
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
(load-file "~/.emacs.d/oyhy/my-defadvice.el")
(if (display-graphic-p)
    (load-file "~/.emacs.d/oyhy/my-font.el"))

;; major-modes
(require 'emacs-lisp-config)
(require 'cc-config)


;; personal-startup-settings
;; ***************************************************************************
;; set the title of the frame.
;; since using Meta + mouse scroll is bound to adjust transparency by compiz
;; the following line is of no need.
;; (frame-alpha-set-all '(90 45))
(full-screen)


(add-to-list 'custom-theme-load-path "~/.emacs.d/submodules/emacs-color-theme-solarized")
(load-theme 'solarized t)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(rainbow-delimiters-depth-1-face ((t (:foreground "yellow1"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "azure1"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "cyan1"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "magenta1"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "gold" "3"))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "azure2"))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "cyan3"))))
 '(rainbow-delimiters-depth-8-face ((t (:foreground "magenta3"))))
 '(rainbow-delimiters-depth-9-face ((t (:foreground "yellow4"))))
 '(rainbow-delimiters-unmatched-face ((t (:foreground "red" :box (:line-width 2 :color "grey75" :style pressed-button))))))
;; Local Variables:
;; eval:(progn (hs-minor-mode t) (let ((hs-state 'nil) (the-mark 'scinartspecialmarku2npbmfydfnwzwnpywxnyxjr)) (dolist (i hs-state) (if (car i) (progn (goto-char (car i)) (hs-find-block-beginning) (hs-hide-block-at-point nil nil))))) (goto-char 7661) (recenter-top-bottom))
;; End:


;; Local Variables:
;; eval:(progn (hs-minor-mode t) (let ((hs-state 'nil)       (HSmark 'eCMs9PnUiV6Z))  (dolist (i hs-state)   (when (car i)    (goto-char (car i))    (hs-find-block-beginning)    (hs-hide-block-at-point nil nil)))) (goto-char 8818) (recenter-top-bottom))
;; End:
