;;; minor-mode.el ---
;;; Time-stamp: <2013-11-21 02:46:51 scinart>
;;; Date created: 2013-04-30 Tuesday 23:11:44
;;; Code:

;; Minor Modes Settings

;; ****************************************************************
;; Auto-complete settings

(add-to-list 'ac-user-dictionary "akubeej@gmail.com")

(setq ac-quick-help-prefer-pos-tip t)
(setq ac-use-quick-help t)
(setq ac-quick-help-delay 1.0)
;;2.5 設置tab鍵的使用模式
(setq ac-dwim t)
(setq ac-auto-start nil)
;;2.6 設置auto-complete的觸發鍵
(ac-set-trigger-key "<C-M-return>")


(defun my-ac-config ()
  (setq-default ac-sources '(ac-source-abbrev ac-source-dictionary ac-source-words-in-same-mode-buffers))
  (add-hook 'emacs-lisp-mode-hook 'ac-emacs-lisp-mode-setup)
  (add-hook 'ruby-mode-hook 'ac-ruby-mode-setup)
  (add-hook 'css-mode-hook 'ac-css-mode-setup)
  (add-hook 'auto-complete-mode-hook 'ac-common-setup)
  (global-auto-complete-mode t))

(defun my-ac-cc-mode-setup ()
  (setq ac-sources (append '(ac-source-clang ac-source-yasnippet) ac-sources)))

(add-hook 'c-mode-common-hook 'my-ac-cc-mode-setup)
;; ac-source-gtags
(my-ac-config)

(setq ac-trigger-commands
      (cons 'backward-delete-char-untabify nil
;            ac-trigger-commands
	    ))

;;use fuzzy.el
(setq ac-fuzzy-enable t)

(setq ac-clang-flags (list
                      "-ID:/pro/CodeBlocks12.11/MinGW/lib/gcc/mingw32/4.7.1/include/"
                      "-ID:/pro/CodeBlocks12.11/MinGW/lib/gcc/mingw32/4.7.1/include/c++"
                      "-ID:/pro/CodeBlocks12.11/MinGW/lib/gcc/mingw32/4.7.1/include/c++/backward"
                      "-ID:/pro/CodeBlocks12.11/MinGW/lib/gcc/mingw32/4.7.1/include/c++/bits"
                      "-ID:/pro/CodeBlocks12.11/MinGW/lib/gcc/mingw32/4.7.1/include/c++/debug"
                      "-ID:/pro/CodeBlocks12.11/MinGW/lib/gcc/mingw32/4.7.1/include/c++/decimal"
                      "-ID:/pro/CodeBlocks12.11/MinGW/lib/gcc/mingw32/4.7.1/include/c++/ext"
                      "-ID:/pro/CodeBlocks12.11/MinGW/lib/gcc/mingw32/4.7.1/include/c++/mingw32"
                      "-ID:/pro/CodeBlocks12.11/MinGW/lib/gcc/mingw32/4.7.1/include/c++/parallel"
                      "-ID:/pro/CodeBlocks12.11/MinGW/lib/gcc/mingw32/4.7.1/include/c++/profile"
                      "-ID:/pro/CodeBlocks12.11/MinGW/lib/gcc/mingw32/4.7.1/include/c++/tr1"
                      "-ID:/pro/CodeBlocks12.11/MinGW/lib/gcc/mingw32/4.7.1/include/c++/tr2"
                      ))


(add-hook 'c++-mode-hook 'auto-complete-mode)
(add-hook 'c-mode-hook 'auto-complete-mode)
(add-hook 'emacs-lisp-mode-hook 'auto-complete-mode)
(add-hook 'lisp-mode-hook 'auto-complete-mode)
(add-hook 'scheme-mode-hook 'auto-complete-mode)
(add-hook 'sql-mode-hook 'auto-complete-mode)
(add-hook 'actionscript-mode-hook 'auto-complete-mode)
(add-hook 'inferior-scheme-mode 'auto-complete-mode)

(add-hook 'c++-mode-hook 'auto-complete-mode)
(add-hook 'c-mode-hook 'auto-complete-mode)
(add-hook 'emacs-lisp-mode-hook 'auto-complete-mode)
(add-hook 'lisp-mode-hook 'auto-complete-mode)
(add-hook 'scheme-mode-hook 'auto-complete-mode)
(add-hook 'sql-mode-hook 'auto-complete-mode)
;; Auto-complete settings ends here

;; ****************************************************************
;; fly-mode-settings
;; @override default mark-paragraph.
;; (add-hook 'c++-mode-hook '(lambda () (flyspell-prog-mode)))
;; (add-hook 'c-mode-hook '(lambda () (flyspell-prog-mode)))
;; (add-hook 'emacs-lisp-mode-hook '(lambda () (flyspell-prog-mode)))
;; (add-hook 'lisp-mode-hook '(lambda () (flyspell-prog-mode)))
;; (add-hook 'scheme-mode-hook '(lambda () (flyspell-prog-mode)))
;; (add-hook 'sql-mode-hook '(lambda () (flyspell-prog-mode)))

(require 'flyspell)
(define-key flyspell-mode-map (kbd "C-;") '(lambda nil (interactive) (smart-other-window 1)))


;; ****************************************************************
;; Abbrev-mode settings
(setq default-abbrev-mode t)
(setq abbrev-file-name "~/.emacs.d/abbrev_defs")
(setq save-abbrevs t)
(quietly-read-abbrev-file)
;;# C-q after nkux to stop auto expansion

;; ****************************************************************
;; aspell settings
(setq ispell-program-name "aspell")
(setq ispell-personal-dictionary "~/.emacs.d/personal.en.pws")
(require 'ispell)

;; ****************************************************************
;; template settings
(require 'template)
(template-initialize)


;; ****************************************************************
;; yasnippet settings
(yas/global-mode 1)

;; ****************************************************************
;; recentf-mode
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 50)

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


;; ****************************************************************
;; ido-minor-mode settings
(add-hook 'ido-minibuffer-setup-hook 'ido-my-keys)
<<<<<<< HEAD
(setq ido-default-buffer-method 'selected-window)
=======
>>>>>>> 3f929f11ad702cc23020b5e00aac266c6141002e
(defun ido-my-keys ()
  "My Keybindings for ido
especially for extending ido-find-file functionality 
2013-08-04 Sunday 17:25:03"
  (define-key ido-completion-map (kbd "<return>") 'ido-exit-minibuffer) ;; for find-file
  (define-key ido-completion-map (kbd "RET") 'ido-magic-open-using-w32))

(defun ido-magic-open-using-w32 ()
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
	     (w32-shell-execute 1 (concat dir file)))))
  (exit-minibuffer))


;; ****************************************************************
(provide 'minor-mode)

;; Local Variables:
;; eval:(progn (hs-minor-mode t) (let ((hs-state '((1412 2565 hs))) (the-mark 'scinartspecialmarku2npbmfydfnwzwnpywxnyxjr)) (dolist (i hs-state) (if (car i) (progn (goto-char (car i)) (hs-find-block-beginning) (hs-hide-block-at-point nil nil))))) (goto-char 593) (recenter-top-bottom))
;; End:
