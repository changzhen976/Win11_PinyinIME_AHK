# AutoHoldKey Script for Microsoft IME
----

Requires AutoHotkey v2.0


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


## 2. MSPinyinIME_EasyCandidate.ahk

Map some keys' output while using Pinyin typing
```
 ;  =>  2
 '  =>  3
 /  =>  4
```
`WinExsit()` method doesn't work any more witch can't catch candidate pop-up in resent win11 updata.
use `ImageSearch()` to Search for ![win11PinyinCandidateWindowIcon](/pic/Win11PinyinIME_logo.png) near the input cursor (*silly but work*) to detect if using Pinyin

> config file: `./ini/forceMapExeList.ini`
> 
> force mapping key in case `ImageSearch()` doesn't work well in some apps
---
