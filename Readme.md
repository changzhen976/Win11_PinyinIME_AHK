# AutoHoldKey Script for Microsoft IME


Requires AutoHotkey v2.0

----

## 1. AutoWinSpace.ahk

Detect active window, shift IME according to config file

 config file: `./ini/ahkIMEAutoShiftCfg.ini`
format:
```
 [en]
 exe name1
 exe name2
 ...
 [zh] 
 exe name3
 exe name4
 ...   
```

 **notice:** comment line is not supported yet

----

## 2. EasyCandidate4OldPinyinIME.ahk

Map some keys' output while using Pinyin typing for old version IME.

```
 ;  =>  2
 '  =>  3
 /  =>  4
```

---

## 3. MSPinyinIME_EasyCandidate.ahk

Map some keys' output while using Pinyin typing for Win11 newest IME.
```
 ;  =>  2
 '  =>  3
 /  =>  4
```
`WinExsit()` method doesn't work any more whitch can't catch candidate pop-up in resent win11 updata.
use `ImageSearch()` to Search for ![win11PinyinCandidateWindowIcon](/pic/Win11PinyinIME_logo.png) near the input cursor (*silly but work*) to detect if using Pinyin
> *`/pic/Win11PinyinIME_logo.png` replaced by your own screen catch*

***Thanks for [mudssky's](https://github.com/mudssky/myAHKScripts) code***

> config file: `./ini/forceMapExeList.ini`
> 
> force mapping key in case `ImageSearch()` doesn't work well in some apps
---

## 4. Release-Generate Script

generate steps:
1. copy config file to release folder
2. add `ahk2exe` to PATH
2. `runwait` use cmdline to call `Ahk2Exe.exe` generate exe 

