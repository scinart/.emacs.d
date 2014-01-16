;;; minor-mode.el ---
;;; Time-stamp: <2014-01-15 22:28:12 scinart>
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
