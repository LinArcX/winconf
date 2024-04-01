# TODO
# never use rm. always use mv instead and put the files/dirs in ~/.trash:
#    mv -i test.txt ~/.trash/
# handle unarchive unzip zip archive
# handle background jobs and ability to kill them
# handle processes and ability to kill them
# bulk-rename
# bulk-delete
# in o mode, check if the directory has .git folder and don't show it.

# If not running interactively, don't do anything

[[ "$-" != *i* ]] && return

if [ -f /etc/bash_completion ]; then
 source /etc/bash/bashrc.d/bash_completion.sh
fi

export LANG=en_US.UTF-8

source ~/ArchConf/home/.fzf/completion.bash
source ~/ArchConf/home/.fzf/key-bindings.bash
#source ~/ArchConf/home/.fzf/fzf-bash-completion.sh
#bind -x '"\t": fzf_bash_completion'

FZF_COMPLETION_AUTO_COMMON_PREFIX=true

#eval "$(zoxide init bash)"

shopt -s autocd
shopt -s histappend              # append new history items to .bash_history
bind 'set mark-directories on'
lines=$(tput lines)

export HISTSIZE=8000
HISTFILESIZE=1000000
export HISTCONTROL=ignorespace   # leading space hides commands from history
export HISTFILESIZE=10000        # increase history file size (default is 500)
export HISTSIZE=${HISTFILESIZE}  # increase history size (default is 500)

_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf "$@" --preview 'tree -C {} | head -200' ;;
    *)            fzf "$@" ;;
  esac
}

v() {
  mime_type=
  if [[ -n "$2" ]]; then
    mime_type=$2
  else
    mime_type=$(file -b --mime-type "$1")
  fi

  case "$mime_type" in
    "inode/directory")
      tree -L 2 $1 -C;;
    "inode/symlink")
      mime_type_link=$(file -b --mime-type $(readlink -f "$1"))
      v "$1" "$mime_type_link"
      ;;
    "text/plain")
      $TEXTVIEWER "$1" ;;
    "text/english")
      $TEXTVIEWER "$1" ;;
    "text/x-makefile")
      $TEXTVIEWER "$1" ;;
    "text/x-c")
      $TEXTVIEWER "$1" ;;
    "text/x-c++")
      $TEXTVIEWER "$1" ;;
    "text/x-c++hdr")
      $TEXTVIEWER "$1" ;;
    "text/x-c++src")
      $TEXTVIEWER "$1" ;;
    "text/x-chdr")
      $TEXTVIEWER "$1" ;;
    "text/x-csrc")
      $TEXTVIEWER "$1" ;;
    "text/x-java")
      $TEXTVIEWER "$1" ;;
    "text/x-moc")
      $TEXTVIEWER "$1" ;;
    "text/x-pascal")
      $TEXTVIEWER "$1" ;;
    "text/x-tcl")
      $TEXTVIEWER "$1" ;;
    "text/x-tex")
      $TEXTVIEWER "$1" ;;
    "text/x-shellscript")
      $TEXTVIEWER "$1" ;;
    "application/x-shellscript")
      $TEXTVIEWER "$1" ;;
    "application/x-subrip")
      $TEXTVIEWER "$1" ;;
    "text/troff")
      $TEXTVIEWER "$1" ;;
    "text/mathml")
      $TEXTVIEWER "$1" ;;
    "x-scheme-handler/about")
      $TEXTVIEWER "$1" ;;
    "x-scheme-handler/unknown")
      $TEXTVIEWER "$1" ;;
    "application/json")
      $TEXTVIEWER "$1" ;;
    "application/pdf")
      $MEDIAVIEWER "$1";;
    "application/epub+zip")
      $MEDIAVIEWER "$1" ;;
    "image/bmp")
      $MEDIAVIEWER "$1" ;;
    "image/gif")
      $MEDIAVIEWER "$1" ;;
    "image/jpeg")
      $MEDIAVIEWER "$1" ;;
    "image/jpg")
      $MEDIAVIEWER "$1" ;;
    "image/png")
      $MEDIAVIEWER "$1" ;;
    "image/x-png")
      $MEDIAVIEWER "$1" ;;
    "image/pjpeg")
      $MEDIAVIEWER "$1" ;;
    "image/x-bmp")
      $MEDIAVIEWER "$1" ;;
    "image/tiff")
      $MEDIAVIEWER "$1" ;;
    "video/mp4")
      $MEDIAVIEWER "$1" ;;
    "video/x-avi")
      $MEDIAVIEWER "$1" ;;
    "video/avi")
      $MEDIAVIEWER "$1" ;;
    "video/x-flic")
      $MEDIAVIEWER "$1" ;;
    "video/fli")
      $MEDIAVIEWER "$1" ;;
    "video/flv")
      $MEDIAVIEWER "$1" ;;
    "video/x-theora")
      $MEDIAVIEWER "$1" ;;
    "video/x-matroska")
      $MEDIAVIEWER "$1" ;;
    "video/mkv")
      $MEDIAVIEWER "$1" ;;
    "video/x-flv")
      $MEDIAVIEWER "$1" ;;
    "video/x-mpeg2")
      $MEDIAVIEWER "$1" ;;
    "video/x-mpeg3")
      $MEDIAVIEWER "$1" ;;
    "video/mpeg")
      $MEDIAVIEWER "$1" ;;
    "video/divx")
      $MEDIAVIEWER "$1" ;;
    "video/vnd.divx")
      $MEDIAVIEWER "$1" ;;
    "video/msvideo")
      $MEDIAVIEWER "$1" ;;
    "video/quicktime")
      $MEDIAVIEWER "$1" ;;
    "video/ogg")
      $MEDIAVIEWER "$1" ;;
    "video/3gp")
      $MEDIAVIEWER "$1" ;;
    "video/dv")
      $MEDIAVIEWER "$1" ;;
    "audio/mp3")
      $AUDIOPLAYER "$1" ;;
    "audio/aac")
      $AUDIOPLAYER "$1" ;;
    "audio/x-aac")
      $AUDIOPLAYER "$1" ;;
    "audio/aiff")
      $AUDIOPLAYER "$1" ;;
    "audio/m4a")
      $AUDIOPLAYER "$1" ;;
    "audio/mpeg")
      $AUDIOPLAYER "$1" ;;
    "audio/mpeg2")
      $AUDIOPLAYER "$1" ;;
    "audio/mpeg3")
      $AUDIOPLAYER "$1" ;;
    "audio/mpg")
      $AUDIOPLAYER "$1" ;;
    "audio/ogg")
      $AUDIOPLAYER "$1" ;;
    "audio/wav")
      $AUDIOPLAYER "$1" ;;
    "audio/wma")
      $AUDIOPLAYER "$1" ;;
    "audio/ogg")
      $AUDIOPLAYER "$1" ;;
    "audio/ac3")
      $AUDIOPLAYER "$1" ;;
    "text/html")
      $BROWSER "$1" ;;
    "text/x-sql")
      $DBBROWSER "$1" ;;
  esac
}

# right now, when user press C-p, fzf change directory just in subshell, it doesn't affect main shell PWD
open_dirs() {
  export -f v
  export -f open_dirs
  row=$(exa -1 -l --no-permissions --no-user --no-filesize --no-time --all $PWD | fzf --header="pwd: $(pwd)" --preview 'v {}' --bind='ctrl-b:execute:(pkill fzf; cd "$PWD/.."; open_dirs)')

  if [[ -n "$row" ]]; then
    if [ -d "$row" ]; then
      cd $row
      open_dirs
    elif [ -f "$row" ]; then
      open_files "$row"
    fi
  fi
}

