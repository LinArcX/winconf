#!/bin/bash

commands=("/d/workspace/other/life/" "/d/workspace/c++/02_maintainance/wmenu" 
  "/d/workspace/other/winconf" "~/Downloads" "~/.config/nvim" "~/.local/share/Trash/files" "~/.config/mpv" 
  "/d/workspace/c++/01_active/pardis"
  "/d/workspace/other/ArenOs"
  "/d/workspace/c/01_active/kaveh"
  "/d/workspace/c/01_active/akoman"
  "/d/workspace/c/01_active/cave"
  "/d/workspace/other/Nand2Tetris"
  "/e" "/e/video/movies/" "/e/video/tv_series" "/d" "/d/books" "/d/video" "/d/images" 
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
cd $selected
