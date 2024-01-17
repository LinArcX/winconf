:: Check if the script is run interactively
@echo off

if "%cmdcmdline:~0,6%" == "cmd /c" goto :end

:GitCommit
  setlocal EnableDelayedExpansion
    :: echo hi saeed.
 
    :: Prompt the user for a commit message
    set /p "message=Enter commit message: "
    
    :: Commit using the provided message
    git commit -m "!message!"
  endlocal
EXIT /B 0

:: :firstMethodName
::     SETLOCAL ENABLEDELAYEDEXPANSION
::         SET firstArgumentPassedIn=%~1
::         SET secondArgumentPassedIn=%~2
::         
::         ECHO %firstInstanceVariable%
::         ECHO "The first argument passed in was %firstArgumentPassedIn%"
::         ECHO "The second argument passed in was %secondArgumentPassedIn%"
::     ENDLOCAL
:: EXIT /B 0

:end