open_files() {
  mime_type=
  if [[ -n "$2" ]]; then
    mime_type=$2
  else
    mime_type=$(file -b --mime-type "$1")
  fi

  case "$mime_type" in
    "inode/directory")
      cd $1 ;;
    "inode/symlink")
      mime_type_link=$(file -b --mime-type $(readlink -f "$1"))
      open_files "$1" "$mime_type_link"
      ;;
    "text/plain")
      $EDITOR "$1" ;;
    "text/english")
      $EDITOR "$1" ;;
    "text/x-makefile")
      $EDITOR "$1" ;;
    "text/x-c")
      $EDITOR "$1" ;;
    "text/x-c++")
      $EDITOR "$1" ;;
    "text/x-c++hdr")
      $EDITOR "$1" ;;
    "text/x-c++src")
      $EDITOR "$1" ;;
    "text/x-chdr")
      $EDITOR "$1" ;;
    "text/x-csrc")
      $EDITOR "$1" ;;
    "text/x-lua")
      $EDITOR "$1" ;;
    "application/javascript")
      $EDITOR "$1" ;;
    "text/x-java")
      $EDITOR "$1" ;;
    "text/x-moc")
      $EDITOR "$1" ;;
    "text/x-pascal")
      $EDITOR "$1" ;;
    "text/x-tcl")
      $EDITOR "$1" ;;
    "text/x-tex")
      $EDITOR "$1" ;;
    "text/x-shellscript")
      $EDITOR "$1" ;;
    "application/x-shellscript")
      $EDITOR "$1" ;;
    "application/x-subrip")
      $EDITOR "$1" ;;
    "text/troff")
      $EDITOR "$1" ;;
    "text/mathml")
      $EDITOR "$1" ;;
    "x-scheme-handler/about")
      $EDITOR "$1" ;;
    "x-scheme-handler/unknown")
      $EDITOR "$1" ;;
    "application/json")
      $EDITOR "$1" ;;
    "application/pdf")
      $PDFVIEWER "$1" ;;
    "application/epub+zip")
      $EPUBVIEWER "$1" ;;
    "image/bmp")
      $IMAGEVIEWER "$1" ;;
    "image/gif")
      $IMAGEVIEWER "$1" ;;
    "image/jpeg")
      $IMAGEVIEWER "$1" ;;
    "image/jpg")
      $IMAGEVIEWER "$1" ;;
    "image/png")
      $IMAGEVIEWER "$1" ;;
    "image/x-png")
      $IMAGEVIEWER "$1" ;;
    "image/pjpeg")
      $IMAGEVIEWER "$1" ;;
    "image/x-bmp")
      $IMAGEVIEWER "$1" ;;
    "image/tiff")
      $IMAGEVIEWER "$1" ;;
    "video/mp4")
      $VIDEOPLAYER "$1" ;;
    "video/x-avi")
      $VIDEOPLAYER "$1" ;;
    "video/avi")
      $VIDEOPLAYER "$1" ;;
    "video/x-flic")
      $VIDEOPLAYER "$1" ;;
    "video/fli")
      $VIDEOPLAYER "$1" ;;
    "video/flv")
      $VIDEOPLAYER "$1" ;;
    "video/x-theora")
      $VIDEOPLAYER "$1" ;;
    "video/x-matroska")
      $VIDEOPLAYER "$1" ;;
    "video/mkv")
      $VIDEOPLAYER "$1" ;;
    "video/x-flv")
      $VIDEOPLAYER "$1" ;;
    "video/x-mpeg2")
      $VIDEOPLAYER "$1" ;;
    "video/x-mpeg3")
      $VIDEOPLAYER "$1" ;;
    "video/mpeg")
      $VIDEOPLAYER "$1" ;;
    "video/divx")
      $VIDEOPLAYER "$1" ;;
    "video/vnd.divx")
      $VIDEOPLAYER "$1" ;;
    "video/msvideo")
      $VIDEOPLAYER "$1" ;;
    "video/quicktime")
      $VIDEOPLAYER "$1" ;;
    "video/ogg")
      $VIDEOPLAYER "$1" ;;
    "video/3gp")
      $VIDEOPLAYER "$1" ;;
    "video/dv")
      $VIDEOPLAYER "$1" ;;
    "audio/mp3")
      $AUDIOPLAYER "$1" ;;
    "audio/aac")
      $AUDIOPLAYER "$1" ;;
    "audio/x-aac")
      $AUDIOPLAYER "$1" ;;
    "audio/aiff")
      $AUDIOPLAYER "$1" ;;
    "audio/m4a")
      $AUDIOPLAYER "$1" ;;
    "audio/mpeg")
      $AUDIOPLAYER "$1" ;;
    "audio/mpeg2")
      $AUDIOPLAYER "$1" ;;
    "audio/mpeg3")
      $AUDIOPLAYER "$1" ;;
    "audio/mpg")
      $AUDIOPLAYER "$1" ;;
    "audio/ogg")
      $AUDIOPLAYER "$1" ;;
    "audio/wav")
      $AUDIOPLAYER "$1" ;;
    "audio/wma")
      $AUDIOPLAYER "$1" ;;
    "audio/ogg")
      $AUDIOPLAYER "$1" ;;
    "audio/ac3")
      $AUDIOPLAYER "$1" ;;
    "text/html")
      $BROWSER "$1" ;;
    "text/x-sql")
      $DBBROWSER "$1" ;;
  esac
}

