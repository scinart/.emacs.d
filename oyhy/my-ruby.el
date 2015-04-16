;;; Basic ruby setup
(require 'ruby-mode)
; (require 'ruby-hash-syntax)

(add-auto-mode 'ruby-mode
               "Rakefile\\'" "\\.rake\\'" "\\.rxml\\'"
               "\\.rjs\\'" "\\.irbrc\\'" "\\.pryrc\\'" "\\.builder\\'" "\\.ru\\'"
               "\\.gemspec\\'" "Gemfile\\'" "Kirkfile\\'")

(setq ruby-use-encoding-map nil)

(defun ruby-send-line ()
  "Send the current line to the inferior Ruby process."
  (interactive)
  (ruby-send-region (line-beginning-position) (line-end-position)))

(add-hook 'ruby-mode-hook 'subword-mode)

;; TODO: hippie-expand ignoring : for names in ruby-mode
;; TODO: hippie-expand adaptor for auto-complete sources


;;; Inferior ruby
(require 'inf-ruby)
(require 'ac-inf-ruby)
(after-load 'auto-complete
  (add-to-list 'ac-modes 'inf-ruby-mode))
(add-hook 'inf-ruby-mode-hook 'ac-inf-ruby-enable)
;; (after-load 'inf-ruby
;;   (define-key inf-ruby-mode-map (kbd "TAB") 'auto-complete))


;;; Robe
(require 'robe)
(after-load 'ruby-mode
  (add-hook 'ruby-mode-hook 'robe-mode)
  (add-hook 'ruby-mode-hook 'ruby-electric-mode)
  (add-hook 'ruby-mode-hook 'company-mode))
(after-load 'robe
  (add-hook 'robe-mode-hook
            (lambda ()
              (add-to-list 'ac-sources 'ac-source-robe)
;            (set-auto-complete-as-completion-at-point-function)
	      )))

;;; ri support
(require 'yari)
(defalias 'ri 'yari)

;;; YAML

; (require-package 'yaml-mode)

;;;; my dk

;; --------- 重定义 -----------------

(defun ruby-send-last-sexp ()
  "这个是，那个key-binding我一直改不过来，只好重定义了。囧"
  (interactive)
  (ruby-send-region (line-beginning-position) (line-end-position)))

(defun ruby-send-block ()
  "原来的不好用，重写。"
  (interactive)
  (save-excursion
    (let ((end (point)))
      (ruby-beginning-of-block)
      (ruby-send-region (point) end))))

(defun my-ruby-mode-hook ()
  "my ruby mode hook, yeah!"
  ;; (define-key ruby-mode-map (kbd "RET") 'reindent-then-newline-and-indent)
  ;; (define-key ruby-mode-map (kbd "TAB") 'indent-for-tab-command)
  ;; (local-set-key "\C-x\C-e" 'ruby-send-line)
  
  ;; Stupidly the non-bundled ruby-mode isn't a derived mode of
  ;; prog-mode: we run the latter's hooks anyway in that case.
  (unless (derived-mode-p 'prog-mode)
    (run-hooks 'prog-mode-hook)))

(add-hook 'ruby-mode-hook 'my-ruby-mode-hook)


(define-key inf-ruby-mode-map (kbd "C-x C-e") 'ruby-send-line)
(define-key ruby-mode-map (kbd "C-h C-h") 'yari-anything)
(define-key inf-ruby-mode-map (kbd "C-h C-h") 'yari-anything)

(provide 'my-ruby)
