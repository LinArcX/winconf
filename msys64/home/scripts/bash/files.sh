#!/bin/bash

commands=("~/.bashrc" "~/.xinitrc"  "~/.asoundrc" "~/.profile" "~/.bash_profile" "~/.inputrc" "~/.xbindkeysrc" "~/.xmodmaprc")
selected=$(printf '%s\n' "${commands[@]}" | sed "s|~|$HOME|" | fzf --header="files:" --preview 'v {}')
. $HOME/scripts/bash/open_files.sh $selected