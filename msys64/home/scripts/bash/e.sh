#!/bin/bash

commands=("Zzz(lock)" "logout" "restart" "poweroff") 

selected=$(printf '%s\n' "${commands[@]}" | fzf --header="apps:")

case $selected in
  "Zzz(lock)")
    Rundll32.exe user32.dll,LockWorkStation ;;
  "logout")
    shutdown /l ;;
  "restart")
    shutdown -r -t 0 ;;
  "poweroff")
    shutdown /p /f ;;
  *) ;;
esac
 
 
