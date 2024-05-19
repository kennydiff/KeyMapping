;--------------------------------------------------------------
; 注意这个文件的换行符，在windows里得用windows的回车换行符(CRLF)，否则有中文注释就会无法运行。
; 先运行 LWin-LAlt 通过注册表交换 LWin & LAlt ， AutoHotkey 里面的交换总是无法完整交换，有很多缺陷。
;--------------------------------------------------------------

;-----------------------------------------
; Mac keyboard to Windows Key Mappings
;=========================================

; --------------------------------------------------------------
; NOTES
; --------------------------------------------------------------
; ! = ALT
; ^ = CTRL
; + = SHIFT
; # = WIN

; Debug action snippet: MsgBox You pressed Control-A while Notepad is active.

;--------------------------------------------------------------
; remap Capslock key in a way that pressing and releasing it registers as Escape key but pressing and holding it registers as Ctrl key modifier
;--------------------------------------------------------------
; Remap Capslock to Esc & Ctrl :  Requires AutoHotkey v2.0
Capslock::Ctrl
Capslock Up::{
    Send "{Ctrl Up}"
    If (A_PriorKey = "Capslock") ; if Capslock was pressed alone
        Send "{Esc}"
}


; --------------------------------------------------------------
; new Shift & CapsLock by @KennyDiff 注意位置，必须在以上HyperKey实现的后面, 否则会导致CapsLock灯混乱
; Capslock + ` 转义为 Capslock
; --------------------------------------------------------------
+LAlt::CapsLock
; ~Capslock & `:: Capslock  ; 旧的实现，放弃


; --------------------------------------------------------------
;; vim navigation with hyper 不用vim，所以这些热键暂时屏蔽
; ~Capslock & h:: Send {Left}
; ~Capslock & l:: Send {Right}
; ~Capslock & k:: Send {Up}
; ~Capslock & j:: Send {Down}


; --------------------------------------------------------------
; Hack输入法热键 为习惯的Win + Shift , ~ 表示精确匹配，如果同时按了其他键则不进入交换逻辑 
; #todo# 如果ctrl + shift +t in chrome ,,仍然会导致输入法逻辑混乱，并且按着不放，会频繁切换输入法
; --------------------------------------------------------------
; ^Space::#Space


; --------------------------------------------------------------
; 将Chrome的ctrl + 左右，改为 alt+左右(后退，前进)
; --------------------------------------------------------------
; V1toV2: Added Bracket before hotkey or Hotstring
^Left::
{ ; V1toV2: Added bracket
    if WinActive("ahk_class Chrome_WidgetWin_1")
        Send("{RAlt Down}{Left}{RAlt Up}")
    else
        Send("{RCtrl Down}Left}{RCtrl Up}")
	return
} ; V1toV2: Added Bracket before hotkey or Hotstring

^Right::
{ ; V1toV2: Added bracket
    if WinActive("ahk_class Chrome_WidgetWin_1")
        Send("{RAlt Down}{Right}{RAlt Up}")
    else
        Send("{RCtrl Down}Right}{RCtrl Up}")
	return
} ; V1toV2: Added Bracket before hotkey or Hotstring


; --------------------------------------------------------------
; Close windows (cmd + q to Alt + F4)
; --------------------------------------------------------------
<^q::!F4


; --------------------------------------------------------------
; switch backspace with \
; --------------------------------------------------------------
Backspace::\
\::Backspace


; --------------------------------------------------------------
; ctrl + backspace change to del
; --------------------------------------------------------------
^\::Del


; --------------------------------------------------------------
; 将win10的虚拟桌面(win&tab)改为mac的ctrl + win  + up/down
; --------------------------------------------------------------
;这里要硬写为SendEvent 其他模式send 是之前定义的Input模式，会导致在编辑器/浏览器内无法全局的激活windows的虚拟桌面,参见 https://autohotkey.com/docs/commands/SendMode.htm
; ^#up::SendEvent, {LWin Down}{tab}{LWin Up} 
; ^#down::SendEvent, {LWin Down}{tab}{LWin Up}

; --------------------------------------------------------------
; 实现win & tab 为以前的alt+tab效果
; --------------------------------------------------------------
<^Tab::AltTab    ; 这个反向的shift已经自带了? 貌似方向还是正的
; <!tab::Send("{LCtrl Down}{tab}{LCtrl Up}")  ; ! == Alt , alt + tab  为Windows默认的定义，改后的alt建在最外面，macOS是HyperKey 所以不理这个功能了。

; --------------------------------------------------------------
; `^+↓`映射为`Windows`的`Enter`
; --------------------------------------------------------------
^Down::Enter

