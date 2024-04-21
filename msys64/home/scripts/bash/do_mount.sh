#!/bin/bash

selected=$(lsblk --noheadings --raw -o NAME,MOUNTPOINT | awk '$1~/[[:digit:]]/ && $2 == ""' | fzf --header="to mount:")
if [[ -n "$selected" ]]; then
  udevil mount /dev/$selected
  echo "$selected mounted"
fi