o() {
  if [ $# -eq 0 ]; then
    open_dirs
  else
    if [ "$1" == "." ]; then
      $EDITOR .
    else
      open_files "$1"
    fi
  fi
}


j() {
  if [ $# -eq 0 ]; then
    echo "pass a file name"
  else
    file_name=$(basename $1)
    #alacritty -T $file_name -e bash -c "xdotool key Shift+Super_L+2; xdotool key Super_L+2; nvim $1" >/dev/null 2>&1 &
    alacritty -T $file_name -e bash -c "nvim $1" >/dev/null 2>&1 &
  fi
}

#z() {
#  commands=("zzz" "exit" "lock" "reboot" "shutdown")
#  selected=$(printf '%s\n' "${commands[@]}" | fzf --header="power management:")
#
#  case $selected in
#    "zzz")
#      sudo zzz ;;
#    "exit")
#      pkill -u $USER ;;
#    "lock")
#      slock ;;
#    "reboot")
#      while true; do
#        read -p "You're going to reboot. Continue? [y/n] " yn
#        case $yn in
#          [Yy]* ) sudo reboot; break;;
#          [Nn]* ) break;;
#          * ) ;;
#        esac
#      done ;;
#    "shutdown")
#      while true; do
#        read -p "You're going to shutdown. Continue? [y/n] " yn
#        case $yn in
#          [Yy]* ) sudo shutdown -h now; break;;
#          [Nn]* ) break;;
#          * ) ;;
#        esac
#      done ;;
#    *) ;;
#  esac
#}

a() {
  commands=("otd driver" "otd gui" "cpu usage" "memory usage" "arduino" "set proxy" "unset proxy" "aliases" "keybindings" "functions" "PATH"
    "rtorrent" "htop(resource monitor)" "fontpreview" "reload ~/.Xresources" "calculator(python)" "empty trash"
    "update grub" "screencast(ffmpeg/x11)" "fonts(fc-list)" "update font database" "income/expenses"
    "tcp/udp open ports (netstat -tlnup)" "unix sockets" "all sockets" "kernels" "kernel modules"
    "mounted filesystems" "fs disk usage (df)"  "mount remote directory(FTP)" "mount Remote directory(SSH)" "internal speaker" "external speaker"
    "usb (lsusb)" "block devices (lsblk)" "block device attributes (blkid)" "disks/partitions (fdisk)" "cpu info (lscpu)" "PCI devices (lspci)"
    "ip local" "ip external" "dns" "ping" "network device (ip link)" "interfaces (ifconfig -a)" "ip rule" "isp" "isp organization"
    "calendar(current month)" "calendar(previous/current/next month)" "calendar(full year)"
    "weather(current city - simple)" "weather(current city - advance)" "weather(enter city - simple)" "weather(enter city - advance)"
    "timezone(current city)" "timezone(other cities)" "city" "country" "lat/lon"
    "sfeed - update" "sfeed - show" "sfeed - clean feeds"
    "loged in users" "namespaces" "directory size(du -ch -d1)" "capture output of command" "return the output of captured" "fake file" "routing table(netstat -anr)"  "route list(ip route list)" "wireless devices enable/disable status"
    )
  selected=$(printf '%s\n' "${commands[@]}" | fzf --header="apps:")

  ## Trim video using ffmpeg
  # ffmpeg -ss 00:00:00 -to 00:28:37 -i 2023-06-25\ 10-20-01.mkv -c copy first.mp4
  # ffmpeg -ss 00:31:07 -to 00:51:20 -i 2023-06-25\ 10-20-01.mkv -c copy second.mp4
  # ffmpeg -i first.mp4 -i second.mp4 -filter_complex "[0:v:0][0:a:0][1:v:0][1:a:0]concat=n=2:v=1:a=1[outv][outa]" -map "[outv]" -map "[outa]" output.mp4


  case $selected in
    "otd driver")
      /home/linarcx/otd/otd_driver.sh ;;
    "otd gui")
      /home/linarcx/otd/otd_gui.sh ;;
      #sudo /home/linarcx/otd/driver/opentabletdriver/usr/local/lib/opentabletdriver/OpenTabletDriver.UX.Gtk & > /dev/null 2>&1 ;;
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
      bind -p
      ;;
    "functions")
      row=$(declare -F | fzf --header="functions:")
      eval $row;;
    "PATH")
      echo $PATH;;

    "calculator(python)")
      python3 -i -c "import math" ;;
    "rtorrent")
      rtorrent ;;
    "fontpreview")
      fontpreview.sh ;;
    "reload ~/.Xresources")
      xrdb -load ~/.Xresources ;;
    "htop(resource monitor)")
      htop;;
    "income/expenses")
       sc-im /mnt/D/workspace/other/vivre/00_personal/01_income_expenses/2022/euro/2022.sc;;
    "nyx(tor monitor)")
      nyx;;
    "sfeed - update")
      sfeed_update $HOME/.config/sfeed/sfeedrc ;;
    "sfeed - show")
      sfeed_plain "$HOME/.sfeed/feeds/"* | fzf | grep -o 'http[^[:space:]]*' | cut -d ' ' -f1 | xargs -r $BROWSER > /dev/null 2>&1 ;;
    "sfeed - clean feeds")
      rm -r ~/.sfeed/ ;;


    "kernels")
      vkpurge list;;
    "kernel modules")
      lsmod | sort;;
    "fonts(fc-list)")
      echo 'total:'; fc-list | wc -l; echo '-------------------------------'; fc-list | less;;
    "update font database")
      sudo fc-cache -f -v;;
    "loged in users")
      lslogins;;
    "namespaces")
      lsns;;
    "update grub")
      sudo grub-mkconfig -o /boot/grub/grub.cfg && sudo grub-install /dev/sda ;;

   "python2")
      /usr/bin/python2.7 ;;

    "empty trash")
      read -p "You're going to empty ~/.trash. Continue? [y/n] " yn
      case $yn in
        [Yy]* ) rm -r --preserve-root /home/linarcx/.trash/; mkdir /home/linarcx/.trash ;;
        [Nn]* ) break;;
        * ) ;;
      esac;;
    "directory size(du -ch -d1)")
      du -ch -d1 ;;
    "usb (lsusb)")
      lsusb ;;
    "block devices (lsblk)")
      lsblk -a;;
    "block device attributes (blkid)")
      blkid;;
    "disks/partitions (fdisk)")
      sudo fdisk -l;;
    "cpu info (lscpu)")
      lscpu;;
    "PCI devices (lspci)")
      lspci;;
    "mounted filesystems")
      cat /proc/mounts;;
    "fs disk usage (df)")
      df -h;;
    "screencast(ffmpeg/x11)")
      #read -p "video name: " video_name; ffmpeg -video_size 1366x768 -framerate 25 -f x11grab -i :0.0+0,0 ~/Videos/$video_name.mp4;;
      # 1366x768
      read -p "video name: " video_name; ffmpeg -video_size 1920x1080  -framerate 30 -f x11grab -i :0.0+0,0 -f alsa -i hw:0,0 ~/Videos/$video_name.mp4;;
    "mount remote directory(FTP)")
      curlftpfs -o allow_other saeed:123@192.168.1.174:2121 ~/Device
      if [ $? -eq 0 ]
      then
        cd ~/Device
      else
        fusermount -u ~/Device/
        echo "Error: Can't mount remote FTP directory!"
      fi
      ;;
    "mount Remote directory(SSH)")
      sshfs -p 2222 linarcx@192.168.1.33:/ ~/Device
      if [ $? -eq 0 ]
      then
        cd ~/Device
      else
        echo "Error: Can't mount remote SSH directory!"
      fi
      ;;
    "internal speaker")
      sed -i '$s/3/0/' .asoundrc
      sudo alsactl init
      sudo alsactl kill rescan ;;
    "external speaker")
      sed -i '$s/0/3/' .asoundrc
      sudo alsactl init
      sudo alsactl kill rescan ;;
    "capture output of command")
      tee /tmp/capture.out ;;
    "return the output of captured")
      cat /tmp/capture.out ;;
    "fake file")
      head -c 1GB /dev/urandom > ostechnix.txt ;;

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
}

m() {
  selected=$(lsblk --noheadings --raw -o NAME,MOUNTPOINT | awk '$1~/[[:digit:]]/ && $2 == ""' | fzf --header="to mount:")
  if [[ -n "$selected" ]]; then
    udevil mount /dev/$selected
    echo "$selected mounted"
  fi
}

u() {
  selected=$(lsblk --noheadings --raw -o NAME,MOUNTPOINT | awk '$1~/[[:digit:]]/ && $2 != ""' | sed 's/|/ /' | awk '{print $1}' | fzf --header="to unmount: " )
  if [[ -n "$selected" ]]; then
    udevil unmount /dev/$selected
    echo "$selected unmounted"
  fi
}

