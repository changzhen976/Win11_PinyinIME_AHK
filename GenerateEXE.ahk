;;==================================================
;; auto generate release
;;
;; Author: Liu Changzhen
;;   Version: 0.3
;;==================================================

#Requires AutoHotkey v2.0


;-------------------------------------------------
; clear releas folder
;-------------------------------------------------

DirDelete A_ScriptDir '\release', true

;-------------------------------------------------
;copy config files
;-------------------------------------------------
DirCopy A_ScriptDir '\ini', A_ScriptDir '\release\ini', 1  ; copy and overwrite
DirCopy A_ScriptDir '\pic', A_ScriptDir '\release\pic', 1  ; copy and overwrite


;------------------------------------------------------
; generate exe cmd
;     not set base file in cmdline(have no idea how-to-do, Error always ), open 'Ahk2Exe.exe', select one base file and save to set it as default
;------------------------------------------------------

generateExeCmd :=   '&& Ahk2Exe.exe /in "MSPinyinIME_EasyCandidate.ahk" /icon "./icon/numbers_123.ico" /out "./release/TypingEasyCandidate.exe"'
                    . '&& Ahk2Exe.exe /in "EasyCandidate4OldPinyinIME.ahk" /icon "./icon/numbers_123.ico" /out "./release/EasyCandidate4OldPinyinIME.exe"'
                    . '&& Ahk2Exe.exe /in "AutoWinSpace.ahk" /icon "./icon/AutoSwitchIME.ico" /out "./release/AutoWinSpace.exe"'
 
;-------------------------------------------------
; add PATH and generate
;-------------------------------------------------

FoundPos := InStr(A_AhkPath, '\v2', False)
if FoundPos != 0 {
    ahkInstallPath := SubStr(A_AhkPath, 1, FoundPos - 1)
    CompilerPath := ahkInstallPath "\Compiler"
    cmdString := "set PATH=%PATH%;" CompilerPath 
    ; MsgBox cmdString
    ; run 'set PATH=%PATH%;' CompilerPath
    runwait 'cmd /c set PATH=%PATH%;' CompilerPath
            . generateExeCmd
 
}
Else
{
    runwait 'cmd /c ' generateExeCmd
}





