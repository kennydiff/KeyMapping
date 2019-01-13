;--------------------------------------------------------------
; 注意这个文件的换行符，在windows里得用windows的回车换行符(CRLF)，否则有中文注释就会无法运行。
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

#InstallKeybdHook
#SingleInstance force
SetTitleMatchMode 2
SendMode Input

;--------------------------------------------------------------
; 防止人格分裂，，，用这样的代码来同步mac windows 键盘 这个改后会出很多问题，直接map alt的热键好了
;--------------------------------------------------------------
; LAlt::RWin
; LWin::RAlt
; LControl::RWin
; LAlt::LWin
; LWin::LAlt

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

; Close windows (cmd + q to Alt + F4)
<#q::Send !{F4}

; minimize windows
<#m::WinMinimize,a

; new CapsLock by @KennyDiff
<^CapsLock::CapsLock

; Emacs-like text navigation
<^a::Send {Home}
<^e::Send {End}
<^n::Send {Down}
<^p::Send {Up}
<^f::Send {Right}
<^b::Send {Left}
<^d::Send {Del}
<^u::Send +{Home}{Del}
<^k::Send +{End}{Del}

; --------------------------------------------------------------
; Custom mappings for special chars
; --------------------------------------------------------------

; --------------------------------------------------------------
; Application specific
; --------------------------------------------------------------


;--------------------------------------------------------------
; 以下是Hack CAPS LOCK的代码
;--------------------------------------------------------------
g_LastCtrlKeyDownTime := 0
g_AbortSendEsc := false
g_ControlRepeatDetected := false

*CapsLock::
    if (g_ControlRepeatDetected)
    {
        return
    }

    send,{Ctrl down}
    g_LastCtrlKeyDownTime := A_TickCount
    g_AbortSendEsc := false
    g_ControlRepeatDetected := true
    return

*CapsLock Up::
    send,{Ctrl up}
    g_ControlRepeatDetected := false
    if (g_AbortSendEsc)
    {
        return
    }
    current_time := A_TickCount
    time_elapsed := current_time - g_LastCtrlKeyDownTime
    if (time_elapsed <= 250)
    {
        SendInput {Esc}
    }
    return

~*^a::
~*^b::
~*^c::
~*^d::
~*^e::
~*^f::
~*^g::
~*^h::
~*^i::
~*^j::
~*^k::
~*^l::
~*^m::
~*^n::
~*^o::
~*^p::
~*^q::
~*^r::
~*^s::
~*^t::
~*^u::
~*^v::
~*^w::
~*^x::
~*^y::
~*^z::
~*^1::
~*^2::
~*^3::
~*^4::
~*^5::
~*^6::
~*^7::
~*^8::
~*^9::
~*^0::
~*^Space::
~*^Backspace::
~*^Delete::
~*^Insert::
~*^Home::
~*^End::
~*^PgUp::
~*^PgDn::
~*^Tab::
~*^Return::
~*^,::
~*^.::
~*^/::
~*^;::
~*^'::
~*^[::
~*^]::
~*^\::
~*^-::
~*^=::
~*^`::
~*^F1::
~*^F2::
~*^F3::
~*^F4::
~*^F5::
~*^F6::
~*^F7::
~*^F8::
~*^F9::
~*^F10::
~*^F11::
~*^F12::

    g_AbortSendEsc := true
    return