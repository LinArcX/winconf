#!/bin/bash

# .bash_history
cat ~/.bash_history | fzf --prompt="bash history: " --height=12 --cycle --tac # awk '!a[$0]++' --> to remove duplicates