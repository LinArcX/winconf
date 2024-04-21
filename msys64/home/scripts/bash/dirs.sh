#!/bin/bash

commands=("~/VoidConf" "~/.config/yazi" "/mnt/D/workspace/other/life/" "/mnt/D/workspace/c++/02_maintainance/wmenu" 
  "/mnt/D/workspace/other/winconf" "~/Downloads" "~/.config/nvim" "~/.local/share/Trash/files"
  "/mnt/D/workspace/c/01_active/dwm" "~/.config/alacritty" "~/.config/mpv" 
  "/mnt/D/workspace/c++/01_active/pardis"
  "/mnt/D/workspace/other/ArenOs"
  "/mnt/D/workspace/c/01_active/kaveh"
  "/mnt/D/workspace/c/01_active/akoman"
  "/mnt/D/workspace/c/01_active/cave"
  "/mnt/D/workspace/other/Nand2Tetris"
  "/mnt/E" "/mnt/E/video/movies/" "/mnt/E/video/tv_series" "/mnt/D" "/mnt/D/books" "/mnt/D/video" "/mnt/D/images" 
  "/mnt/D/video/computer/languages/c/00_bitwise/"
  "/mnt/D/video/computer/languages/c/01_hand_made_hero"
  "/mnt/D/video/computer/languages/c/02_make_video_game_from_scratch_in_c"
  "/mnt/D/video/computer/languages/c/04_programming_a_text_editor_from_scratch"
  "/mnt/D/video/computer/languages/c/05_porgramming_an_x64_compiler"
  "/mnt/D/video/computer/languages/c/06_write_your_own_os"
  "/mnt/D/video/computer/languages/c/07_simple_profiler_from_scratch"
  "/mnt/D/video/computer/languages/c/09_using_win_dbg"
  "/mnt/D/video/computer/languages/c/11_graphic_programming")

selected=$(printf '%s\n' "${commands[@]}" | sed "s|~|$HOME|" | fzf --header="dirs:" --preview 'v {}')
cd $selected