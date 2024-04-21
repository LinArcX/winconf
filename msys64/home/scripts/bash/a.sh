#!/bin/bash

commands=("brave" "vokoscreenNG" "ntop" "qalc" "msys2" "msys2 ucrt64" "msys2 mingw64" "msys2 clang64" 
  "HuionTablet" "qbittorrent" "kdenlive" "xournal++" "Kensington" "Vial" "LibreOffice-Write"
  "window detective" "dependencies" "regedit" "paint"
  "system properties" "system information" "system configuration" "control panel" "programs and features" "services"
  "network adapters" "date and time" "power options" "resource monitor" "performance monitor" "remote desktop" "component services"
  "event viewer" "firewall" "local users/groups" "device manager" "mouse settings" "computer management" "advanced user accounts"
  "group policy editor" "malicious software removal tool"
  "cpu usage" "memory usage" "arduino" "set proxy" "unset proxy" "aliases" "keybindings" "functions" "PATH"
  "fontpreview" "fonts(fc-list)" "update font database" "python3"
  "directory size(du -ch -d1)" "fs disk usage (df)"
  "ip local" "ip external" "dns" "ping" "network device (ip link)" "interfaces (ifconfig -a)" "ip rule" "routing table(netstat -anr)"
  "tcp/udp open ports (netstat -tlnup)" "unix sockets" "route list(ip route list)" "wireless devices enable/disable status"
  "calendar(current month)" "calendar(previous/current/next month)" "calendar(full year)"
  "weather(current city - simple)" "weather(current city - advance)" "weather(enter city - simple)" "weather(enter city - advance)"
  "timezone(current city)" "timezone(other cities)" 
  "city" "country" "lat/lon" "isp" "isp organization"
  )
selected=$(printf '%s\n' "${commands[@]}" | fzf --header="apps:")

## Trim video using ffmpeg
# ffmpeg -ss 00:00:00 -to 00:28:37 -i 2023-06-25\ 10-20-01.mkv -c copy first.mp4
# ffmpeg -ss 00:31:07 -to 00:51:20 -i 2023-06-25\ 10-20-01.mkv -c copy second.mp4
# ffmpeg -i first.mp4 -i second.mp4 -filter_complex "[0:v:0][0:a:0][1:v:0][1:a:0]concat=n=2:v=1:a=1[outv][outa]" -map "[outv]" -map "[outa]" output.mp4

