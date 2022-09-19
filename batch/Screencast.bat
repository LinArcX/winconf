@echo off
cd /d "%USERPROFILE%\Desktop"
start ffmpeg -f gdigrab -framerate 30 -i desktop output.mkv
start ffmpeg -f dshow -i audio="Headset (BT Hands-Free AG Audio)" output.m4a