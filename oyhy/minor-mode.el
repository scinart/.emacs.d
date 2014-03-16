;;; minor-mode.el ---
;;; Time-stamp: <2014-03-16 22:08:14 scinart>
;;; Date created: 2013-04-30 Tuesday 23:11:44
;;; Code:

;; Minor Modes Settings

;; ****************************************************************
;; Auto-complete settings

(setq ac-quick-help-prefer-pos-tip t)
(setq ac-use-quick-help t)
(setq ac-quick-help-delay 1.0)

;; do what I mean: use tab as enter.
(setq ac-dwim t)

;; auto-complete settings ends here

;; ****************************************************************
;; company-mode settings

;; ****************************************************************
;; paredit-everywhere-mode settings
(add-hook 'c-mode-hook 'paredit-everywhere-mode)
(add-hook 'ruby-mode-hook 'paredit-everywhere-mode)

;; ****************************************************************
;; rainbow-delimiters-mode settings

(let ((o "yellow")
      (oo "azure")
      (ooo "cyan")
      (oooo "magenta"))
  (custom-theme-set-faces 'user 
   ;; custom-set-faces was added by Custom.
   ;; If you edit it by hand, you could mess it up, so be careful.
   ;; Your init file should contain only one such instance.
   ;; If there is more than one, they won't work right.
   `(rainbow-delimiters-depth-1-face ((t (:foreground ,(concatenate 'string o "1")))))
   `(rainbow-delimiters-depth-2-face ((t (:foreground ,(concatenate 'string oo "1")))))
   `(rainbow-delimiters-depth-3-face ((t (:foreground ,(concatenate 'string ooo "1")))))
   `(rainbow-delimiters-depth-4-face ((t (:foreground ,(concatenate 'string oooo "1")))))
   `(rainbow-delimiters-depth-5-face ((t (:foreground ,(concatenate 'string "gold") "3"))))
   `(rainbow-delimiters-depth-6-face ((t (:foreground ,(concatenate 'string oo "2")))))
   `(rainbow-delimiters-depth-7-face ((t (:foreground ,(concatenate 'string ooo "3")))))
   `(rainbow-delimiters-depth-8-face ((t (:foreground ,(concatenate 'string oooo "3")))))
   `(rainbow-delimiters-depth-9-face ((t (:foreground ,(concatenate 'string o "4")))))
   `(rainbow-delimiters-unmatched-face ((t (:foreground "red" :box (:line-width 2 :color "grey75" :style pressed-button)))))))

;; ****************************************************************
;; git-gutter
;; (set-face-foreground 'git-gutter-fr:modified "yellow")
;; (set-face-foreground 'git-gutter-fr:added    "blue")
;; (set-face-foreground 'git-gutter-fr:deleted  "white")

;; ****************************************************************
;; paredit-things.
(defun my-paredit-mode-hook ()
  "My hook for paredit modes"

  ; (define-key paredit-mode-map (kbd "C-<backspace>") 'paredit-backward-kill-word)
  ; (define-key paredit-mode-map (kbd "M-<backspace>") 'paredit-backward-kill-sexp)
  (define-key paredit-mode-map (kbd "C-(") 'my-paredit-backward-slurp-sexp)
  (define-key paredit-mode-map (kbd "C-)") 'my-paredit-forward-slurp-sexp)
  (define-key paredit-mode-map (kbd "C-M-(") 'paredit-backward-barf-sexp)
  (define-key paredit-mode-map (kbd "C-M-)") 'paredit-forward-barf-sexp))

(add-hook 'paredit-mode-hook 'my-paredit-mode-hook)

;; ****************************************************************
;; hs-mode sittings

(defun my-hs-mode-hook ()
  "my hook for hs-minor-mode
   redefun some keybindings, c-c c-@ c-c for example"
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
(provide 'minor-mode)

;; local variables:
;; eval:(progn (hs-minor-mode t) (let ((hs-state '((1412 2565 hs))) (the-mark 'scinartspecialmarku2npbmfydfnwzwnpywxnyxjr)) (dolist (i hs-state) (if (car i) (progn (goto-char (car i)) (hs-find-block-beginning) (hs-hide-block-at-point nil nil))))) (goto-char 593) (recenter-top-bottom))
;; end:
