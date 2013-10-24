;; (,emacsWords . font-lock-function-name-face)
;; (,emacsBuiltins . font-lock-type-face)
;; (,elispLangWords . font-lock-keyword-face)
;; (,elispVars1 . font-lock-variable-name-face)
;; (,elispVars2 . font-lock-variable-name-face)

(defun color-theme-oswald-adapt ()
  "Color theme by Tom Oswald, created 2001-04-18.
Green on gray7, includes font-lock, show-paren, and ediff."
  (interactive)
  (color-theme-install
   '(color-theme-oswald
     ((background-color . "gray7")
      (background-mode . dark)
      (border-color . "gray7")
      (cursor-color . "cyan")
      (foreground-color . "green")
      (mouse-color . "gray7"))
     ((blank-space-face . blank-space-face)
      (blank-tab-face . blank-tab-face)
      (list-matching-lines-face . bold)
      (view-highlight-face . highlight))
    (default ((t (nil))))
    (blank-space-face ((t (:background "LightGray"))))
    (blank-tab-face ((t (:background "green" :foreground "gray7"))))
    (bold ((t (:bold t))))
    (bold-italic ((t (:italic t :bold t))))
    (ediff-current-diff-face-A ((t (:background "pale green" :foreground "firebrick"))))
    (ediff-current-diff-face-Ancestor ((t (:background "VioletRed" :foreground "Gray7"))))
    (ediff-current-diff-face-B ((t (:background "Yellow" :foreground "DarkOrchid"))))
    (ediff-current-diff-face-C ((t (:background "Pink" :foreground "Navy"))))
    (ediff-even-diff-face-A ((t (:background "light grey" :foreground "Gray7"))))
    (ediff-even-diff-face-Ancestor ((t (:background "Grey" :foreground "White"))))
    (ediff-even-diff-face-B ((t (:background "Grey" :foreground "White"))))
    (ediff-even-diff-face-C ((t (:background "light grey" :foreground "Gray7"))))
    (ediff-fine-diff-face-A ((t (:background "sky blue" :foreground "Navy"))))
    (ediff-fine-diff-face-Ancestor ((t (:background "Green" :foreground "Gray7"))))
    (ediff-fine-diff-face-B ((t (:background "cyan" :foreground "Gray7"))))
    (ediff-fine-diff-face-C ((t (:background "Turquoise" :foreground "Gray7"))))
    (ediff-odd-diff-face-A ((t (:background "Grey" :foreground "White"))))
    (ediff-odd-diff-face-Ancestor ((t (:background "light grey" :foreground "Gray7"))))
    (ediff-odd-diff-face-B ((t (:background "light grey" :foreground "Gray7"))))
    (ediff-odd-diff-face-C ((t (:background "Grey" :foreground "White"))))
    (font-lock-builtin-face ((t (:italic t :bold t :foreground "LightSteelBlue"))))
    (font-lock-comment-face ((t (:italic t :foreground "LightGoldenrod4"))))
    (font-lock-constant-face ((t (:italic t :foreground "HotPink"))))
    (font-lock-doc-string-face ((t (:italic t :foreground "orange"))))
    (font-lock-function-name-face ((t (:italic t :bold t :foreground "red")))) 
    (font-lock-keyword-face ((t (:foreground "red"))))
    (font-lock-preprocessor-face ((t (:italic t :foreground "HotPink"))))
    (font-lock-string-face ((t (:italic t :foreground "orange"))))
    (font-lock-reference-face ((t (:italic t :bold t :foreground "LightSteelBlue"))))
    (font-lock-type-face ((t (:italic t :foreground "LightSlateBlue"))))
    (font-lock-variable-name-face ((t (:underline t :foreground "LightGoldenrod"))))
    (font-lock-warning-face ((t (:bold t :foreground "Pink"))))
    (highlight ((t (:background "yellow" :foreground "red"))))
    (isearch ((t (:background "dim gray" :foreground "aquamarine"))))
    (ispell-face ((t (:bold t :background "#3454b4" :foreground "yellow"))))
    (italic ((t (:italic t))))
    (modeline ((t (:background "green" :foreground "gray7"))))
    (modeline-buffer-id ((t (:background "green" :foreground "gray7"))))
    (modeline-mousable ((t (:background "green" :foreground "gray7"))))
    (modeline-mousable-minor-mode ((t (:background "green" :foreground "gray7"))))
    (region ((t (:background "dim gray" :foreground "aquamarine"))))
    (secondary-selection ((t (:background "darkslateblue" :foreground "light goldenrod"))))
    (show-paren-match-face ((t (:background "turquoise" :foreground "gray7"))))
    (show-paren-mismatch-face ((t (:background "purple" :foreground "white"))))
    (underline ((t (:underline t))))
    (zmacs-region ((t (:background "dim gray" :foreground "aquamarine")))))))

;; ----------------------------------------
;; Color-theme settings
(progn
  (color-theme-initialize)
  (color-theme-snowish)
  (color-theme-euphoria)
  (color-theme-oswald-adapt))


(defvar current-skin 5 "Current Skin Number, see defun switch-skin")

