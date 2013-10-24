;;; scheme-config.el --- 
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
     (paredit-mode -1)
     (define-key scheme-mode-map (kbd "C-c C-d") 'today)
     (define-key scheme-mode-map (kbd "C-c C-t") 'now)
     (define-key scheme-mode-map (kbd "RET") 'newline-and-indent)
     (define-key scheme-mode-map (kbd "C-c M-t") 'scheme-trace-procedure)
     (define-key scheme-mode-map "\C-\\" (lambda () "insert \'lambda\'" (interactive) (insert "lambda")))
     ;;   (define-key scheme-mode-map (kbd "C-c C-c") 'comment-or-uncomment-region)
     (define-key scheme-mode-map (kbd "C-x C-e") 'scheme-send-last-sexp-split-window)
     (define-key scheme-mode-map (kbd "C-c C-e") 'scheme-send-definition-split-window)))
(setq scheme-program-name "D:/pro/Racket/plt-r5rs.exe")
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


(provide 'scheme-config)


;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################


;;; scheme-config.el ends here





;; Local Variables:
;; eval:(progn (save-excursion (hs-minor-mode t) (let ((hs-state '((2513 2513 nil) (1 1 nil) (27 27 nil) (60 60 nil) (63 63 nil) (92 92 nil) (153 153 nil) (163 163 nil) (164 164 nil) (185 185 nil) (204 204 nil) (233 233 nil) (234 234 nil) (260 260 nil) (270 270 nil) (329 329 nil) (352 352 nil) (409 409 nil) (464 464 nil) (530 530 nil) (604 604 nil) (710 710 nil) (794 794 nil) (880 880 nil) (269 966 hs) (969 969 nil) (1025 1025 nil) (1080 1080 nil) (1081 1081 nil) (1150 1150 nil) (1172 1172 nil) (1238 1238 nil) (1267 1267 nil) (1309 1309 nil) (1359 1359 nil) (1386 1386 nil) (1427 1427 nil) (1454 1454 nil) (1171 1519 hs) (1521 1521 nil) (1522 1522 nil) (1552 1552 nil) (1560 1560 nil) (1586 1586 nil) (1613 1613 nil) (1682 1682 nil) (1746 1746 nil) (1767 1767 nil) (1801 1801 nil) (1823 1823 nil) (1849 1849 nil) (1917 1917 nil) (1955 1955 nil) (1985 1985 nil) (2006 2006 nil) (2040 2040 nil) (1551 2063 hs) (2065 2065 nil) (2066 2066 nil) (2111 2111 nil) (2127 2127 nil) (2151 2151 nil) (2110 2176 hs) (2178 2178 nil) (2179 2179 nil) (2225 2225 nil) (2241 2241 nil) (2265 2265 nil) (2224 2291 hs) (2293 2293 nil) (2294 2294 nil) (2295 2295 nil) (2320 2320 nil) (2321 2321 nil) (2323 2323 nil) (2402 2402 nil) (2432 2432 nil) (2511 2511 nil) (2512 2512 nil))) (the-mark 'scinartspecialmarku2npbmfydfnwzwnpywxnyxjr)) (dolist (i hs-state) (if (not (null (caddr i))) (progn (goto-char (car i)) (hs-find-block-beginning) (hs-hide-block-at-point nil nil))))) (message "%s" "really")) (goto-char 214) (recenter-top-bottom))
;; End:
