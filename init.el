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
 '(bmkp-last-as-first-bookmark-file "/home/scinart/.emacs.d/bookmarks")
 '(case-fold-search t)
 '(company-clang-arguments (quote ("-std=c++17")))
 '(coq-compile-before-require t)
 '(coq-compiler "/home/scinart/.opam/4.05.0/bin/coqc")
 '(coq-dependency-analyzer "/home/scinart/.opam/4.05.0/bin/coqdep")
 '(coq-prog-args (quote ("-emacs")))
 '(coq-prog-name "/home/scinart/.opam/4.05.0/bin/coqtop")
 '(delete-selection-mode nil)
 '(elpy-rpc-python-command "python3")
 '(elpy-syntax-check-command "")
 '(enable-local-eval t)
 '(enable-recursive-minibuffers t)
 '(frame-background-mode (quote dark))
 '(inhibit-startup-screen t)
 '(large-file-warning-threshold 1048576)
 '(major-mode (quote text-mode))
 '(package-selected-packages
   (quote
    (company-coq yasnippet-snippets elpy company-ghc mmm-mode dockerfile-mode go-snippets go-mode ace-jump-mode ace-flyspell xcscope modern-cpp-font-lock slime-company flycheck yaml-mode web-beautify w3m w3 tabbar solarized-theme smex smarter-compile smart-compile rainbow-delimiters pretty-mode-plus pos-tip paredit nodejs-repl multiple-cursors markdown-mode kill-ring-ido key-chord julia-mode js2-mode highlight-tail haskell-mode git-rebase-mode git-gutter-fringe git-commit-mode fuzzy f eldoc-extension dired+ cppcheck buffer-move bookmark+ ace-jump-buffer)))
 '(proof-three-window-mode-policy (quote hybrid))
 '(python-indent-offset 2)
 '(python-shell-interpreter "/opt/anaconda3/bin/python3")
 '(recenter-positions (quote (middle top bottom)))
 '(safe-local-variable-values (quote ((encoding . utf-8))))
 '(template-default-directories (quote ("~/.emacs.d/.templates/")))
 '(tramp-connection-timeout 3)
 '(truncate-lines t)
 '(user-mail-address "akubeej@gmail.com")
 '(yas-triggers-in-field t))

(nconc load-path '("~/.emacs.d/oyhy" "~/.emacs.d/configs"))

(setq package-archives
      '(("GNU ELPA"     . "http://elpa.gnu.org/packages/")
        ("MELPA Stable" . "https://stable.melpa.org/packages/")
        ("MELPA"        . "https://melpa.org/packages/"))
      package-archive-priorities
      '(("GNU ELPA"     . 10)
        ("MELPA Stable" . 5)
        ("MELPA"        . 0)))

(setf cursor-type 'box
      cursor-in-non-selected-windows 'hollow)

(setf initial-scratch-message
      (format "%s%s\n%s" ";; Now is "
              (format-time-string "%x %A %T")
              ";; And Happy Hacking\n\n"))

;; This makes emacs works better when marking large regions
(setf select-active-regions 'only)

(setf x-select-enable-clipboard t
      kill-ring-max 200
      visible-bell nil
      ring-bell-function 'ignore

      split-height-threshold nil
      split-width-threshold 100

      window-min-height 10
      window-min-width 20

      margin 2
      scroll-conservatively 10000
      recentf-max-menu-items 50
      recentf-max-saved-items 600
      echo-keystrokes 0.0001

      mode-require-final-newline nil
      make-backup-files nil )

(setf time-stamp-pattern "8/[Tt]ime-?stamp:[ \t]+\\\\?[\"<]+%:y-%02m-%02d %02H:%02M:%02S %u\\\\?[\">]")

;; ***************************************************************************
;; coding settings
(when t
  (setf (default-value 'buffer-file-coding-system) 'utf-8-unix)
  (prefer-coding-system 'utf-8-unix)
  (set-language-environment 'UTF-8)
  (set-locale-environment "UTF-8"))

;; ****************************************************************
;; Abbrev-mode settings
(setf abbrev-mode t
      abbrev-file-name "~/.emacs.d/abbrev_defs"
      save-abbrevs t)
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
(require 'semantic)
(epa-file-enable)
(recentf-mode 1)
(global-subword-mode)


;; ELPA
(require 'yasnippet)
(setf yas/root-directory '("~/.emacs.d/oyhy/snippets" yas-installed-snippets-dir))
(when (display-graphic-p)
  (require 'pretty-mode-plus)
  (require 'git-gutter-fringe)
  )
(require 'smart-compile)
(require 'smex)
(when (executable-find "w3m")
  (require 'w3m))
(require 'yaml-mode)
(require 'xcscope)
(cscope-setup)
(require 'f)
(require 's)

(company-mode)
(global-git-gutter-mode)
(key-chord-mode 1)
(paredit-mode 1)
(yas/global-mode 1)
(when (display-graphic-p) (global-pretty-mode 1))

;; configs
(require 'sci-math-symbol)
(require 'template)
(template-initialize)

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
(require 'my-python)
(require 'my-common-lisp)
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
