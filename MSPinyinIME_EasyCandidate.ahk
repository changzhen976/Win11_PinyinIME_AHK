;-------------------------------------------------------------------------------
; AutoHotKey V2
;
;  map `;` `'` `/` as 2 3 4 while Microsoft-Pinyin-IME candidate-window popping up
;
;
;  Author: Liu Changzhen
;  Version: 0.6
;-------------------------------------------------------------------------------

#Requires AutoHotkey v2.0

;------------------------
; INCLUDES
;------------------------
#Include <ImeOpFunc>

;------------------------------------------------
; check current IME if Pinyin
; if is, return true
;------------------------------------------------
getCurrentIMEIsPinyin(){
   
    InputLocaleID := getCurrentIMEID()

    if InputLocaleID = IMEmap["zh"]
        Return True
    Else
        Return False
    
}

;---------------------------------------------------
; in some apps 'ImageSearch()' doesn't work well
; *F**k Tencent*
;---------------------------------------------------
Loop read, A_ScriptDir '\ini\forceMapExeList.ini'
{ 
    tempStr := "ahk_exe " . A_LoopReadLine . ".exe"
    GroupAdd "ForceMapAppGroup", tempStr ; add force map exe group
}
else
{
    ;@Ahk2Exe-IgnoreBegin
    MsgBox "Address forceMapExeList.ini was completely empty or not found."
    ;@Ahk2Exe-IgnoreEnd

    Exit ; no cfg file, exit
}  

ifForceMap(){
    if WinActive("ahk_group ForceMapAppGroup")
        return True  
    Else
        return False
}

;----------------------------------------------------
; check if map
; if detect return true
;----------------------------------------------------
CoordMode "Caret" ; , "Window" ; set ImageSearch mode based Caret
getIfPinyinIMECandidateExist(){
    
    ; get current IME if Pinyin
    if getCurrentIMEIsPinyin()
    {
        if ImageSearch(&FoundX, &FoundY, 0, 0, 800, 300, A_ScriptDir '\pic\Win11PinyinIME_logo.png') or ifForceMap() ;search IME logo
        {
            ; ToolTip "X" FoundX " Y" FoundY, FoundX, FoundY - 20
            return True      ; find logo img return true
        }
        Else
        {
            Return False
        }
    }
    Else
    {
        Return False
    }      
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

