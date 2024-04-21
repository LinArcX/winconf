#!/bin/bash

selected=$(lsblk --noheadings --raw -o NAME,MOUNTPOINT | awk '$1~/[[:digit:]]/ && $2 != ""' | sed 's/|/ /' | awk '{print $1}' | fzf --header="to unmount: " )
if [[ -n "$selected" ]]; then
  udevil unmount /dev/$selected
  echo "$selected unmounted"
fi