b() {
  export -f v
  commands=("/mnt/D/books/01_computer/programming/c/compiler_design/CraftingInterpreters.pdf"
    "/mnt/D/books/01_computer/programming/c/C_Programming.pdf"
    "/mnt/D/books/01_computer/programming/c/gnu-c-manual.pdf"
    "/mnt/D/books/01_computer/programming/c/+Brian W Kernighan, Dennis M Ritchie - The Ansi C Programming Language-Prentice Hall.pdf"
    "/mnt/D/books/01_computer/programming/c/The Standard C Library.pdf"
    "/mnt/D/books/01_computer/programming/c/The Standard C Library.pdf"
    "/mnt/D/books/01_computer/programming/c/Advanced C 1992.pdf"
		"/mnt/D/books/01_computer/programming/c/wisdom/C_Programming_Just_the_Faqs.pdf"
		"/mnt/D/books/01_computer/programming/c/compiler_design/_Compiler_Design_In_C.pdf"
		"/mnt/D/books/01_computer/programming/c/language_features/C_The_Function_Pointer_Tutorials.pdf"
    "/mnt/D/books/01_computer/software_engineering/paradigms/oo/Object_Thinking_David_West.pdf"
		"/mnt/D/books/01_computer/programming/c++/windows/Windows_System_Programming.pdf"
		"/mnt/D/books/01_computer/programming/c/+Test_Driven_Development_for_Embedded_C.pdf"
		"/mnt/D/books/01_computer/programming/c++/c++_standard_n3690.pdf"
		"/mnt/D/books/01_computer/programming/c++/C++_FAQs.pdf"
		"/mnt/D/books/01_computer/programming/c++/wisdom/C++_Interview_Questions.pdf"
		"/mnt/D/books/01_computer/programming/c++/03/+API_Design_for_C++-Martin_ready.pdf"
		"/mnt/D/books/01_computer/programming/c++/security/Cryptography_in_C_and_C++.pdf"
		"/mnt/D/books/01_computer/programming/c++/wisdom/+C++_coding_standards_101_rules_guidelines_and_best_practices.pdf"
		"/mnt/D/books/01_computer/programming/c++/other/Functional_Programming_in_C++.pdf"
		"/mnt/D/books/01_computer/programming/c++/system_programming/C++_System_Programming_Cookbook.pdf"
		"/mnt/D/books/01_computer/programming/c++/wisdom/optimization/+Optimized_C++_Proven_Techniques_for_Heightened_Performance.pdf"
		"/mnt/D/books/01_computer/programming/c++/tdd/Modern_C++_Programming_with_Test-Driven_Development_Code_Better_Sleep_Better.pdf"
		)
  selected=$(printf '%s\n' "${commands[@]}" | sed "s|~|$HOME|" | fzf --header="books:" --preview 'v {}')
  open_files $selected &
}

# it's easier to use aliases in these cases!
alias xi="sudo xbps-install -S"      # Install a package
alias xu="sudo xbps-install -Suv"    # Update whole system
alias xq="xbps-query -Rs"            # Search for a package
alias xr="sudo xbps-remove"          # Remove a package
alias xqf="xbps-query -f"            # Remove a package

x() {
  commands=("update" "install" "search" "xlocate"
    "apps" "apps(sorted by installed-date)"
    "pkgs (local)" "pkgs (repo)" "pkg files" "pkg deps" "pkg rev-deps" "pkg rev-deps number" "pkg req-deps" "orphaned pkgs" "hold pkgs" "manaual pkgs" "nonfree pkgs"
    "remove" "xpurge" "remove orphans & obsolete" "remove old kernels" "remove orphaned pkgs" "remove obsolete pkgs"
    "repos" "kernels" "dry-run" "cache size" "pkgs cache number")

  selected=$(printf '%s\n' "${commands[@]}" | fzf --header="xbps:" --preview 'v {}')
  case $selected in
    "update")
      echo "xu is more handy, isn't it?";;
    "install")
      echo "xi is more handy, isn't it?";;
      #read -p "install: " package_name; sudo xbps-install -S $package_name ;;
    "search")
      echo "xq is more handy, isn't it?";;
      #read -p "search: " package_name;
      #output=$(xbps-query -Rs $package_name)
      #output_lines=$(echo -e "$output" | wc -l)

      #if [ $output_lines -lt $lines ]; then
      #  echo -e "$output"
      #else
      #  echo -e "$output" | less
      #fi
      #;;
    "xlocate")
      read -p "File name: " file_name; xlocate $file_name | less ;;
    "apps")
      { echo 'total:'; xbps-query -m | wc -l; echo '-------------------------------'; xbps-query -m ; } | less ;;
    "apps(sorted by installed-date)")
      #tmp=$(mktemp); xbps-query -m > ${tmp}; xilog | grep -f ${tmp} | less; rm ${tmp}
      xilog | grep -f <(xbps-query -m) | tac | less ;;
    "pkgs (local)")
      output=$(xbps-query -l)
      output_lines=$(echo -e "$output" | wc -l)
      if [ $output_lines -lt $lines ]; then
        { echo 'total:'; echo -e "$output_lines"; echo '-------------------------------'; echo -e "$output"; }
      else
        { echo 'total:'; echo -e "$output_lines"; echo '-------------------------------'; echo -e "$output"; } | less
      fi
      ;;
    "pkgs (repo)")
      output=$(xbps-query -Rs '')
      output_lines=$(echo -e "$output" | wc -l)
      { echo 'total:'; echo -e "$output_lines"; echo '-------------------------------'; echo -e "$output"; } | less ;;
    "pkg files")
      echo "xqf <PKG> is more handy, isn't it?";;
      #read -p "List of fils: " package_name; xbps-query -f $package_name;;
    "pkg deps")
      read -p "Package: " name; names=$(xbps-install -Sn $name); count=$(xbps-install -Sn $name | wc -l); echo "Total: $count\n\n$names" | less ;;
    "pkg rev-deps")
      read -p "Package: " name; names=$(xbps-query --revdeps $name); echo "Rev: $names" | less ;;
    "pkg rev-deps number")
      xbps-query -X ;; # -RX
    "pkg req-deps")
      xbps-query -Rx ;;
    "hold pkgs")
      xbps-query -H ;;
    "manaual pkgs")
      output=$(xbps-query -m)
      output_lines=$(echo -e "$output" | wc -l)

      if [ $output_lines -lt $lines ]; then
        echo -e "$output"
      else
        echo -e "$output" | less
      fi
      ;;
    "nonfree pkgs")
      grep \"repository=nonfree\" ~/void-packages/srcpkgs/*/template ;;
    "remove")
      echo "xr is more handy, isn't it?";;
      #read -p "remove: " package_name; sudo xbps-remove $package_name ;;
    "xpurge")
      sudo xpurge.sh;;
    "remove orphans & obsolete")
      sudo xbps-remove -Oo ;;
    "remove old kernels")
      #sudo vkpurge list | sort -V | head -n -3 | sudo xargs vkpurge rm ;;
      sudo vkpurge rm all;;
    "remove orphaned pkgs")
      sudo xbps-remove -o ;;
    "remove obsolete pkgs")
      sudo xbps-remove -O ;;
    "repos")
      xbps-query -L ;;
    "kernels")
      vkpurge list | sort -V ;;
    "dry run")
      read -p "dry run: " package_name;
      output=$(xbps-install -n $package_name)
      output_lines=$(echo -e "$output" | wc -l)

      if [ $output_lines -lt $lines ]; then
        echo -e "$output"
      else
        echo -e "$output" | less
      fi
      ;;
    "cache size")
      du -ch /var/cache/xbps ;;
    "pkgs cache number")
      ls /var/cache/xbps | wc -l;;
    *)
      ;;
  esac
}

f() {
  export -f v
  commands=("~/.bashrc" "~/.xinitrc"  "~/.asoundrc" "~/.profile" "~/.bash_profile" "~/.inputrc" "~/.xbindkeysrc" "~/.xmodmaprc")
  selected=$(printf '%s\n' "${commands[@]}" | sed "s|~|$HOME|" | fzf --header="files:" --preview 'v {}')
  open_files $selected
}

