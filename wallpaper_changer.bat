@echo off
set "imageToDelete=CachedImage_1920_1080_POS2.jpg"
set "cacheLocation=C:\Users\sasidharan.govindan\AppData\Roaming\Microsoft\Windows\Themes\CachedFiles"
set "wallpaperLocation=C:\Users\sasidharan.govindan\sasidharan_gs\useless\wallpapers"

REM Check if the image to delete exists
if exist "%cacheLocation%\%imageToDelete%" (
    REM Delete the image
    del "%cacheLocation%\%imageToDelete%"
)

REM Get a random image from wallpaperLocation
setlocal enabledelayedexpansion
set "randomImage="
for /f %%a in ('dir /b /a-d "%wallpaperLocation%\*" ^| find /c /v ""') do (
    set /a "randNum=%%a * %random% / 32768 + 1"
)
for /f "skip=%randNum% delims=" %%a in ('dir /b /a-d "%wallpaperLocation%\*"') do (
    set "randomImage=%%a"
    goto :ExitLoop
)
:ExitLoop
endlocal & set "randomImage=%randomImage%"

REM Rename the selected image to match the deleted image
if defined randomImage (
    copy "%wallpaperLocation%\%randomImage%" "%cacheLocation%" >NUL
    ren "%cacheLocation%\%randomImage%" "%imageToDelete%"
)
