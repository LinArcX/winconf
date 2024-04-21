#!/bin/bash

# clifm history: ~/.config/clifm/profiles/default/history.clifm
cat ~/.config/clifm/profiles/default/history.clifm | sed '/^#/d' | fzf --prompt="clifm history: " --height=12 --cycle --tac # awk '!a[$0]++' --> to remove duplicates