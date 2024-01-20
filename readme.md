# What this is:
This Autohotkey (.ahk) file contains all the shortcuts I use in windows to get functionality in-line with my linux install.
<br>
<hr>

## Shortcuts: 

1. Toggle Hotkey functionality
2. Open specified folder on "win+e"
3. Start TOR service (@ port 9050) and send the terminal to the next virtual desktop
4. Start TOR browser
5. Open Bitwarden
6. Open Vivaldi
7. Open Firefox
8. Open VS-code
9. Open the Control Panel
10. Close windows with "alt+4" instead of "alt+F4" (useful when the function row is set to special functions)
11. Middle click to paste
12. Google search any selected string
13. Open (folder) context sensitive Terminal

(Modify application locations (and applications) for 3,4,5,6,7,9 in accordance with your system for them to work as intended)
<br>

## Window Switchers: 
1. Switch to specified desktop number
2. Switch to neighbouring desktops (rolls-back if no more desktops are present)
3. Create and delete desktops
4. Move current window to specified desktop
5. Move current window to specified desktop and stay with the window
<br>
<hr>
<br>

# Requirements: 
- Autohotkey v1
- VirtualDesktopAccessor.dll (file included with project)
<br>
<hr>
<br>

# Auto-Startup instructions: 
- Open the "Run" dialog box with "win+r"
- Execute "shell:startup"
- Paste the .ahk file in this location
- Enjoy script autostart on boot