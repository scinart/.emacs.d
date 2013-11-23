;; zone.el
;; Time-stamp: <2013-11-24 00:50:21 scinart> 
;; Date created: <2013-05-05 Sunday 20:19:43>
(setq zone-programs [zone-pgm-jitter])
(setq zone-programs [zone-pgm-putz-with-case])
(setq zone-programs [zone-pgm-dissolve])
(setq zone-programs [zone-pgm-explode])
(setq zone-programs [zone-pgm-whack-chars])
(setq zone-programs [zone-pgm-rotate])
(setq zone-programs [zone-pgm-rotate-LR-lockstep])
(setq zone-programs [zone-pgm-rotate-RL-lockstep])
(setq zone-programs [zone-pgm-rotate-LR-variable])
(setq zone-programs [zone-pgm-rotate-RL-variable])
(setq zone-programs [zone-pgm-drip])
(setq zone-programs [zone-pgm-drip-fretfully])
(setq zone-programs [zone-pgm-five-oclock-swan-dive])
(setq zone-programs [zone-pgm-martini-swan-dive])
(setq zone-programs [zone-pgm-rat-race])
(setq zone-programs [zone-pgm-paragraph-spaz])
(setq zone-programs [zone-pgm-stress])
(setq zone-programs [zone-pgm-stress-destress])
(setq zone-programs [zone-pgm-random-life])
(local-set-key (kbd "<f8>") 'zone)





;; Local Variables:
;; eval:(progn (hs-minor-mode t) (let ((hs-state 'nil) (the-mark 'scinartspecialmarku2npbmfydfnwzwnpywxnyxjr)) (dolist (i hs-state) (if (car i) (progn (goto-char (car i)) (hs-find-block-beginning) (hs-hide-block-at-point nil nil))))) (goto-char 1) (recenter-top-bottom))
;; End:
