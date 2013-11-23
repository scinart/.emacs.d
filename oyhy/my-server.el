;;; my-server.el ---

;; Copyright 2013 Scinart Ouyang
;;
;; Author: akubeej@gmail.com
;; Version: $Id: my-server.el,v 0.0 2013/04/28 01:57:49 scinart
;;; Code:


(require 'env)

(setenv "EMACS_SERVER_FILE" "~/.emacs.d/server/server")
(setq server-auth-dir "~/.emacs.d/server/")
(setq server-name "server")
(start-server)

(provide 'my-server)


;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################





;;; my-server.el ends here





;; Local Variables:
;; eval:(progn (hs-minor-mode t) (let ((hs-state 'nil) (the-mark 'scinartspecialmarku2npbmfydfnwzwnpywxnyxjr)) (dolist (i hs-state) (if (car i) (progn (goto-char (car i)) (hs-find-block-beginning) (hs-hide-block-at-point nil nil))))) (goto-char 1) (recenter-top-bottom))
;; End:
