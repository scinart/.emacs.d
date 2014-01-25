;;; my-scheme.el --- 
;; Copyright 2013 Scinart Ouyang
;;
;; Author: akubeej@gmail.com
;; Version: $Id: scheme-config.el,v 0.0 2013/04/16 09:29:04 
;;; Code:

(require 'cmuscheme)
(require 'paredit)
(require 'scheme-mode-color)

(eval-after-load "scheme"
  '(progn
     ;; Establishing your own keybindings for scheme-mode.
     (paredit-mode 1)
     (define-key scheme-mode-map (kbd "C-c C-d") 'today)
     (define-key scheme-mode-map (kbd "C-c C-t") 'now)
     (define-key scheme-mode-map (kbd "RET") 'newline-and-indent)
     (define-key scheme-mode-map (kbd "C-c M-t") 'scheme-trace-procedure)
     (define-key scheme-mode-map "\C-\\" (lambda () "insert \'lambda\'" (interactive) (insert "lambda")))
     ;;   (define-key scheme-mode-map (kbd "C-c C-c") 'comment-or-uncomment-region)
     (define-key scheme-mode-map (kbd "C-x C-e") 'scheme-send-last-sexp-split-window)
     (define-key scheme-mode-map (kbd "C-c C-e") 'scheme-send-definition-split-window)))
(case system-type
  ((windows) (setq scheme-program-name "D:/pro/Racket/plt-r5rs.exe"))
  ((darwin))
  ((gnu/linux) (setq scheme-program-name "plt-r5rs")))
;(setq scheme-program-name "D:/pro/Racket/racket.exe")

;; bypass the interactive question and start the default interpreter
(defun scheme-proc ()
  "Return the current Scheme process, starting one if necessary."
  (unless (and scheme-buffer
               (get-buffer scheme-buffer)
               (comint-check-proc scheme-buffer))
    (save-window-excursion
      (run-scheme scheme-program-name)))
  (or (scheme-get-process)
      (error "No current process. See variable `scheme-buffer'")))

(defun scheme-split-window ()
  (cond
   ((= 1 (count-windows))
    (delete-other-windows)
					;    (split-window-vertically (floor (* 0.68 (window-height))))
    (split-window-horizontally (floor (* 0.68 (window-width))))
    (other-window 1)
    (switch-to-buffer "*scheme*")
    (other-window 1))
   ((not (find "*scheme*"
               (mapcar (lambda (w) (buffer-name (window-buffer w)))
                       (window-list))
               :test 'equal))
    (other-window 1)
    (switch-to-buffer "*scheme*")
    (other-window -1))))

(defun scheme-send-last-sexp-split-window ()
  (interactive)
  (scheme-split-window)
  (scheme-send-last-sexp))

(defun scheme-send-definition-split-window ()
  (interactive)
  (scheme-split-window)
  (scheme-send-definition))


(provide 'my-scheme)


;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################


;;; scheme-config.el ends here





;; Local Variables:
;; eval:(progn (hs-minor-mode t) (let ((hs-state '((269 966 hs) (1171 1519 hs) (1551 2063 hs) (2110 2176 hs) (2224 2291 hs))) (the-mark 'scinartspecialmarku2npbmfydfnwzwnpywxnyxjr)) (dolist (i hs-state) (if (car i) (progn (goto-char (car i)) (hs-find-block-beginning) (hs-hide-block-at-point nil nil))))) (goto-char 1) (recenter-top-bottom))
;; End:
