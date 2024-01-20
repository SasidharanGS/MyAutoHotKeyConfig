; Run "shortcuts_and_window_switcher.ahk" after changing this config file


; REFERENCE
; !  ==  Alt
; +  ==  Shift
; ^  ==  Ctrl
; #  ==  Win
; EXAMPLE:
; CapsLock & n::switchDesktopToRight()   <- <CapsLock> + <N> will switch to the next desktop (& is necessary when using non-modifier key such as CapsLock)


; WINDOW SWITCHING:
CapsLock & 1::switchDesktopByNumber(1)
CapsLock & 2::switchDesktopByNumber(2)
CapsLock & 3::switchDesktopByNumber(3)
CapsLock & 4::switchDesktopByNumber(4)
CapsLock & 5::switchDesktopByNumber(5)
CapsLock & 6::switchDesktopByNumber(6)
CapsLock & 7::switchDesktopByNumber(7)
CapsLock & 8::switchDesktopByNumber(8)
CapsLock & 9::switchDesktopByNumber(9)

CapsLock & n::switchDesktopToRight()
CapsLock & p::switchDesktopToLeft()
CapsLock & tab::switchDesktopToLastOpened()

CapsLock & c::createVirtualDesktop()
CapsLock & d::deleteVirtualDesktop()

CapsLock & q::MoveCurrentWindowToDesktop(1)
CapsLock & w::MoveCurrentWindowToDesktop(2)
CapsLock & e::MoveCurrentWindowToDesktop(3)
CapsLock & r::MoveCurrentWindowToDesktop(4)
CapsLock & t::MoveCurrentWindowToDesktop(5)
CapsLock & y::MoveCurrentWindowToDesktop(6)
CapsLock & u::MoveCurrentWindowToDesktop(7)
CapsLock & i::MoveCurrentWindowToDesktop(8)
CapsLock & o::MoveCurrentWindowToDesktop(9)

CapsLock & Right::MoveCurrentWindowToRightDesktop()
CapsLock & Left::MoveCurrentWindowToLeftDesktop()


; KEYBOARD SHORTCUTS
;1 SUSPEND HOTKEYS = alt+s
!s::
{
    Suspend, toggle
    Return
}

;2 OPEN SPECIFIC FOLDER IN FILE EXPLORER = win+e
#e::
{
    Run, explorer.exe "C:\sasidharan_gs"
    Return
}

;3 OPEN TOR SERVICE IN NEXT VIRTUAL DESKTOP = win+\
#\::
{
    Run "C:\sasidharan_gs\Tor Browser\Browser\TorBrowser\Tor\tor.exe"
    Sleep, 1000
    MoveCurrentWindowToRightDesktop()
    Return
}

;4 TOR BROWSER = win+w
#w::
{
    Run "C:\sasidharan_gs\Tor Browser\Start Tor Browser"
    Return
}

;5 BITWARDEN = win+b
#b::
{
    Run "C:\Users\sasidharan.govindan\AppData\Local\Programs\Bitwarden\Bitwarden.exe"
    Return
}

;6 VIVALDI = win+v
#v::
{
    Run "C:\Users\sasidharan.govindan\AppData\Local\Vivaldi\Application\vivaldi.exe"
    Return
}

;7 FIREFOX = win+f
#f::
{
    Run "C:\Users\sasidharan.govindan\AppData\Local\Mozilla Firefox\firefox.exe"
    Return
}

;8 VSCODE = win+c
#c::
{
    Run "code"
    Return
}

;9 CONTROL PANEL = win+s
#s::
{
    Run "control"
    Return
}



;10 CLOSE WINDOWS (alt+F4) = alt+4
!4::
{
    Send, !{F4} ; Send Alt+F4 keystroke
    Return
}

;11 MIDDLE CLICK = ctrl+v
MButton::
{
    Send, {Ctrl Down}v{Ctrl Up} ; Simulate "Ctrl+V" key combination
    Return
}


;12 GOOGLE SELECTION = win+g
#g::
{
    MyClip := ClipboardAll
    Clipboard = ; empty the clipboard
    Send, ^c
    ClipWait, 2
    if ErrorLevel  ; ClipWait timed out.
    {
        Return
    }
    if RegExMatch(Clipboard, "^[^ ]*\.[^ ]*$")
    {
        Run "C:\Users\sasidharan.govindan\AppData\Local\Vivaldi\Application\vivaldi.exe" %Clipboard%
    }
    else  
    {
        ; Modify some characters that screw up the URL
        ; RFC 3986 section 2.2 Reserved Characters (January 2005):  !*'();:@&=+$,/?#[]
        StringReplace, Clipboard, Clipboard, `r`n, %A_Space%, All
        StringReplace, Clipboard, Clipboard, #, `%23, All
        StringReplace, Clipboard, Clipboard, &, `%26, All
        StringReplace, Clipboard, Clipboard, +, `%2b, All
        StringReplace, Clipboard, Clipboard, ", `%22, All
        Run % "https://www.google.com/search?hl=en&q=" . clipboard ; uriEncode(clipboard)
    }
    Clipboard := MyClip
    Return
}

;13 CONTEXT SENSITIVE TERMINAL = win+t
; SetTitleMatchMode, 2 ; Match the window title partially
#IfWinExist ahk_exe explorer.exe ; Check if Windows Explorer is open
#t::
{
    Send, !d ; Select the current folder path in Windows Explorer
    Send, ^c ; Copy the folder path to clipboard
    ClipWait ; Wait for the clipboard to contain the text
    Run, cmd.exe /K cd "%Clipboard%" ; Open Command Prompt in the current folder
    Return
}
#IfWinNotExist ahk_exe explorer.exe ; If Windows Explorer is not open
#t::
{
    Run, cmd.exe ; Open Command Prompt normally
    Return
}