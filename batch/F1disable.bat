@echo off

REM Run this file as Administrator

taskkill /f /im HelpPane.exe
takeown /f c:\windows\HelpPane.exe
icacls c:\windows\HelpPane.exe /deny Everyone:(X)