@echo off
setlocal EnableDelayedExpansion

rem Use type command to read the content of apps.txt and pipe it to fzf
for /f "delims=" %%a in ('type D:\workspace\other\winconf\batch\fzf\a.txt ^| fzf --header="apps:"' ) do ( set "selectedApp=%%a" )

if "!selectedApp!"=="btm" ( btm )
if "!selectedApp!"=="PATH" ( PATH )
if "!selectedApp!"=="disableF1" ( disable_f1.bat )
endlocal