(defun switch-skin (arg)
  "switch between several skins, in defuns.el"
  ;;2013-04-10 Wednesday 16:30:58
  (interactive)
  (let ((skin-cycle (list
                     'color-theme-late-night
                     'color-theme-comidia
                     'color-theme-midnight
                     'color-theme-hober
                     'color-theme-oswald
		     'color-theme-oswald-adapt
                     'color-theme-euphoria
                     'color-theme-calm-forest
                     'color-theme-matrix
                     'color-theme-charcoal-black
                     'color-theme-jonadabian-slate
                     'color-theme-gnome2
                     'color-theme-robin-hood
                     'color-theme-snowish
                     'color-theme-infodoc
                     )))
    (progn
      (setq current-skin (+ arg current-skin))

      (while (>= current-skin (length skin-cycle))
        (setq current-skin (- current-skin (length skin-cycle))))
      (while (< current-skin 0)
        (setq current-skin (+ current-skin (length skin-cycle))))
      (message "%s" (nth current-skin skin-cycle))
      (funcall (nth current-skin skin-cycle)))))
(defun switch-skin-all (arg)
  "switch between several skins, in defuns.el"
  ;;2013-04-10 Wednesday 17:15:51
  (interactive)
  (let ((skin-cycle
         '(color-theme-aalto-dark
           color-theme-aalto-light
           color-theme-aliceblue
           color-theme-andreas
           color-theme-arjen
           color-theme-bharadwaj
           color-theme-bharadwaj-slate
           color-theme-billw
           color-theme-black-on-gray
           color-theme-blippblopp
           color-theme-blue-eshell
           color-theme-blue-gnus
           color-theme-blue-mood
           color-theme-blue-sea
           color-theme-calm-forest
           color-theme-charcoal-black
           color-theme-clarity
           color-theme-classic
           color-theme-comidia
           color-theme-dark-blue
           color-theme-dark-blue2
           color-theme-dark-erc
           color-theme-dark-font-lock
           color-theme-dark-gnus
           color-theme-dark-green
           color-theme-dark-info
           color-theme-dark-laptop
           color-theme-deep-blue
           color-theme-digital-ofs1
           color-theme-emacs-21
           color-theme-emacs-nw
           color-theme-euphoria
           color-theme-example
           color-theme-feng-shui
           color-theme-fischmeister
           color-theme-gnome
           color-theme-gnome2
           color-theme-goldenrod
           color-theme-gray1
           color-theme-gray30
           color-theme-greiner
           color-theme-gtk-ide
           color-theme-high-contrast
           color-theme-hober
           color-theme-infodoc
           color-theme-jb-simple
           color-theme-jedit-grey
           color-theme-jonadabian
           color-theme-jonadabian-slate
           color-theme-jsc-dark
           color-theme-jsc-light
           color-theme-jsc-light2
           color-theme-katester
           color-theme-kingsajz
           color-theme-late-night
           color-theme-lawrence
           color-theme-ld-dark
           color-theme-lethe
           color-theme-marine
           color-theme-marquardt
           color-theme-matrix
           color-theme-midnight
           color-theme-mistyday
           color-theme-montz
           color-theme-oswald
	   color-theme-oswald-adapt
           color-theme-parus
           color-theme-pierson
           color-theme-pok-wob
           color-theme-pok-wog
           color-theme-ramangalahy
           color-theme-raspopovic
           color-theme-renegade
           color-theme-resolve
           color-theme-retro-green
           color-theme-retro-orange
           color-theme-robin-hood
           color-theme-rotor
           color-theme-ryerson
           color-theme-salmon-font-lock
           color-theme-scintilla
           color-theme-shaman
           color-theme-simple-1
           color-theme-sitaramv-nt
           color-theme-sitaramv-solaris
           color-theme-snow
           color-theme-snowish
           color-theme-standard
           color-theme-subtle-blue
           color-theme-subtle-hacker
           color-theme-taming-mr-arneson
           color-theme-taylor
           color-theme-tty-dark
           color-theme-vim-colors
           color-theme-whateveryouwant
           color-theme-wheat
           color-theme-word-perfect
           color-theme-xemacs
           color-theme-xp
           )))
    (progn
      (setq current-skin (+ arg current-skin))

      (while (>= current-skin (length skin-cycle))
        (setq current-skin (- current-skin (length skin-cycle))))
      (while (< current-skin 0)
        (setq current-skin (+ current-skin (length skin-cycle))))
      (message "%s" (nth current-skin skin-cycle))
      (funcall (nth current-skin skin-cycle)))))
(defun switch-skin-forword (arg)
  (interactive "P")
  (if (listp (or arg 1))
      (switch-skin -1)
    (switch-skin 1)))
(defun switch-skin-backward (arg)
  (interactive "P")
  (if (listp (or arg 1))
      (switch-skin 1)
    (switch-skin -1)))

(provide 'my-color-theme)



;; Local Variables:
;; eval:(progn (hs-minor-mode t) (let ((hs-state '((268 4179 hs) (4582 5248 hs) (5771 9028 hs) (9239 9239 nil) (9305 9305 nil) (9356 9356 nil) (9405 9405 nil) (9438 9438 nil) (9458 9458 nil) (9483 9483 nil) (9506 9506 nil) (9528 9528 nil) (9562 9562 nil) (9582 9582 nil) (9607 9607 nil) (9629 9629 nil) (9652 9652 nil) (9653 9653 nil) (9653 9654 nil) (9677 9678 nil) (9679 9679 nil) (9680 9680 nil) (9681 9681 nil) (9682 9682 nil) (9702 9702 nil) (10535 10535 nil))) (the-mark 'scinartspecialmarku2npbmfydfnwzwnpywxnyxjr)) (dolist (i hs-state) (if (not (null (caddr i))) (progn (goto-char (car i)) (hs-find-block-beginning) (hs-hide-block-at-point nil nil))))) (goto-char 9653) (recenter-top-bottom))
;; End:
