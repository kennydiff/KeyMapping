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

SendMode Input

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
    ; {LWin DownTemp}
    Send {Ctrl DownTemp}{Shift DownTemp}{Alt DownTemp}
    KeyWait, Capslock
    ; {LWin Up}
    Send {Ctrl Up}{Shift Up}{Alt Up}
    if (A_PriorKey = "Capslock") {
        Send {Esc}
    }
return

;; vim navigation with hyper
~Capslock & h:: Send {Left}
~Capslock & l:: Send {Right}
~Capslock & k:: Send {Up}
~Capslock & j:: Send {Down}

;; popular hotkeys with hyper
~Capslock & c:: Send ^{c}
~Capslock & v:: Send ^{v}


; --------------------------------------------------------------
; new Shift & CapsLock by @KennyDiff
; --------------------------------------------------------------
+CapsLock::CapsLock
; --------------------------------------------------------------



; Hack 输入法热键 为习惯的Win + Shift
LWin & LShift::Send, #{Space}

; 将win10的虚拟桌面(win&tab)改为mac的ctrl + win  + up/down
^#up::Send {LWinDown}{tab}{LWinUp}
^#down::Send {LWinDown}{tab}{LWinUp}
; 实现win & tab 为以前的alt+tab效果
<#>tab::AltTab
;#tab::AltTab



; --------------------------------------------------------------
; media/function keys all mapped to the right option key
; --------------------------------------------------------------

;RAlt & F7::SendInput {Media_Prev}
;RAlt & F8::SendInput {Media_Play_Pause}
;RAlt & F9::SendInput {Media_Next}
;F10::SendInput {Volume_Mute}
;F11::SendInput {Volume_Down}
;F12::SendInput {Volume_Up}

; swap left command/windows key with left alt
;LWin::LAlt
;LAlt::LWin ; add a semicolon in front of this line if you want to disable the windows key

; Eject Key
;F20::SendInput {Insert}

; F13-15, standard windows mapping
;F13::SendInput {PrintScreen}
;F14::SendInput {ScrollLock}
;F15::SendInput {Pause}

; --------------------------------------------------------------
; OS X system shortcuts
; --------------------------------------------------------------

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

; reload by @KennyDiff
<#r::Send {LCtrl Down}{r}{LCtrl Up}
; 恢复之前的Win + R的运行 ->  Ctrl + Win +R 操作
<^#r::Send {LWin Down}{r}{LWin Up}

; Close windows (cmd + q to Alt + F4)
<#q::Send !{F4}

; Emacs-like text navigation
;<^a::Send {Home}
;<^e::Send {End}
;<^n::Send {Down}
;<^p::Send {Up}
;<^f::Send {Right}
;<^b::Send {Left}
;<^d::Send {Del}
;<^u::Send +{Home}{Del}
;<^k::Send +{End}{Del}

; --------------------------------------------------------------
; Custom mappings for special chars
; --------------------------------------------------------------

; --------------------------------------------------------------
; Application specific
; --------------------------------------------------------------

;--------------------------------------------------------------
; 防止人格分裂，，，用这样的代码来同步mac windows 键盘 这个改后会出很多问题，直接map alt的热键好了
;--------------------------------------------------------------
; LAlt::LWin
; LWin::LAlt

; 将win+鼠标点击（Chrome里的常见操作，改为Ctrl + 左键）
LWin & LButton::
    Send {RCtrl Down}{Click}{RCtrl Up}
return