#!/bin/bash

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