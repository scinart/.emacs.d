;;; programs.el --- 

;;; Code:

(if windows-p
    (provide 'programs)
  '())

(defmacro create-program-shortcut (name path &optional docstring normal param)
  "2013-05-26 Sunday 01:24:21 by Scinart"
  `(defun ,name ()
     ,(concat (or docstring "") " by Scinart Macro in programs.el")
     (interactive)
     (w32-shell-execute (or ,normal 1) ,path ,param)))

(create-program-shortcut MouseInc
			 "D:\\backup\\HOME\\.emacs.d\\extra-bin\\MouseInc\\MouseInc.exe"
			 "open MouseInc\n2013-05-26 Sunday 01:25:19")
(create-program-shortcut stardock
			 "d:/pro/Stardock/ObjectDockPlus2/ObjectDock.exe"
			 "open stardock\n2013-05-26 Sunday 12:52:14")
(create-program-shortcut mspaint
			 "C:\\Windows\\System32\\mspaint.exe"
			 "open mspaint\n2013-05-27 Monday 09:59:23 by Scinart")
(create-program-shortcut carnac
			 "D:/backup/Home/.emacs.d/extra-bin/Carnac/Release/Carnac.exe"
			 "Open a program similar to KeyCastr\n2013-05-25 Saturday 19:58:27\nVery great program"
			 6)
(create-program-shortcut goagent
			 "C:/Users/scinart/AppData/Roaming/Microsoft/Windows/Start Menu/Programs/python.exe.lnk"
			 "Open GoAgent"
			 6)
(create-program-shortcut gifcam
			 "D:/pro/Gifcam.exe"
			 "Open Gifcam\n2013-05-11 Saturday 14:35:03"
			 1)
(create-program-shortcut guieverything
			 "D:/pro/everything/everything.exe"
			 "Open Everything\n2013-05-13 Monday 17:53:28"
			 1)
(create-program-shortcut ccleaner
			 "C:\\Program Files (x86)\\ccleaner\\CCleaner.exe"
			 "Open ccleaner\nMay 21 Tuesday 20:57:16"
			 1)
(create-program-shortcut whatpulse
			 "C:\\Program Files (x86)\\WhatPulse2\\whatpulse.exe"
			 "Open what palse\n2013-05-30 Thursday 15:42:55"
			 6)
(create-program-shortcut dnsforwarder
			 "d:/pro/DNSProxy/DNSForwarder/dnsforwarder2.2.exe"
			 "Open dnsforwarder.exe"
			 6)
(create-program-shortcut freefilesync
			 "C:/Program Files/FreeFileSync/FreeFileSync.exe"
			 "Open freefilesync"
			 6)
(create-program-shortcut bluestacks
			 "C:\\Program Files (x86)\\BlueStacks\\HD-StartLauncher.exe"
			 "Open Bluestacks 2013-05-30 Thursday 15:50:57"
			 nil)
(create-program-shortcut teleplus
		 "D:\\pro\\keystroke\\teleplus_v162\\teleportower_plus.exe"
			 "Open Teleplus 2013-05-30 Thursday 21:27:59")
(create-program-shortcut foobar2000
			 "d:/pro/foobar2000/foobar2000.exe")
(create-program-shortcut rosetta
			 "D:/pro/Rosetta Stone/Rosetta Stone Version 3/")
(create-program-shortcut rosetta-data-base "C:\\ProgramData\\Rosetta Stone")
(create-program-shortcut evernote
			 "c:/Program Files (x86)/Evernote/Evernote/Evernote.exe"
			 "2013-06-23 Sunday 14:51:55")
(create-program-shortcut whouseme
			 (concat (getenv "windir") "\\system32\\perfmon.exe")
			 "2013-06-23 Sunday 14:50:00"
			 nil
			 "-res")
;; (create-program-shortcut hfs "d:/school/Project/server/")

(create-program-shortcut screenrecord
 "d:/pro/Blueberry Software/BB FlashBack Pro 4/FlashBack Player.exe")
(create-program-shortcut youdaonote
 "C:/Program Files (x86)/Youdao/YoudaoNote/YoudaoNote.exe")
(create-program-shortcut sqlite
			 "D:\\pro\\sqlitebrowser_200_b1_win\\SQLite Database Browser 2.0 b1.exe")
(create-program-shortcut splayer
			 "C:\\Program Files (x86)\\SPlayer\\splayer.exe")
(create-program-shortcut stopwatch
			 "d:/pro/stopwatch/StopWatch.exe")

;; TODO: use mapcar to the macro functions.

(defun km ()
  "enhancement of keyboard and Mouse,
   open carnac and MouseInc
   2013-05-26 Sunday 12:54:07"
  (interactive)
  (carnac)
  (MouseInc))
(defun ms ()
  "open, mouseInc and stardock"
  (interactive)
  (MouseInc)
  (stardock))




;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################





;;; programs.el ends here





;; Local Variables:
;; eval:(progn (hs-minor-mode t) (let ((hs-state '((3477 3551 hs) (3326 3463 hs) (2939 2998 hs) (2833 2902 hs) (396 512 hs) (547 648 hs) (682 781 hs) (814 977 hs) (1011 1128 hs) (1161 1239 hs) (1279 1374 hs) (1409 1514 hs) (1550 1665 hs) (1704 1793 hs) (1832 1915 hs) (1952 2075 hs) (2110 2221 hs) (2258 2297 hs) (2495 2588 hs) (2623 2732 hs))) (the-mark 'scinartspecialmarku2npbmfydfnwzwnpywxnyxjr)) (dolist (i hs-state) (if (car i) (progn (goto-char (car i)) (hs-find-block-beginning) (hs-hide-block-at-point nil nil))))) (goto-char 78) (recenter-top-bottom))
;; End:
