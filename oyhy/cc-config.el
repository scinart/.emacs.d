;;; File created at 2013-05-02 Thursday 20:24:12
;;; Time-stamp: <2019-03-19 11:44:32 scinart>


;; ****************************************************************

(c-set-offset 'inline-open '0)

(defun my-cc-style()
  (c-set-style "linux")
  (c-set-offset 'innamespace '0)
  (c-set-offset 'inextern-lang '0)
  (c-set-offset 'inline-open '0)
  (c-set-offset 'label '*)
  (c-set-offset 'case-label '*)
  (c-set-offset 'access-label '-)
  (setf c-default-style "linux"
	c-basic-offset 4
	indent-tabs-mode nil ;; do not use tab to indent.
	tab-width 4)
  (define-key c++-mode-map (kbd "M-/") 'comment-or-uncomment-region-or-line)
  (define-key c-mode-base-map (kbd "M-/") 'comment-or-uncomment-region-or-line)
  (define-key c++-mode-map (kbd "C-/") 'hippie-expand)
  (define-key c-mode-base-map (kbd "C-/") 'hippie-expand)
  (define-key c-mode-map (kbd "<return>") 'newline-and-indent)
  (local-set-key (kbd "C-c M-n") 'c-forward-conditional)
  (local-set-key (kbd "C-c C-n") 'half-screen-down)
  (key-chord-define c++-mode-map "{}"  "{\n\n}\C-p\t")
  (key-chord-define c-mode-map "{}"  "{\n\n}\C-p\t")
  (key-chord-define c-mode-map "()"  "()\C-b\C-i")
  (key-chord-define c-mode-map "\"\"" "\"\"\C-b")
  (hs-minor-mode 1)
  (whitespace-mode 1)
  (company-mode)
  (flycheck-mode)
  (setf flycheck-clang-warnings '("no-pragma-once-outside-header"))
  (add-hook 'flycheck-before-syntax-check-hook
 	    #'(lambda ()
		(if (file-exists-p ".clang_complete")
		    (setf flycheck-clang-args (s-split "\n" (f-read ".clang_complete") t))))))

(defun company-manual-begin ()
  (interactive)
  (company-assert-enabled)
  (if (file-exists-p ".clang_complete")
      (setf company-clang-arguments (nconc company-clang-arguments (s-split "\n" (f-read ".clang_complete") t))))
  (setq company--manual-action t)
  (unwind-protect
      (let ((company-minimum-prefix-length 0))
        (or company-candidates
            (company-auto-begin)))
    (unless company-candidates
      (setq company--manual-action nil))))

(require 'font-lock)

(defun --copy-face (new-face face)
  "Define NEW-FACE from existing FACE."
  (copy-face face new-face)
  (eval `(defvar ,new-face nil))
  (set new-face new-face))

(--copy-face 'font-lock-label-face  ; labels, case, public, private, proteced, namespace-tags
         'font-lock-keyword-face)
(--copy-face 'font-lock-doc-markup-face ; comment markups such as Javadoc-tags
         'font-lock-doc-face)
(--copy-face 'font-lock-doc-string-face ; comment markups
         'font-lock-comment-face)

(global-font-lock-mode t)
(setq font-lock-maximum-decoration t)

(defun clean-up-for-cc-mode ()
  (when (member major-mode '(c-mode c++-mode emacs-lisp-mode))
    (delete-trailing-whitespace)))

;; https://stackoverflow.com/questions/8549351/c11-mode-or-settings-for-emacs
(add-hook
 'c++-mode-hook
 '(lambda()
    ;; We could place some regexes into `c-mode-common-hook', but note that their evaluation order
    ;; matters.
    (font-lock-add-keywords
     nil '(;; complete some fundamental keywords
           ("\\<\\(void\\|unsigned\\|signed\\|char\\|short\\|bool\\|int\\|long\\|float\\|double\\)\\>" . font-lock-keyword-face)
           ;; namespace names and tags - these are rendered as constants by cc-mode
           ("\\<\\(\\w+::\\)" . font-lock-function-name-face)
           ;;  new C++11 keywords
           ("\\<\\(alignof\\|alignas\\|constexpr\\|decltype\\|noexcept\\|nullptr\\|static_assert\\|thread_local\\|override\\|final\\)\\>" . font-lock-keyword-face)
           ("\\<\\(char16_t\\|char32_t\\)\\>" . font-lock-keyword-face)
           ;; PREPROCESSOR_CONSTANT, PREPROCESSORCONSTANT
           ("\\<[A-Z]*_[A-Z_]+\\>" . font-lock-constant-face)
           ("\\<[A-Z]\\{3,\\}\\>"  . font-lock-constant-face)
           ;; hexadecimal numbers
           ("\\<0[xX][0-9A-Fa-f]+\\>" . font-lock-constant-face)
           ;; integer/float/scientific numbers
           ("\\<[\\-+]*[0-9]*\\.?[0-9]+\\([ulUL]+\\|[eE][\\-+]?[0-9]+\\)?\\>" . font-lock-constant-face)
           ;; c++11 string literals
           ;;       L"wide string"
           ;;       L"wide string with UNICODE codepoint: \u2018"
           ;;       u8"UTF-8 string", u"UTF-16 string", U"UTF-32 string"
           ("\\<\\([LuU8]+\\)\".*?\"" 1 font-lock-keyword-face)
           ;;       R"(user-defined literal)"
           ;;       R"( a "quot'd" string )"
           ;;       R"delimiter(The String Data" )delimiter"
           ;;       R"delimiter((a-z))delimiter" is equivalent to "(a-z)"
           ("\\(\\<[uU8]*R\"[^\\s-\\\\()]\\{0,16\\}(\\)\\([[:ascii:][:nonascii:]]*?\\)\\()[^\\s-\\\\()]\\{0,16\\}\"\\)" 1 font-lock-keyword-face t) ; start delimiter
           ("\\(\\<[uU8]*R\"[^\\s-\\\\()]\\{0,16\\}(\\)\\([[:ascii:][:nonascii:]]*?\\)\\()[^\\s-\\\\()]\\{0,16\\}\"\\)" 2 font-lock-string-face t)  ; actual string
           ("\\(\\<[uU8]*R\"[^\\s-\\\\()]\\{0,16\\}(\\)\\([[:ascii:][:nonascii:]]*?\\)\\()[^\\s-\\\\()]\\{0,16\\}\"\\)" 3 font-lock-keyword-face t) ; end delimiter

           ;; user-defined types (rather project-specific)
           ("\\<[A-Za-z_]+[A-Za-z_0-9]*_\\(type\\|ptr\\)\\>" . font-lock-type-face)
           ("\\<\\(xstring\\|xchar\\)\\>" . font-lock-type-face)
           ))
    ) t)

(add-hook 'c++-mode-hook 'my-cc-style)
(add-hook 'c++-mode-hook #'(lambda ()
                             (setf flycheck-gcc-language-standard "c++17"
                                   flycheck-clang-language-standard "c++17")))
(add-hook 'c-mode-hook 'my-cc-style)
(add-hook 'c-mode-hook #'(lambda ()
			   (setf flycheck-gcc-language-standard nil
				 flycheck-clang-language-standard nil)))

(add-hook 'before-save-hook 'clean-up-for-cc-mode)


(setf company-async-timeout 4)
(provide 'cc-config)