d() {
  export -f v
  commands=("~/ArchConf" "~/.config/lf" "/d/workspace/other/life/" "/d/workspace/c++/02_maintainance/wmenu"
    "/d/workspace/other/winconf" "~/Downloads" "~/.config/nvim" "~/.local/share/Trash/files"
    "/d/workspace/c/01_active/dwm" "/c/Users/saeed/.wezterm.lua" "~/.config/mpv"
    "/d/workspace/c++/01_active/pardis"
    "/d/workspace/other/ArenOs"
    "/d/workspace/c/01_active/kaveh"
    "/d/workspace/c/01_active/akoman"
    "/d/workspace/c/01_active/cave"
    "/d/workspace/other/Nand2Tetris"
    "/e/" "/e/video/movies/" "/e/video/tv_series" "/d/" "/d/books" "/d/video" "/d/images"
    "/d/video/computer/languages/c/00_bitwise/"
    "/d/video/computer/languages/c/01_hand_made_hero"
    "/d/video/computer/languages/c/02_make_video_game_from_scratch_in_c"
    "/d/video/computer/languages/c/04_programming_a_text_editor_from_scratch"
    "/d/video/computer/languages/c/05_porgramming_an_x64_compiler"
    "/d/video/computer/languages/c/06_write_your_own_os"
    "/d/video/computer/languages/c/07_simple_profiler_from_scratch"
    "/d/video/computer/languages/c/09_using_win_dbg"
    "/d/video/computer/languages/c/11_graphic_programming")

  selected=$(printf '%s\n' "${commands[@]}" | sed "s|~|$HOME|" | fzf --header="dirs:" --preview 'v {}')
  open_files $selected
}

# it's easier to use aliases in these cases!
alias gii="git init"
alias gia="git add ."
alias gis="git status"
alias gic='read -p "commit message: " message; git commit -m "$message"'
alias gip="git remote | xargs -L1 git push --all"
alias gil="git log"
alias gib="git branch --all"
alias gid="git diff | delta"
alias gidd="git difftool"
alias gr='f(){ git rm -r --cached $1; }; f'
alias grsoft='f(){ git reset --hard HEAD~$1; }; f'
alias grhard='f(){ git reset --soft HEAD~$1; }; f'

g() {
  #alias filesincommit='f() { git diff-tree --no-commit-id --name-only -r "$1"; }; f'
  #alias girc='git rebase --continue'
  #alias giri='f(){ git rebase -i HEAD~"$1"; }; f'
  #alias gich='f(){ git checkout "$1";}; f'
  #alias gichb='f(){ git checkout -b "$1";}; f'
  #alias grr='f(){ git remote set-url origin "$1;" }; f'
  #alias gar='f(){ git remote set-url --add origin "$1";}; f'

  commands=("status" "commit history" "log" "diff" "tag" "branches" "variables" "remotes" "gc" "purge"
    "edit local .gitconfig" "edit global .gitconfig" "init" "add remote"
    "add all" "add single" "commit" "push" "push --force" "clone")
  selected=$(printf '%s\n' "${commands[@]}" | fzf --header="git:")
  case $selected in
    "status")
      echo "gis is more handy, isn't it?";;
      #git status ;;
    "commit history")
      git log --graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"  | \
        fzf --ansi --no-sort --reverse --tiebreak=index --preview \
        'f() { set -- $(echo -- "$@" | grep -o "[a-f0-9]\{7\}"); [ $# -eq 0 ] || git show --color=always $1 ; }; f {}' \
        --bind "j:down,k:up,alt-j:preview-down,alt-k:preview-up,ctrl-f:preview-page-down,ctrl-b:preview-page-up,q:abort,ctrl-m:execute:
                (grep -o '[a-f0-9]\{7\}' | head -1 |
                xargs -I % sh -c 'git show --color=always % | less -R') << 'FZF-EOF'
                {}
      FZF-EOF" --preview-window=right:60%
      ;;
    "log")
      git log ;;
    "diff")
      echo "gid is more handy, isn't it?";;
      #git difftool
    "tag")
      git tag ;;
    "branches")
      git branch -v ;;
    "variables")
      git var -l ;;
    "remotes")
      git remote -v ;;
    "gc")
      git gc ;;
    "purge")
      while true; do
        read -p "Do you really want to purge this repo? [y/n] " yn
        case $yn in
          [Yy]* ) git checkout --orphan TEMP_BRANCH; git add -A; git commit -am "Initial commit"; git branch -D master; git branch -m master; git push -f origin master ; break;;
          [Nn]* ) break;;
          * ) ;;
        esac
      done ;;
    "edit local .gitconfig")
      $EDITOR .git/config;;
    "edit global .gitconfig")
      $EDITOR ~/.gitconfig;;
    "init")
      echo "gii is more handy, isn't it?";;
      #git init ;;
    "add remote")
      read -p "remote: " remote_address; git remote add origin "$remote_address" ;;
    "add all")
      echo "gia is more handy, isn't it?";;
      #while true; do
      #  read -p "Add all unstage files to git? [y/n] " yn
      #  case $yn in
      #    [Yy]* ) git add .; break;;
      #    [Nn]* ) break;;
      #    * ) ;;
      #  esac
      #done
      #;;
    "add single")
      read -p "file: " file; git add "$file" ;;
    "commit")
      echo "gic is more handy, isn't it?";;
      #read -p "commit message: " message; git commit -m "$message" ;;
    "push")
      echo "gip is more handy, isn't it?";;
      #git push ;;
    "push --force")
      git push --force ;;
    "clone")
      read -p "clone from url: " url; git clone "$url" ;;
  esac
}

ft () {
  if [ $# -eq 0 ]; then
    echo "please enter some text to search."
  else
    output=$(rg --column --line-number --no-heading --color=always --smart-case $1)
    output_lines=$(echo -e "$output" | wc -l)

    if [ $output_lines -lt $lines ]; then
      echo -e "$output"
    else
      echo -e "$output" | less
    fi
  fi
}

ff () {
  if [ $# -eq 0 ]; then
    echo "please enter a file name to search."
  else
    output=$(fd -L -H --color=always $1)
    output_lines=$(echo -e "$output" | wc -l)

    if [ $output_lines -lt $lines ]; then
      echo -e "$output"
    else
      echo -e "$output" | less
    fi
  fi
}

t() {
  if [ $# -eq 0 ]; then
    output=$(tree -n -L 1 --si)
    output_lines=$(echo -e "$output" | wc -l)

    if [ $output_lines -lt $lines ]; then
      echo -e "$output"
    else
      echo -e "$output" | less
    fi
  else
    output=$(tree -n -L $1 --si)
    output_lines=$(echo -e "$output" | wc -l)

    if [ $output_lines -lt $lines ]; then
      echo -e "$output"
    else
      echo -e "$output" | less
    fi
  fi
}

te() {
  trans "$1" -speak -player mpg123 -s en -download-audio-as $1.mp3
}

tf() {
  trans "$1" -speak -player mpg123 -s fr -download-audio-as "$1.mp3"
}

y() {
  commands=("search" "history(videos)" "history(keywords)" "channel videos" "download video(history)" "download video" "download playlist" "play audio" "play audio(history)")
  selected=$(printf '%s\n' "${commands[@]}" | fzf --header="ytfzf:")
  case $selected in
    "search")
      read -p "keyword: " keyword; ~/bin/scripts/ytfzf.sh -t "$keyword" ;;
    "history(videos)")
      ~/bin/scripts/ytfzf.sh -H -t;;
    "history(keywords)")
      ~/bin/scripts/ytfzf.sh -q -t;;
   "channel videos")
      channels=("@TsodingDaily" "@MollyRocket" "@nashiora" "@pervognsen" "@ryanries09" "@tobyho92" "@HelloWorldCode" "@simonracz" "@LowLevelLearning" "@DmitrySoshnikov-education" "@AbnerCoimbre" "@CodeAesthetic" "@CoffeeBeforeArch" "@blixel"
        "@tobyho92" "@lowlevelgamedev9330" "@LexClips" "@SCVHA" "@DavesGarage" "@SystemsWithJT" "@ComputerHistory" "@F.T.L" "@PauloConstantino167"
        "@pcsecuritychannel"
        "@voxelrifts" "@connermcd" "@bugswriter_" "@sentdex" "@MotasemHamdan" "@retrogameinternals4707" "@PageKey" "@letsmakethetexteditor1369"
        "@learnelectronics" "@ChannelCreativeVN" "@hackaday" "@EEVblog"
        "@learnfrenchwithalexa" "@frenchyfrench2685" "@EasyFrench" "@MyFrenchStory" "@learn_french" "@Tohideh" "@MeandMonAmi"
        "@bbclearningenglish" "@EnglishClass101" "@EnglishFluencyJourney" "@EasyEnglishVideos"
        "@BambooLanguages"  "@LindieBotes"
        "@NoCopyrightSounds"
        "@navabebrahimiii" "@MehrdadPaz1" "@mehrdadpaz291" "@kamransabouri" "@5MinuteRecipesOfficial" "@epicurious"
        "@TEDx" "@oxforduniversity")
      selected_channel=$(printf '%s\n' "${channels[@]}" | fzf --header="channels:")
      channel_raw=$(ytfzf.sh --channel-link=$selected_channel)
      channel_id=$(echo "$channel_raw" | sed 's#.*/##')
      ~/bin/scripts/ytfzf.sh --pages=3 -c invidious-playlist https://www.youtube.com/playlist?list=$channel_id
      ;;
    "download video")
      read -p "keyword: " keyword; ~/bin/scripts/ytfzf.sh -t -d "$keyword" ;;
    "download video(history)")
      ~/bin/scripts/ytfzf.sh -H -t -d;;
      #alias yd='f(){ torify youtube-dl -f "best[height<=720]"+bestaudio --write-auto-sub "$1"; }; f'
      #alias ydp='f(){ torify youtube-dl -f "best[height<=720]"+bestaudio --write-auto-sub -i "$1"; }; f'
      #alias ydh='f(){ torify youtube-dl -f "best[height=1080]"+bestaudio --write-auto-sub "$1"; }; f'
      #alias ydhp='f(){ torify youtube-dl -f "best[height=1080]"+bestaudio --write-auto-sub -i "$1"; }; f'
      #alias ydos='f(){ torify youtube-dl --write-auto-sub --sub-lang en --skip-download "$1"; }; f'
      #alias ytf='f(){ youtube-dl --proxy=socks5://127.0.0.1:9050 -F "$1"; }; f'
      #alias ytd='f(){ youtube-dl --write-auto-sub --proxy=socks5://127.0.0.1:9050 -f "$1" "$2"; }; f'
    "download playlist")
      ;;
    "play audio")
      read -p "keyword: " keyword; ~/bin/scripts/ytfzf.sh -t -m "$keyword" ;;
    "play audio(history)")
      ~/bin/scripts/ytfzf.sh -H -t -m ;;
 esac
}

