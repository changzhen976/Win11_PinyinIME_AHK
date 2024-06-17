/*
windows自带输入法的id,可以通过调用windows api GetKeyboardLayout来获取
微软拼音输入法 134481924
微软日文输入法 68224017
微软英文输入法 67699721 
*/
IMEmap:=Map(
    "zh",134481924,
    "jp",68224017,
    "en",67699721
)

; 获取当前激活窗口所使用的IME的ID
getCurrentIMEID(){
    winID:=winGetID("A")
    ThreadID:=DllCall("GetWindowThreadProcessId", "UInt", WinID, "UInt", 0)
    InputLocaleID:=DllCall("GetKeyboardLayout", "UInt", ThreadID, "UInt")
    return InputLocaleID
}
; 使用IMEID激活对应的输入法
switchIMEbyID(IMEID){
    try{
        winTitle:=WinGetTitle("A")
    }catch Error as err{
        MsgBox "An error was thrown!`nSpecifically: " err.Message
    }else{
        PostMessage(0x50, 0, IMEID,, WinTitle )
    }
    
}

; 可以用于判断微软拼音是否是英文模式
isEnglishMode(){
    hWnd := WinGetID("A")
    result := SendMessage(
        0x283, ; Message : WM_IME_CONTROL
        0x001, ; wParam : IMC_GETCONVERSIONMODE
        0, ; lParam ： (NoArgs)
        , ; Control ： (Window)
        ; 获取当前输入法的模式
        ; Retrieves the default window handle to the IME class.
        "ahk_id " DllCall("imm32\ImmGetDefaultIMEWnd", "Uint", hWnd, "Uint")
    )
    ; DetectHiddenWindows Fasle
    ; 返回值是0表示是英文模式，其他值表明是中文模式
    return result == 0
}


