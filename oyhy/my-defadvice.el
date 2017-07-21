;; prompt y-or-n-p instead of yes-or-no-p somewhere.
;; https://emacs.stackexchange.com/questions/22569/kill-buffer-with-y-or-n-p-instead-of-yes-or-no-p

(defun yes-or-no-p->-y-or-n-p (orig-fun &rest r)
  (cl-letf (((symbol-function 'yes-or-no-p) #'y-or-n-p))
    (apply orig-fun r)))

(advice-add 'kill-buffer :around #'yes-or-no-p->-y-or-n-p)
(advice-add 'save-buffer :around #'yes-or-no-p->-y-or-n-p)

;; wrapped isearch
;; https://stackoverflow.com/questions/285660/automatically-wrapping-i-search
(defadvice isearch-search (after isearch-no-fail activate)
  (unless isearch-success
    (ad-disable-advice 'isearch-search 'after 'isearch-no-fail)
    (ad-activate 'isearch-search)
    (isearch-repeat (if isearch-forward 'forward))
    (ad-enable-advice 'isearch-search 'after 'isearch-no-fail)
    (ad-activate 'isearch-search)))