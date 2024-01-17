@echo off

set "selected=%TEMP%dtemp.txt"
type D:\workspace\other\winconf\batch\fzf\f.txt | fzf > %selected%

REM Read the content of tmp.txt
for /f "usebackq delims=" %%a in ("%selected%") do ( set "file=%%a" )

REM Open the specified file with nvim
nvim "%file%"

REM for /f "delims=" %%i in (d.txt) do cd %%i
