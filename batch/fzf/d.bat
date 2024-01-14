@echo off
setlocal EnableDelayedExpansion

rem Use type command to read the content of apps.txt and pipe it to fzf
for /f "delims=" %%a in ('type D:\workspace\other\winconf\batch\fzf\d.txt ^| fzf --header="directories:"' ) do ( set "selected=%%a" )

if "!selected!"=="C:\" ( cd /d C:\ )
if "!selected!"=="D:\" ( cd /d C:\ )
if "!selected!"=="E:\" ( cd /d C:\ )
if "!selected!"=="%USERPROFILE%" ( cd /d %USERPROFILE%  )
if "!selected!"=="%APPDATA%" ( cd /d %APPDATA% )
if "!selected!"=="kaveh" ( cd /d D:\workspace\c\01_active\kaveh\ )
endlocal
