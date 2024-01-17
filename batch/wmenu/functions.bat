@echo off

:: Check if the script is run interactively
if "%cmdcmdline:~0,6%" == "cmd /c" goto :end

:GitCommit
  setlocal EnableDelayedExpansion
    REM Prompt the user for a commit message
    set /p "message=Enter commit message: "
    
    REM Commit using the provided message
    git commit -m "!message!"
  endlocal
EXIT /B 0

:end
