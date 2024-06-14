;;==================================================
;; auto generate release
;;
;;     Require: Add 'Ahk2Exe.exe' to Path, please.
;;
;; Author: Liu Changzhen
;;   Version: 0.3
;;==================================================

#Requires AutoHotkey v2.0


;-------------------------------------------------
; clear file
;-------------------------------------------------




;-------------------------------------------------
;copy config files
;-------------------------------------------------
DirCopy A_ScriptDir '\ini', A_ScriptDir '\release\ini', 1  ; copy and overwrite
DirCopy A_ScriptDir '\pic', A_ScriptDir '\release\pic', 1  ; copy and overwrite


;------------------------------------------------------
; generate exe
;     not set base file in cmdline, open 'Ahk2Exe.exe', select one base file and save to set it as default
;------------------------------------------------------

;runwait 'Ahk2Exe.exe /in "AutoWinSpace.ahk" /icon "./icon/numbers_123.ico" /out "./release/AutoWinSpace.exe"'

runwait 'Ahk2Exe.exe /in "MSPinyinIME_EasyCandidate.ahk" /icon "./icon/numbers_123.ico" /out "./release/TypingEasyCandidate.exe"'