open_any() {
  local selected="$(__fzf_select__ "$@")"
  o $selected
}
bind -m emacs-standard -x '"\C-t": open_any'
bind -m vi-command -x '"\C-t": open_any'
bind -m vi-insert -x '"\C-t": open_any'
#---------------=[ Env ]=---------------#
# export PATH=~/sources/clifm:$PATH
export PATH=/usr/bin:$PATH
export PATH=/ucrt64/bin:$PATH
export PATH=/ucrt64/sbin:$PATH

export PATH=/c/tools:$PATH
export PATH=/c/Users/saeed/scoop/apps/amber/current:$PATH
export PATH=/c/Users/saeed/scoop/apps/arc/current:$PATH
export PATH=/c/Users/saeed/scoop/apps/dependencies/current:$PATH
export PATH=/c/Users/saeed/scoop/apps/drmemory/current/bin64:$PATH
export PATH=/c/Users/saeed/scoop/apps/flameshot/current/bin:$PATH
export PATH=/c/Users/saeed/scoop/apps/gsudo/current:$PATH
export PATH=/c/Users/saeed/scoop/apps/lf/current:$PATH
export PATH=/c/Users/saeed/scoop/apps/mandoc/current/bin:$PATH
export PATH=/c/Users/saeed/scoop/apps/nomacs/current:$PATH
export PATH=/c/Users/saeed/scoop/apps/ntop/current:$PATH
export PATH=/c/Users/saeed/scoop/apps/regdllview/current:$PATH
export PATH=/c/Users/saeed/scoop/apps/scoop/current/bin:$PATH
export PATH=/c/Users/saeed/scoop/apps/winget/current:$PATH
export PATH=/c/Users/saeed/scoop/apps/x64dbg/current/release:$PATH

export TZ='Europe/Paris'
export LESS="-R"
export PS1="[\[\e[2m\]\w\[\e[m\]]:\n↳ "

#alias fm='clifm'
export CC=/usr/bin/gcc # clang
export CXX=/usr/bin/g++ # clang++

export EDITOR="nvim"
export PDFVIEWER="zathura"
export EPUBVIEWER="zathura"
export IMAGEVIEWER="/home/linarcx/bin/scripts/nsxiv_all.sh"
export TEXTVIEWER="bat --decorations=always --color=always"
export MEDIAVIEWER="mediainfo"
export VIDEOPLAYER="mpv"
export AUDIOPLAYER="mpv"
export BROWSER="$HOME/brave/brave-browser"
export DBBROWSER="sqlitebrowser"
export YTFZF_TEMP_DIR=$HOME/.config/ytfzf

export PATH=$HOME/jdt/bin/:$PATH
export PATH=$PATH:/home/linarcx/yazi
export PATH=$PATH:~/zig/zls/zig-out/bin
export PATH=$PATH:/home/linarcx/zig/zig-linux-x86_64-0.11.0-dev.1812+26196be34/
export XDG_CACHE_HOME=$HOME/.cache
export XDG_CONFIG_HOME=$HOME/.config

export LIBS_ROOT=/home/linarcx/libs
export XDG_PICTURES_DIR=$HOME/Pictures
export GRIM_DEFAULT_DIR=$HOME/Pictures
export MANPATH=$MANPATH:$HOME/.local/man
export SUDO_ASKPASS=/usr/bin/gnome-ssh-askpass

export FZF_DEFAULT_OPTS="--layout=reverse --border --cycle" #-e
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'
export FZF_CTRL_U_COMMAND="ls -ltrah --color=auto"

export GRADLE_HOME=/usr/lib/gradle/lib
export JAVA_HOME=/usr/lib/jvm/openjdk11 #/usr/lib/jvm/java-1.8-openjdk

export JUNIT_HOME=$HOME/libs/java/junit
export CLASSPATH=$CLASSPATH:$JUNIT_HOME/junit.4.13.2.jar:.

export HAMCREST_ALL_HOME=$HOME/libs/java/hamcrest-all
export CLASSPATH=$CLASSPATH:$HAMCREST_ALL_HOME/hamcrest-all.1.3.jar:.

export ANDROID_HOME=/mnt/D/software/01_linux/ide/android/sdk
export ANDROID_SDK=/mnt/D/software/01_linux/ide/android/sdk
export ANDROID_NDK=/mnt/D/software/01_linux/ide/android/sdk/ndk/20
export ANDROID_NDK_HOME=/mnt/D/software/01_linux/ide/android/sdk/ndk/20
export ANDROID_BUILD_TOOLS="$ANDROID_SDK/build-tools"

alias emulator="$ANDROID_HOME/emulator/emulator"
export ANDROID_EMULATOR="$ANDROID_SDK/emulator"
export PATH=$ANDROID_HOME/emulator/:$PATH

export PATH=$ANDROID_HOME/platform-tools/:$PATH
#alias adb="$ANDROID_HOME/platform-tools/adb"
alias etc1tool="$ANDROID_HOME/platform-tools/etc1tool"
alias fastboot="$ANDROID_HOME/platform-tools/fastboot"
alias e2fsdroid="$ANDROID_HOME/platform-tools/e2fsdroid"
alias dmtracedump="$ANDROID_HOME/platform-tools/dmtracedump"

