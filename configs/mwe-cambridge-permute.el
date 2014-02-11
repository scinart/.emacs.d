;;; cambridge-permute.el --- obfuscate text

;; Copyright (C) 2004  Free Software Foundation, Inc.

;; Author: Michael Weber <michaelw@foldr.org>
;; Keywords: games
;; Time-stamp: <2003-09-14 21:23:24 michaelw>

;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.

;; This file is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 59 Temple Place - Suite 330,
;; Boston, MA 02111-1307, USA.

;;; Commentary:

;; tested with: GNU/Emacs 21.3.50

;; inspired by this text (taken from
;; http://www.kuro5hin.org/story/2003/9/14/234221/928): 
;; "Aoccdrnig to a rscheearch at Cmabrigde Uinervtisy, it deosn't
;;  mttaer in waht oredr the ltteers in a wrod are, the olny iprmoetnt
;;  tihng is taht the frist and lsat ltteer be at the rghit pclae. The
;;  rset can be a total mses and you can sitll raed it wouthit
;;  porbelm. Tihs is bcuseae the huamn mnid deos not raed ervey lteter
;;  by istlef, but the wrod as a wlohe."

;;; Code:

(defun mwe:swap-elements (the-sequence i j)
  "Swap element I with element J of THE-SEQUENCE."
  (let ((oldI (aref the-sequence i))
        (oldJ (aref the-sequence j)))
    (aset the-sequence i oldJ)
    (aset the-sequence j oldI)))


(defun mwe:cambridge-permute-sequence (the-sequence &optional start end)
  "Permute elements of THE-SEQUENCE randomly \(Fisher-Yates shuffle).
Optionally, the permuted part can be restricted by START and END,
which have to be in the range of the sequence."
  (let* ((new-seq (copy-sequence the-sequence))
         (start (or start 0))
         (end (or end (1- (length the-sequence))))
         (i start))
    (while (< i end)
      (let ((rnd-pos (+ i (random (1+ (- end i))))))
        (mwe:swap-elements new-seq i rnd-pos))
      (incf i))
    new-seq))


(defun mwe:cambridge-permute-region (begin end)
  "Permute each word in region.
The first and last letter of the word stay in place, the rest is
randomly permuted."
  (interactive "*r")
  (save-excursion
    (save-restriction
      (narrow-to-region begin end)
      (goto-char (point-min))
      (while (re-search-forward "\\<" nil t)
        (if (looking-at "[[:alpha:]]\+")
            (atomic-change-group
             (let* ((word (match-string 0))
                    (word-len (length word)))
               (replace-match
                (if (> word-len 3)
                    (mwe:cambridge-permute-sequence word 1 (- word-len 2))
                  word))))
          (forward-word 1))))))


(defun mwe:cambridge-permute-buffer ()
  "Permute each word in the buffer.
See also `mwe:cambridge-permute-region'."
  (interactive "*")
  (mwe:cambridge-permute-region (point-min) (point-max)))

(defun mwe:cambridge-permute-word (count)
  "Permute COUNT words (backward if COUNT is negative).
See also `mwe:cambridge-permute-region'."
  (interactive "*p")
  (let ((begin (point))
        end rb re)
    (forward-word count)
    (setq end (point)
          rb (min begin end)
          re (max begin end))
    (mwe:cambridge-permute-region rb re)
    (goto-char re)))


(provide 'cambridge-permute)
;;; cambridge-permute.el ends here
