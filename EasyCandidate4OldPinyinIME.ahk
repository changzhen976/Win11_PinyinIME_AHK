;-------------------------------------------------------------------------------
; AutoHotKey V2
;
;  map `;` `'` `/` as 2 3 4 while Microsoft-Pinyin-IME candidate-window popping up
;  for old IME version
;
;  Author: Liu Changzhen
;  Version: 1.0
;-------------------------------------------------------------------------------

#Requires AutoHotkey v2.0

;----------------------------------------------------
; check if map
; if detect return true
;----------------------------------------------------
CoordMode "Caret" ; , "Window" ; set ImageSearch mode based Caret
getIfPinyinIMECandidateExist(){
    if WinExist("ahk_class Microsoft.IME.UIManager.CandidateWindow.Host") 
        Return True
    Else
        Return False 
}   


;-----------------------------------------------------------
; Key mapping Macro definition
; dollar sign is required [https://www.autohotkey.com/docs/v2/Hotkeys.htm#prefixdollar]
;-----------------------------------------------------------
$`;::{
    If (getIfPinyinIMECandidateExist())
        Send 2
    Else
        Send '`;'
}

$'::{
    If (getIfPinyinIMECandidateExist())
        Send 3
    Else
        Send '`''
}

$/::{
    If (getIfPinyinIMECandidateExist())
        Send 4
    Else
        Send '/'
}