export PATH=$ANDROID_HOME/cmdline-tools/latest/bin/:$PATH
alias lint="$ANDROID_HOME/cmdline-tools/latest/bin/lint"
alias profgen="$ANDROID_HOME/cmdline-tools/latest/bin/profgen"
alias retrace="$ANDROID_HOME/cmdline-tools/latest/bin/retrace"
alias avdmanager="$ANDROID_HOME/cmdline-tools/latest/bin/avdmanager"
alias apkanalyzer="$ANDROID_HOME/cmdline-tools/latest/bin/apkanalyzer"
alias sdkmanager="$ANDROID_HOME/cmdline-tools/latest/bin/sdkmanager --proxy=socks --proxy_host=127.0.0.1 --proxy_port=9050"

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/linarcx/libs

export PATH=$PATH:$HOME/.nimble/bin
export PATH=$PATH:$HOME/ArchConf/home/.local/bin/scripts
export PATH=$PATH:$HOME/ArchConf/home/.local/bin/scripts/01_xbps
export PATH=$PATH:$HOME/ArchConf/home/.local/bin/scripts/02_wayland
export PATH=$PATH:$HOME/ArchConf/home/.local/bin/scripts/03_x
export PATH=$PATH:$HOME/ArchConf/home/.local/bin/scripts/04_qemu
export PATH=$PATH:$HOME/ArchConf/home/.local/bin/scripts/05_translator

export PATH=$PATH:/opt/bin
export PATH=$PATH:$HOME/.cargo/bin
export PATH=$PATH:$HOME/flutter/bin
export PATH=$PATH:$HOME/dart-sdk/bin
export PATH=$PATH:$HOME/.pub-cache/bin
export PATH=$PATH:$HOME/lua-language-server/bin/Linux/
export PATH=$PATH:/mnt/E/chromium/depot_tools
export PATH=$PATH:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin

# LaTeX
export PATH=$PATH:$HOME/.tex/local/texlive/2019/bin/x86_64-linux
export MANPATH=$MANPATH:$HOME/.tex/local/texlive/2019/texmf-dist/doc/man
export INFOPATH=$INFOPATH:$HOME/.tex/local/texlive/2019/texmf-dist/doc/info

export RUST_BACKTRACE=full

#-----------=[ Alias ]=-----------#
alias e="source ~/.bashrc"
alias nvi="nvim"
alias vi="nvim"
alias vim="nvim"
alias h='history | fzf +s --tac'
alias ll="ls -ltrah"
#--color=auto
#alias zq="zoxide query -i"
#alias o="xdg-open"
# exa -l --no-permissions --no-user --no-time --all
alias bp="cc -o p project.c"
alias p="./p"
alias top="htop"
alias sp=". project.sh"
alias seergdb=/mnt/E/software/01_linux/seergdb
alias luamake=/home/linarcx/lua-language-server/3rd/luamake/luamake

alias copy="rsync -aP"
alias move='rsync -aP --remove-source-files'

alias fzp="fzf --preview 'bat --style=numbers --color=always {}'"

alias duch='f(){ du -ch "$1"; }; f'
alias lam='f() { apropos -s "$1" . | less; }; f'
alias mkar='f() { tar -czvf "$1".tar.gz "$2"; }; f'
alias asen='f(){ torsocks autosub --speech-language en-us -i "$1"; };f'
alias asfa='f(){ torsocks autosub --speech-language fa-ir -i "$1"; };f'
alias siv="nsxiv_all.sh"

# build-tools
alias pkg_path="pkg-config --variable pc_path pkg-config"

export PROMPT_COMMAND="history -a; history -n; ${PROMPT_COMMAND}"
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

## Prevent java applications to show blank screen
export _JAVA_AWT_WM_NONREPARENTING=1
export AWT_TOOLKIT=MToolkit
#source ~/.local/share/blesh/ble.sh
export C_CACHE_SIZE=$((50*1024)) # 50 MB
#source ~/ArchConf/home/bash-powerline.sh

########################################################################################
#
# To the extent possible under law, the author(s) have dedicated all
# copyright and related and neighboring rights to this software to the
# public domain worldwide. This software is distributed without any warranty.
# You should have received a copy of the CC0 Public Domain Dedication along
# with this software.
# If not, see <https://creativecommons.org/publicdomain/zero/1.0/>.

# ~/.bashrc: executed by bash(1) for interactive shells.

# The copy in your home directory (~/.bashrc) is yours, please
# feel free to customise it to create a shell
# environment to your liking.  If you feel a change
# would be benifitial to all, please feel free to send
# a patch to the msys2 mailing list.

# User dependent .bashrc file

# Shell Options
#
# See man bash for more options...
#
# Don't wait for job termination notification
# set -o notify
#
# Don't use ^D to exit
# set -o ignoreeof
#
# Use case-insensitive filename globbing
# shopt -s nocaseglob
#
# Make bash append rather than overwrite the history on disk
# shopt -s histappend
#
# When changing directory small typos can be ignored by bash
# for example, cd /vr/lgo/apaache would find /var/log/apache
# shopt -s cdspell

# Completion options
#
# These completion tuning parameters change the default behavior of bash_completion:
#
# Define to access remotely checked-out files over passwordless ssh for CVS
# COMP_CVS_REMOTE=1
#
# Define to avoid stripping description in --option=description of './configure --help'
# COMP_CONFIGURE_HINTS=1
#
# Define to avoid flattening internal contents of tar files
# COMP_TAR_INTERNAL_PATHS=1
#
# Uncomment to turn on programmable completion enhancements.
# Any completions you add in ~/.bash_completion are sourced last.
# [[ -f /etc/bash_completion ]] && . /etc/bash_completion

# History Options
#
# Don't put duplicate lines in the history.
# export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
#
# Ignore some controlling instructions
# HISTIGNORE is a colon-delimited list of patterns which should be excluded.
# The '&' is a special pattern which suppresses duplicate entries.
# export HISTIGNORE=$'[ \t]*:&:[fb]g:exit'
# export HISTIGNORE=$'[ \t]*:&:[fb]g:exit:ls' # Ignore the ls command as well
#
# Whenever displaying the prompt, write the previous line to disk
# export PROMPT_COMMAND="history -a"

# Aliases
#
# Some people use a different file for aliases
# if [ -f "${HOME}/.bash_aliases" ]; then
#   source "${HOME}/.bash_aliases"
# fi
#
# Some example alias instructions
# If these are enabled they will be used instead of any instructions
# they may mask.  For example, alias rm='rm -i' will mask the rm
# application.  To override the alias instruction use a \ before, ie
# \rm will call the real rm not the alias.
#
# Interactive operation...
# alias rm='rm -i'
# alias cp='cp -i'
# alias mv='mv -i'
#
# Default to human readable figures
# alias df='df -h'
# alias du='du -h'
#
# Misc :)
# alias less='less -r'                          # raw control characters
# alias whence='type -a'                        # where, of a sort
# alias grep='grep --color'                     # show differences in colour
# alias egrep='egrep --color=auto'              # show differences in colour
# alias fgrep='fgrep --color=auto'              # show differences in colour
#
# Some shortcuts for different directory listings
# alias ls='ls -hF --color=tty'                 # classify files in colour
# alias dir='ls --color=auto --format=vertical'
# alias vdir='ls --color=auto --format=long'
# alias ll='ls -l'                              # long list
# alias la='ls -A'                              # all but . and ..
# alias l='ls -CF'                              #

