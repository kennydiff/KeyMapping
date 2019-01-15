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
;
; Debug action snippet: MsgBox You pressed Control-A while Notepad is active.

;--------------------------------------------------------------
; 以下是Hack CAPS LOCK to Hyper(Ctrl + Shift + Alt)的代码, Win键无法加入进去，很多windows的
; 快捷键不支持使用Win作为修饰符，，，很傻逼的微软。
;--------------------------------------------------------------
#NoEnv ; recommended for performance and compatibility with future autohotkey releases.
#UseHook
#InstallKeybdHook
#SingleInstance force
SendMode Input ;这句代码会导致 Ctrl + Win + up/down 无法在应用里响应热键,麻痹，调试了我好久。 这玩意还会导致 长按Capslock导致大写状态改变

;; deactivate capslock completely
SetCapslockState, AlwaysOff

;; remap capslock to hyper
;; if capslock is toggled, remap it to esc

;; note: must use tidle prefix to fire hotkey once it is pressed
;; not until the hotkey is released
~Capslock::
    ;; must use downtemp to emulate hyper key, you cannot use down in this case 
    ;; according to http://bit.ly/2fLyHHI, downtemp is as same as down except for ctrl/alt/shift/win keys
    ;; in those cases, downtemp tells subsequent sends that the key is not permanently down, and may be 
    ;; released whenever a keystroke calls for it.
    ;; for example, Send {Ctrl Downtemp} followed later by Send {Left} would produce a normal {Left}
    ;; keystroke, not a Ctrl{Left} keystroke
    ; {LWin DownTemp}  ;Stupid Widnows 不支持Win作为修饰符来定义日常热键
    Send {LCtrl DownTemp}{LShift DownTemp}{LAlt DownTemp}
    KeyWait, Capslock
    ; {LWin Up}
    Send {LCtrl Up}{LShift Up}{LAlt Up}
    if (A_PriorKey = "Capslock") {
        Send {Esc}
    }
return

; --------------------------------------------------------------
; new Shift & CapsLock by @KennyDiff 注意位置，必须在以上HyperKey实现的后面
; 否则会导致CapsLock灯混乱
; --------------------------------------------------------------
+CapsLock::CapsLock
; --------------------------------------------------------------

;; vim navigation with hyper 不用vim，所以这些热键暂时屏蔽
; ~Capslock & h:: Send {Left}
; ~Capslock & l:: Send {Right}
; ~Capslock & k:: Send {Up}
; ~Capslock & j:: Send {Down}

;; popular hotkeys with hyper
; ~Capslock & c:: Send ^{c}
; ~Capslock & v:: Send ^{v}

; --------------------------------------------------------------
; 重新定义了Win+R 为刷新，重载，所以用Hyper+R 替代之前的Win+R(运行)的热键
; --------------------------------------------------------------
~Capslock & r:: Send {LWin Down}{r}{LWin Up}

; #InstallKeybdHook
; #SingleInstance force
; SetTitleMatchMode 2
; SendMode Input

; --------------------------------------------------------------
; OS X system shortcuts
; --------------------------------------------------------------

; 将win+鼠标点击（Chrome里的常见操作，改为Ctrl + 左键）  
LWin & LButton::Send {RCtrl Down}{Click}{RCtrl Up}

; Make Ctrl + S work with cmd (windows) key
<#s::Send {LCtrl Down}{s}{LCtrl Up}

; Selecting
<#a::Send {LCtrl Down}{a}{LCtrl Up}

; Copying
<#c::Send {LCtrl Down}{c}{LCtrl Up}

; Pasting
<#v::Send {LCtrl Down}{v}{LCtrl Up}

; Cutting
<#x::Send {LCtrl Down}{x}{LCtrl Up}

; Opening
<#o::Send {LCtrl Down}{o}{LCtrl Up}

; Finding
<#f::Send {LCtrl Down}{f}{LCtrl Up}

; Undo
<#z::Send {LCtrl Down}{z}{LCtrl Up}

; Redo
<#y::Send {LCtrl Down}{y}{LCtrl Up}

; New tab
<#t::Send {LCtrl Down}{t}{LCtrl Up}

; close tab
<#w::Send {LCtrl Down}{w}{LCtrl Up}

; new windows by @KennyDiff
<#n::Send {LCtrl Down}{n}{LCtrl Up}

; 刷新/重载/Reload重定义 ，屏蔽了原始的Win+R(运行) by @KennyDiff
<#r::Send {LCtrl Down}{r}{LCtrl Up}

; Close windows (cmd + q to Alt + F4)
<#q::Send !{F4}


; --------------------------------------------------------------
; 将win10的虚拟桌面(win&tab)改为mac的ctrl + win  + up/down
; --------------------------------------------------------------
;这里要硬写为SendEvent 其他模式send 是之前定义的Input模式，会导致在编辑器/浏览器内无法全局的激活windows的虚拟桌面,参见 https://autohotkey.com/docs/commands/SendMode.htm
^#up::SendEvent, {LWin Down}{tab}{LWin Up} 
^#down::SendEvent, {LWin Down}{tab}{LWin Up}

; 实现win & tab 为以前的alt+tab效果
<#tab::AltTab

; --------------------------------------------------------------
; Hack输入法热键 为习惯的Win + Shift
; --------------------------------------------------------------
 LWin & LShift::#Space