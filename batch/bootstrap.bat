@echo off
scoop install gsudo uutils-coreutils 7zip alacritty brave flameshot mpv nomacs okular ffmpeg speedcrunch unar winrar youtube-dl
scoop install clavier-plus clink clink-completions clink-flex-prompt
scoop install git fd grep llvm neovim lite-xl fzf dependencies openssh regdllview scc ripgrep ugrep

choice /C:q /N /M "Press 'q' to quit."
if errorlevel 1 goto continue
exit /b 0

:continue
pause
