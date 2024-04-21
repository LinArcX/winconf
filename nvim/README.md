put all the content of mpv directory here:
C:\Users\<USERNAME>\AppData\Local

# Notes, tips, tricks about this configurations

# fix colorshceme in diff mode
```
:diffoff!
:windo diffthis
```
- light colorshcemes: github, tango-morning
- dark colorschemes: monokai, gruvbox8, railscasts

## Tips
- All files in `plugin` directory will load automatically.

## Normal Mode
  - o: insert new line below current line.
  - O: insert new line above current line.
  - CTRL-o: Go to Older cursor position in jump list.
  - CTRL-i: Go to Newer cursor position in jump list.
  - g; : Go to older position in change list.
  - g, : Go to newer position in change list.
  - diw: delete current word
  - ciw: change current word
  - <S-c> : Replace from current position to end of line.
  - '. : Jump to last modification line.
  - `. : Jump to exact spot in last modification line
  - ]] : next section
  - ]m : next method
  - [m : back to the start of the method
 - ) : Next sentence |linarcx-notes| `code here`
 - CTRL-D : Down half a page
 - CTRL-U : Up half a page
 - ~ Uppercase a letter (works on ranges)
 - z commands:
    - z : Current line at the top
    - z. : current line at the center
    - z- : current line at the bottom
 - /<C-R><C-W>: Pull word into command line (or search)

## Visual Mode
  - SHIFT-[LEFT/RIGHT] : Shift one word left or right
  - J : Join the highlighted lines, removing unnecessary whitespace.
  - va' : select a single-quoted string (also works with " and `)
  - vi' : select the contents of a single-quoted string
  - vab : select a "block" (works differently in different langs)
  - vat : select a <tag> and its contents (use i instead of a for just
    contents)

## Insert Mode
  - <C-N>: Complete word
  - <C-N><C-P>: Complete word (?)
  - <C-X><C-L>: Complete line (!!)
  - \cc: <Leader>cc Comment out all selected rows with a single-line comment
    (//) — part of NERDCommenter
  - \\w: Navigate to a word with EasyMotion’s help (works with any navigation
    commands)

## Command Mode
  - :wall : Save modified buffers
  - :x : Save buffer only if modified, then exit (better than :wq)
  - :reg : list registers (and show what’s in them)

## Windows
  - To increase a window to its maximum height, use Ctrl-w _.
  - To increase a window to its maximum width, use Ctrl-w |.
  - To full scree the current buffer: Ctrl-w-o
  - For a split window: You can use Ctrl-w + and Ctrl-w - to resize the height of the current window by a single row.
  - For a vsplit window: You can use Ctrl-w > and Ctrl-w < to resize the width of the current window by a single column.
  - Additionally, these key combinations accept a count prefix so that you can change the window size in larger steps. [e.g. Ctrl-w 10 + increases the window size by 10 lines]
  - To resize all windows to equal dimensions based on their splits, you can use Ctrl-w =.
put all the content of nvim here:
C:\Users\<USERNAME>\AppData\Local

# Awesome vim
In this part i'll be discuss about awesome plugins that i found in vim
community.

## Colorschemes
- 'kristijanhusak/vim-hybrid-material'
- 'gruvbox-material/vim'
- 'morhetz/gruvbox/'
- 'tomasr/molokai'
- 'Mcmartelle/vim-monokai-bold'
- 'doums/darcula'
- 'sjl/badwolf'
- 'levelone/tequila-sunrise.vim'
- 'sainnhe/edge'
- 'jnurmine/Zenburn'
- 'nanotech/jellybeans.vim'

## Plugins
  Here i will describe my plugins.