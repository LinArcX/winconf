#Persistent
; maximize special windows
SetTitleMatchMode, 2 ;A window's title can contain WinTitle anywhere inside

GroupAdd, WinMaximize, ahk_exe cmd.exe
GroupAdd, WinMaximize, ahk_exe far.exe
GroupAdd, WinMaximize, ahk_exe pwsh.exe
GroupAdd, WinMaximize, ahk_exe nvim.exe
GroupAdd, WinMaximize, ahk_exe uget.exe
GroupAdd, WinMaximize, ahk_exe skype.exe
GroupAdd, WinMaximize, ahk_class Notepad
GroupAdd, WinMaximize, ahk_exe firefox.exe
GroupAdd, WinMaximize, ahk_exe musikcube.exe
GroupAdd, WinMaximize, ahk_exe imageglass.exe
GroupAdd, WinMaximize, ahk_exe transmission.exe

SetTimer, Max, 1
Return

Max:
IfWinActive, ahk_group WinMaximize
{
	WinGet, MinMax, MinMax
	WinGet, ID, ID
	If !MinMax And !MinMax%ID%
	{
		WinMaximize
		MinMax%ID% := True
	}
}
Return

; ^ = Ctrl, ! = Alt, + = Shift, # = Win
+Up::WinMaximize, A
+Down::WinRestore, A
+Left::WinMinimize, A

#enter::
    run, "C:\Program Files\PowerShell\7\pwsh.exe"
    SetWorkingDir, D:\
Return
#NoTrayIcon

!f::run, "C:\Program Files\Far Manager\Far.exe \\"D:\\\" \\"E:\\\""
#NoTrayIcon

!b::run, "C:\Program Files\Mozilla Firefox\firefox.exe"
#NoTrayIcon

!e::run, "C:\tools\neovim\Neovim\bin\nvim.exe"
#NoTrayIcon
