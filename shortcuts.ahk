; SUSPEND HOTKEYS = alt+s
!s::
{
    Suspend, toggle
    Return
}

;OPEN SPECIFIC FOLDER IN FILE EXPLORER = win+e
#e::
{
    Run, explorer.exe "C:\sasidharan_gs"
    Return
}

; BITWARDEN = win+b
#b::
{
    Run "C:\Users\sasidharan.govindan\AppData\Local\Programs\Bitwarden\Bitwarden.exe"
    Return
}

; VIVALDI = win+v
#v::
{
    Run "C:\Users\sasidharan.govindan\AppData\Local\Vivaldi\Application\vivaldi.exe"
    Return
}

; FIREFOX = win+f
#f::
{
    Run "C:\Users\sasidharan.govindan\AppData\Local\Mozilla Firefox\firefox.exe"
    Return
}

; CONTROL PANEL = win+s
#s::
{
    Run "control"
    Return
}

; VSCODE = win+c
#c::
{
    Run "code"
    Return
}

; CLOSE WINDOWS (alt+F4) = alt+4
!4::
{
    Send, !{F4} ; Send Alt+F4 keystroke
    Return
}

; MIDDLE CLICK = ctrl+v
MButton::
{
    Send, {Ctrl Down}v{Ctrl Up} ; Simulate "Ctrl+V" key combination
    Return
}


; GOOGLE SELECTION = win+g
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

; CONTEXT SENSITIVE TERMINAL = win+t
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