case $selected in
  "brave")
    /c/Program\ Files/BraveSoftware/Brave-Browser/Application/brave.exe &;;
  "vokoscreenNG")
    /c/Users/saeed/scoop/apps/vokoscreenng-np/current/vokoscreenNG.exe &;;
  "ntop")
    ntop ;;
  "qalc")
    qalc ;;
  "msys2")
    /c/msys64/msys2.exe &;;
  "msys2 ucrt64")
    /c/msys64/ucrt64.exe &;;
  "msys2 mingw64")
    /c/msys64/mingw64.exe &;;
  "msys2 clang64")
    clang64.exe &;;
  "HuionTablet")
    /c/Program\ Files/HuionTablet/HuionTablet.exe & ;;
  "qbittorrent")
    qbittorrent.exe &;;
  "kdenlive")
    kdenlive &;;
  "xournal++")
    xournalpp.exe &;;
  "Kensington")
    /c/Program\ Files\ \(x86\)/Kensington/KensingtonWorks2/KensingtonWorks2.exe &;;
  "Vial")
    /c/Program\ Files\ \(x86\)/Vial/Vial.exe &;;
  "LibreOffice-Write")
    /c/Program\ Files/LibreOffice/program/swriter.exe &;;
  "window detective")
    /c/Program\ Files\ \(x86\)/Window\ Detective/Window\ Detective.exe &;;
  "dependencies")
    /c/Users/saeed/scoop/apps/dependencies/current/DependenciesGui.exe &;;
  "regedit")
    gsudo regedit &;;
  "paint")
    mspaint &;;
  "system properties")
    start sysdm.cpl;;
  "system information")
    start msinfo32;;
  "system configuration")
    start msconfig;;
  "control panel")
    start control;;
  "programs and features")
    start appwiz.cpl;;
  "services")
    start services.msc;;
  "network adapters")
    start ncpa.cpl;;
  "date and time")
    start timedate.cpl;;
  "power options")
    start powercfg.cpl;;
  "resource monitor")
    start resmon;;
  "performance monitor")
    start perfmon.msc;;
  "remote desktop")
    start mstsc;;
  "component services")
    start dcomcnfg;;
  "event viewer")
    start eventvwr.msc;;
  "firewall")
    start firewall.cpl;;
  "local users/groups")
    start lusrmgr.msc;;
  "device manager")
    start devmgmt.msc;;
  "mouse settings")
    start main.cpl;;
  "computer management")
    start compmgmt.msc;;
  "advanced user accounts")
    start netplwiz;;
  "group policy editor")
    start gpedit.msc;;
  "malicious software removal tool")
    start mrt;;
  "cpu usage")
    watch mpstat -P ALL ;;
  "memory usage")
    watch free -h ;;
  "arduino")
    arduino_commands=("compile" "upload" "core list" "board list")
    arduino_selected=$(printf '%s\n' "${arduino_commands[@]}" | fzf --header="arduino:")
      case $arduino_selected in
        "compile")
          arduino_cli_board_list_output=$(arduino-cli board list)
          fqbn=$(echo "$arduino_cli_board_list_output" | awk 'NR>1 {print $8}')
          arduino-cli compile --fqbn $fqbn .
          ;;
        "upload")
          arduino_cli_board_list_output=$(arduino-cli board list)
          port=$(echo "$arduino_cli_board_list_output" | awk 'NR>1 {print $1}')
          fqbn=$(echo "$arduino_cli_board_list_output" | awk 'NR>1 {print $8}')
          sudo arduino-cli upload -p $port --fqbn $fqbn .
          ;;
        "board list")
          arduino-cli board list ;;
        "core list")
          arduino-cli core list ;;
        *) ;;
      esac
    ;;
  "set proxy")
    export http_proxy=http://127.0.0.1:8118
    export https_proxy=http://127.0.0.1:8118
    export socks_proxy=http://127.0.0.1:9050
    ;;
  "unset proxy")
    unset http_proxy
    unset https_proxy
    unset socks_proxy
    ;;
  "aliases")
    alias | fzf --header="aliases:";;
  "keybindings")
    bind -p ;;
  "functions")
    row=$(declare -F | fzf --header="functions:")
    eval $row;;
  "PATH")
    echo $PATH;;
  "fontpreview")
    fontpreview.sh ;;
  "fonts(fc-list)")
    echo 'total:'; fc-list | wc -l; echo '-------------------------------'; fc-list | less;;
  "update font database")
    sudo fc-cache -f -v;;
  "python3")
    /usr/bin/python3.exe ;;
  "directory size(du -ch -d1)")
    du -ch -d1 ;;
  "disks/partitions (fdisk)")
    sudo fdisk -l;;
  "fs disk usage (df)")
    df -h;;
  "ip local")
    ip a show;;
  "ip external")
    curl eth0.me;;
  "dns")
    curl -L https://edns.ip-api.com/json | jq '.dns.geo, .dns.ip ';;
  "ping")
    read -p "address: " address; ping -c 3 $address;;
  "network device (ip link)")
    ip link;;
  "interfaces (ifconfig -a)")
    ifconfig -a;;
  "ip rule")
    ip rul;;
  "routing table(netstat -anr)")
    netstat -anr ;;
  "tcp/udp open ports (netstat -tlnup)")
    sudo netstat -tlnup ;;
  "unix sockets")
    netstat -a -p --unix;;
  "all sockets")
    sudo netstat -a -p ;;
  "route list(ip route list)")
    ip route list;;
  "wireless devices enable/disable status")
    rfkill;;
  "calendar(current month)")
     cal -m -n 1 --color=always;;
  "calendar(previous/current/next month)")
     cal -m -3 --color=always;;
  "calendar(full year)")
     cal -m -n 12 -S --color=always;;
  "weather(current city - simple)")
     $(curl wttr.in/$(curl -s http://ip-api.com/json | jq '.city ')?format=4);;
  "weather(current city - advance)")
     curl wttr.in/$(curl -s http://ip-api.com/json | jq '.city ');;
  "weather(enter city - simple)")
    read -p "weather: " city_name; curl wttr.in/$city_name?format=4;;
  "weather(enter city - advance)")
     read -p "weather: " city_name; curl wttr.in/$city_name;;
  "timezone(current city)")
    _timezone_raw=$(curl -s http://ip-api.com/json | jq '.timezone ')
    _timezone=${_timezone_raw:1:-1}
    _continent=$(echo $_timezone | cut -d "/" -f 1)
    _city=$(echo $_timezone | cut -d "/" -f 2)

    _fetched_result=$(curl https://worldtimeapi.org/api/timezone/$_continent/$_city)
    _abbreviation=$(echo $_fetched_result | jq '.abbreviation ')
    _utc_offset=$(echo $_fetched_result | jq '.utc_offset ')
    _date=$(echo $_fetched_result | jq '.datetime ' | cut -d "T" -f 2 )
    _date_format=${_date:0:8}
    echo "city: $_city, time:$_date_format, timezone: $_abbreviation, offset:$_utc_offset";;
  "timezone(other cities)")
    _timezone=$(curl http://worldtimeapi.org/api/timezone 2>/dev/null | jq -r '.[]' | fzf --header="city:")
    _continent=$(echo $_timezone | cut -d "/" -f 1)
    _city=$(echo $_timezone | cut -d "/" -f 2)

    _fetched_result=$(curl https://worldtimeapi.org/api/timezone/$_continent/$_city)
    _abbreviation=$(echo $_fetched_result | jq '.abbreviation ')
    _utc_offset=$(echo $_fetched_result | jq '.utc_offset ')
    _date=$(echo $_fetched_result | jq '.datetime ' | cut -d "T" -f 2 )
    _date_format=${_date:0:8}

    echo "city: $_city, time:$_date_format, timezone: $_abbreviation, offset:$_utc_offset" "tr" 7;;
  "city")
      echo "city: $(curl -s http://ip-api.com/json | jq '.city ')";;
  "country")
    echo "country: $(curl -s http://ip-api.com/json | jq '.country ')";;
  "lat/lon")
    echo "lat/lon:" "$(curl -s http://ip-api.com/json | jq '.lat, .lon ')";;
  "isp")
    echo "isp: $(curl -s http://ip-api.com/json | jq '.isp ')";;
  "isp organization")
    echo "isp organization: $(curl -s http://ip-api.com/json | jq '.org ')";;
  *) ;;
esac