# Umask
#
# /etc/profile sets 022, removing write perms to group + others.
# Set a more restrictive umask: i.e. no exec perms for others:
# umask 027
# Paranoid: neither group nor others have any perms:
# umask 077

# Functions
#
# Some people use a different file for functions
# if [ -f "${HOME}/.bash_functions" ]; then
#   source "${HOME}/.bash_functions"
# fi
#
# Some example functions:
#
# a) function settitle
# settitle ()
# {
#   echo -ne "\e]2;$@\a\e]1;$@\a";
# }
#
# b) function cd_func
# This function defines a 'cd' replacement function capable of keeping,
# displaying and accessing history of visited directories, up to 10 entries.
# To use it, uncomment it, source this file and try 'cd --'.
# acd_func 1.0.5, 10-nov-2004
# Petar Marinov, http:/geocities.com/h2428, this is public domain
# cd_func ()
# {
#   local x2 the_new_dir adir index
#   local -i cnt
#
#   if [[ $1 ==  "--" ]]; then
#     dirs -v
#     return 0
#   fi
#
#   the_new_dir=$1
#   [[ -z $1 ]] && the_new_dir=$HOME
#
#   if [[ ${the_new_dir:0:1} == '-' ]]; then
#     #
#     # Extract dir N from dirs
#     index=${the_new_dir:1}
#     [[ -z $index ]] && index=1
#     adir=$(dirs +$index)
#     [[ -z $adir ]] && return 1
#     the_new_dir=$adir
#   fi
#
#   #
#   # '~' has to be substituted by ${HOME}
#   [[ ${the_new_dir:0:1} == '~' ]] && the_new_dir="${HOME}${the_new_dir:1}"
#
#   #
#   # Now change to the new dir and add to the top of the stack
#   pushd "${the_new_dir}" > /dev/null
#   [[ $? -ne 0 ]] && return 1
#   the_new_dir=$(pwd)
#
#   #
#   # Trim down everything beyond 11th entry
#   popd -n +11 2>/dev/null 1>/dev/null
#
#   #
#   # Remove any other occurence of this dir, skipping the top of the stack
#   for ((cnt=1; cnt <= 10; cnt++)); do
#     x2=$(dirs +${cnt} 2>/dev/null)
#     [[ $? -ne 0 ]] && return 0
#     [[ ${x2:0:1} == '~' ]] && x2="${HOME}${x2:1}"
#     if [[ "${x2}" == "${the_new_dir}" ]]; then
#       popd -n +$cnt 2>/dev/null 1>/dev/null
#       cnt=cnt-1
#     fi
#   done
#
#   return 0
# }
#
# alias cd=cd_func
#################################################################################
#
##function ya() {
#	local tmp="$(mktemp -t "yazi-cwd.XXXXX")"
#	yazi "$@" --cwd-file="$tmp"
#	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
#		cd -- "$cwd"
#	fi
#	rm -f -- "$tmp"
#}
#
##function current_branch()
#{
#	BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
#	if [ ! "${BRANCH}" == "" ]
#	then
#		STAT=`git_status`
#		echo -e "[${BRANCH}${STAT}]"
#	else
#		echo ""
#	fi
#}
#
#function git_status
#{
#	status=`git status 2>&1 | tee`
#	dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
#	untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
#	ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
#	newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
#	renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
#	deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
#	bits=''
#	if [ "${renamed}" == "0" ]; then
#		bits="\e[1;32m⚡${bits}\e[0m"
#	fi
#	if [ "${ahead}" == "0" ]; then
#		bits="\e[1;32m➲ ${bits}\e[0m"
#	fi
#	if [ "${newfile}" == "0" ]; then
#		bits="\e[1;36m►${bits}\e[0m"
#	fi
#	if [ "${untracked}" == "0" ]; then
#		bits="\e[1;33m◆${bits}\e[0m"
#	fi
#	if [ "${deleted}" == "0" ]; then
#		bits="\e[1;31m✗${bits}\e[0m"
#	fi
#	if [ "${dirty}" == "0" ]; then
#		bits="\e[1;33m⚕${bits}\e[0m"
#	fi
#	if [ ! "${bits}" == "" ]; then
#		echo " ${bits}"
#	else
#        echo " \e[1;32m✓${bits}\e[0m"
#	fi
#}
#
#copy()
#{
#  strace -q -ewrite cp -- "${1}" "${2}" 2>&1 \
#    | awk '{
#      count += $NF
#          if (count % 10 == 0) {
#             percent = count / total_size * 100
#             printf "%3d%% [", percent
#             for (i=0;i<=percent;i++)
#                printf "="
#             printf ">"
#             for (i=percent;i<100;i++)
#                printf " "
#             printf "]\r"
#          }
#       }
#       END { print "" }' total_size=$(stat -c '%s' "${1}") count=0
#}
#
#tree () {
#  if [ $# -eq 0 ]; then
#    output=$(command tree -n -L 1 --si)
#    output_lines=$(echo -e "$output" | wc -l)
#
#    if [ $output_lines -lt $lines ]; then
#      echo -e "$output"
#    else
#      echo -e "$output" | less
#    fi
#  else
#    output=$(command tree -n -L $1 --si)
#    output_lines=$(echo -e "$output" | wc -l)
#
#    if [ $output_lines -lt $lines ]; then
#      echo -e "$output"
#    else
#      echo -e "$output" | less
#    fi
#  fi
#}
#
#alias tree="tree -n | less"
#alias tree="output=$(tree -n) ; output_lines=$(echo -e "$output" | wc -l); if [ $output_lines -lt $lines ]; then less -F; else less; fi"

#source /home/linarcx/.config/broot/launcher/bash/br

##-----------------------------------------------------
## synth-shell-greeter.sh
#if [ -f /home/linarcx/.config/synth-shell/synth-shell-greeter.sh ] && [ -n "$( echo $- | grep i )" ]; then
#	source /home/linarcx/.config/synth-shell/synth-shell-greeter.sh
#fi

###-----------------------------------------------------
### synth-shell-prompt.sh
#if [ -f /home/linarcx/.config/synth-shell/synth-shell-prompt.sh ] && [ -n "$( echo $- | grep i )" ]; then
#	source /home/linarcx/.config/synth-shell/synth-shell-prompt.sh
#fi
#
###-----------------------------------------------------
### better-ls
#if [ -f /home/linarcx/.config/synth-shell/better-ls.sh ] && [ -n "$( echo $- | grep i )" ]; then
#	source /home/linarcx/.config/synth-shell/better-ls.sh
#fi
#
###-----------------------------------------------------
### alias
#if [ -f /home/linarcx/.config/synth-shell/alias.sh ] && [ -n "$( echo $- | grep i )" ]; then
#	source /home/linarcx/.config/synth-shell/alias.sh
#fi
#
###-----------------------------------------------------
### better-history
#if [ -f /home/linarcx/.config/synth-shell/better-history.sh ] && [ -n "$( echo $- | grep i )" ]; then
#	source /home/linarcx/.config/synth-shell/better-history.sh
#fi
#
##alias sdwm="xinit dwm"
#alias spp="xinit stumpwm"
#alias sxfce="startxfce4"
#alias sen="startx /usr/bin/enlightenment_start"
#alias sw="XDG_CURRENT_DESKTOP=Sway; wayfire"


## Qt
#alias lupdate='f(){ /mnt/E/Qt/Linux/5.13.0/gcc_64/bin/lupdate -pro "$1" -ts "$2"'
#alias linguist='/mnt/E/Qt/Linux/5.13.0/gcc_64/bin/linguist'
#alias lrelease='/mnt/E/Qt/Linux/5.13.0/gcc_64/bin/lrelease'
