@echo off

   cd /d "%USERPROFILE%\Desktop"
    start ffmpeg -f gdigrab -framerate 30 -i desktop %%s.mkv
    start ffmpeg -f dshow -i audio="Headset (BT Hands-Free AG Audio)" %%s.m4a
