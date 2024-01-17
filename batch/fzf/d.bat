@echo off

set "selected=%TEMP%dtemp.txt"
type D:\workspace\other\winconf\batch\fzf\d.txt | fzf > %selected%

REM Read the content of tmp.txt
for /f "usebackq delims=" %%a in ("%selected%") do ( set "directory=%%a" )

REM Switch to the specified directory
cd /d "%directory%"

REM for /f "delims=" %%i in (d.txt) do cd %%i
