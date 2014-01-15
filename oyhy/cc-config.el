;;; File created at 2013-05-02 Thursday 20:24:12
;;; Time-stamp: <2014-01-15 12:05:05 scinart>


(add-hook 'c++-mode-hook 'my-c++-mode-hook)
(defun my-c++-mode-hook ()
  "my cpp mode hook, yeah!"
  (local-set-key "\C-c\M-n" 'c-forward-conditional)
  (local-set-key "\C-c\C-n" 'half-screen-down)
  (local-set-key (kbd "<return>") 'newline-and-indent)
  (local-set-key (kbd "C-c C-c") 'comment-or-uncomment-region)
  (hs-minor-mode 1)
)

;; ****************************************************************
(setq c-default-style "linux" c-basic-offset 4)
(c-set-offset 'inline-open '0)
(defun my-cc-style()
  (c-set-style "linux")
  (c-set-offset 'innamespace '0)
  (c-set-offset 'inextern-lang '0)
  (c-set-offset 'inline-open '0)
  (c-set-offset 'label '*)
  (c-set-offset 'case-label '*)
  (c-set-offset 'access-label '-)
  (setq comment-start "//" comment-end "")
  (setq c-basic-offset 4)
  (setq tab-width 4)
  (setq indent-tabs-mode t) ;//use tab to indent.
  (define-key c++-mode-map (kbd "M-/") 'comment-or-uncomment-region-or-line)
  (define-key c-mode-base-map (kbd "M-/") 'comment-or-uncomment-region-or-line)
  (define-key c++-mode-map (kbd "C-/") 'hippie-expand)
  (define-key c-mode-base-map (kbd "C-/") 'hippie-expand)
  (define-key c-mode-map (kbd "<return>") 'newline-and-indent)
  (key-chord-define c++-mode-map "{}"  "{\n\n}\C-p\t")
  (key-chord-define c-mode-map "{}"  "{\n\n}\C-p\t")
  (key-chord-define c-mode-map "()"  "()\C-b\C-i")
  (key-chord-define c-mode-map "\"\"" "\"\"\C-b")
)

(add-hook 'c++-mode-hook 'my-cc-style)
(add-hook 'c-mode-hook 'my-cc-style)


(provide 'cc-config)
