@echo off

REM General
DOSKEY ll = ls -ltrah

REM Git
DOSKEY gii=git init
DOSKEY gia=git add .
DOSKEY gis=git status
DOSKEY gil=git log
DOSKEY gib=git branch --all
DOSKEY gid=git diff | delta
DOSKEY gidd=git difftool
DOSKEY gic=call functions.bat :GitCommit
DOSKEY gip=git push --all

:: DOSKEY gr='f(){ git rm -r --cached $1; }; f'
:: DOSKEY grsoft='f(){ git reset --hard HEAD~$1; }; f'
:: DOSKEY grhard='f(){ git reset --soft HEAD~$1; }; f'
