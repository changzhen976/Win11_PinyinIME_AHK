;-------------------------------------------------------------------------------
; AutoHotKey V2 
;
;  Detect active window, auto switch IME
;
;
;  Author: Liu Changzhen
;  Version: 0.8
;-------------------------------------------------------------------------------


#Requires AutoHotkey v2.0
; Set detect hidden window
DetectHiddenWindows True
;------------------------
; INCLUDES
;------------------------
#Include <ImeOpFunc>



;-------------------------------------------------
; load cfg file addGroup
;-------------------------------------------------
tempStr := ""
zhMatchWord := "[zh]"
enMatchWord := "[en]"
enFlag := 1

Loop read, A_ScriptDir '\ini\ahkIMEAutoShiftCfg.ini'
{
    If (StrCompare(enMatchWord, A_LoopReadLine) = 0)
    {
        enFlag := 1
    }    
    else if (StrCompare(zhMatchWord, A_LoopReadLine) = 0)
        enFlag := 0
    else
    {
        tempStr := "ahk_exe " . A_LoopReadLine . ".exe"

        GroupAdd "activeAppGroup", tempStr ; wheh activeGroup active detect en or zh

        if (enFlag = 1)
        {
            GroupAdd "enAppGroup", tempStr ; if match enGroup Switch to eng IME
        }                                  
    }
}
else
{
    MsgBox "Address List.txt was completely empty or not found."
    Exit ; no cfg file, exit
}  


;---------------------------------------------------------------
; wait activeGroup apps active, match en or zh switch IME
;---------------------------------------------------------------
Loop{
    WinWaitActive "ahk_group activeAppGroup"
    try{
        currentWinID:= WinGetID("A")        ; get currentWinID
    }catch Error as err{
        ;@Ahk2Exe-IgnoreBegin
        MsgBox "An error was thrown from `'getCrtWinID`'!`nSpecifically: " err.Message
        ;@Ahk2Exe-IgnoreEnd
        Continue ; next loop
    }   
    
    if WinActive("ahk_group enAppGroup")
        switchIMEbyID(IMEmap["en"])  
    Else{
        switchIMEbyID(IMEmap["zh"])
        Sleep 25
        if isEnglishMode()
            send "{Shift}"
    }
    
    WinWaitNotActive(currentWinID)      ; current window not active, continue next loop
}
