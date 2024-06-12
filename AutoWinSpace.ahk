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
    ; MsgBox A_LoopReadLine
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
}  


;---------------------------------------------------------------
; wait activeGroup apps active, match en or zh switch IME
;---------------------------------------------------------------
Loop{
    WinWaitActive "ahk_group activeAppGroup" 
    currentWinID:= WinGetID("A")        ; get currentWinID
    
    if WinActive("ahk_group enAppGroup")
        switchIMEbyID(IMEmap["en"])  
    Else
        switchIMEbyID(IMEmap["zh"])
  
    
    WinWaitNotActive(currentWinID)      ; current window not active, continue next loop
}
