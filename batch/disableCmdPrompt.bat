@echo off

:: setlocal EnableDelayedExpansion
REG QUERY "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Command Processor" /v "AutoRun"

set /p answer="Continue(y,n)? "

if "%answer%"=="y" (
  echo "Setting AutoRun to cls ..."
  REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Command Processor" /v "AutoRun" /t REG_MULTI_SZ /d "cls" /f
)

:: endlocal
