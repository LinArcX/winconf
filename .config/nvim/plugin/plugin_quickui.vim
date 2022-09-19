" enable to display tips in the cmdline
let g:quickui_show_tip = 1
let g:quickui_border_style = 2
let g:quickui_color_scheme = 'gruvbox'

" clear all the menus
"call quickui#menu#reset()

" You can't use hjkl
"c -> c
"p -> cpp
"r -> project
"o -> Coc
"D -> Debuggin
"T -> Test
"FEQxBWaVH

"fsaq
call quickui#menu#install('&File', [
            \ [ "sa&ve-session", 'call MakeSession(1)' ],
            \ [ "l&oad-session", 'call LoadSession()' ],
            \ [ "--", '' ],
            \ [ "&save\tCtrl-s", 'w' ],
            \ [ "save-&all\tCtrl-Alt-s", 'wa' ],
            \ [ "&quit\tCtrl-q", 'qa' ],
            \ ])

" fare--np--sto
call quickui#menu#install('&Edit', [
            \ [ "&find-current-file\tAlt-w", 'vimgrep <cword> %'],
            \ [ "find-&all-files", 'vimgrep <cword> **/*'],
            \ [ "&replace-current-file", 'call feedkeys(":cdo %s/".expand("<cword>")."//gc")'],
            \ [ "replac&e-all-file\tAlt-r", 'call feedkeys(":%s/".expand("<cword>")."//gc")'],
            \ [ "--", '' ],
            \ [ "&space-to-tab", 'set noet|retab!<cr>' ],
            \ [ "&tab-to-space", 'set et|retab\<cr>' ],
            \ [ "select wh&ole file\t Ctrl-a", 'call feedkeys("GVgg")' ],
            \ ])

" qnpfs
call quickui#menu#install('&Quick-fix', [
            \ [ "&quick-fix", 'copen' ],
            \ [ "&next-error\tCtrl-n", 'cnext' ],
            \ [ "&previous-error\tCtrl-p", 'cprevious' ],
            \ [ "&first", 'cfirst' ],
            \ [ "la&st", 'clast' ],
            \ ])

function! OnClosePort(job_id, data, event) dict
    if a:event == "stdout" && a:data[0] != ''
        call ShowTextBox("Port", a:data)
    endif
    if a:event == "stderr" && a:data[0] != ''
        echom " "
        let g:temp = a:data[0]
        set statusline=
        set laststatus=2
        set statusline+=%0*\ %{ModeCurrent()}\ %1*\%{GitBranch()}\%2*
        set statusline+=%2*\ %{nr2char(0x26D4)}\ %2*\ %{g:temp}
        set statusline+=%2*%#warningmsg#
        set statusline+=
        set statusline+=%*\%2*\ %=\%7*\%3*\ %{ReadOnly()}\ %4*\ %{nr2char(0x1f4dd)}\%1*\ %{FilePermission()}\ %5*\ %{nr2char(0x1f47d)}
        set statusline+=%6*\ %{(&fenc!=''?&fenc:&enc)}\[%{&ff}]\ |
        set statusline+=%1*\ %-3(%{FileSize()}%)\%1*\ %3p%%\ \ %l:\%3c
        let timer = timer_start(3000, 'ResetStatusLine')
    endif
endfunction
function! ClosePort()
    let l:port_number = input('Enter port number: ')
    let l:callbacks = {
                \ 'on_stdout': function('OnClosePort'),
                \ 'on_stderr': function('OnClosePort'),
                \ }
    call jobstart('kill -9 "' .l:port_number .'"', l:callbacks)
endfunction

"tvngse
call quickui#menu#install('E&xternal', [
            \ [ "&hterminal\tCtrl-t", 'call HTerminal(0.4, 300.0)' ],
            \ [ "&vterminal\tAlt-t", 'call VTerminal(0.5, 300.0)' ],
            \ [ "&terminal", 'call FTerminal()' ],
            \ [ "ra&nger\tCtrl-m", 'call FTerminal("ranger && exit \n")' ],
            \ [ "&scc", 'call FTerminal("scc . | less && exit \n")' ],
            \ [ "&ports", 'call ExecCommands("Ports", "!netstat -antp")' ],
            \ [ "&kill-port", 'call ClosePort()' ],
            \ [ "tr&ee", 'call ShowTree()' ],
            \ ])

"flnpd
call quickui#menu#install('&Buffers', [
            \ [ "&first-buffer", ':bfirst' ],
            \ [ "&last-buffer", ':blast' ],
            \ [ "&next-buffer", 'bnext'],
            \ [ "&previous-buffer", 'bprevious' ],
            \ [ "&delete-buffer", ':bd' ],
            \ [ "&wip-buffer\tAlt-q", ':bw' ],
            \ [ "&close-unlisted-buffers\tShift-q", ':BOnly' ],
            \ ])

"dnlrbuciexspa
call quickui#menu#install('&Windows', [
            \ [ "&delete-window", 'wincmd c' ],
            \ [ "&next-window", 'wincmd w' ],
            \ [ "window-&left", 'wincmd h' ],
            \ [ "window-&right", 'wincmd l' ],
            \ [ "window-&bottom", 'wincmd j' ],
            \ [ "window-&up", 'wincmd k' ],
            \ [ "&rotate", 'wincmd R' ],
            \ [ "redu&ce-window-size", 'resize -5' ],
            \ [ "&increase-window-size", 'resize +5' ],
            \ [ "&expand-window-left", 'wincmd 5<' ],
            \ [ "e&xpand-window-right", 'wincmd 5>' ],
            \ [ "&split-window-below", 'wincmd s' ],
            \ [ "s&plit-window-right", 'wincmd v' ],
            \ [ "b&alance-window", 'wincmd =' ],
            \ ])

"wet--prfucgos--dmv--''--itab
call quickui#menu#install('&Vim', [
            \ [ "p&wd", 'pwd' ],
            \ [ "r&eload vim", 'source $MYVIMRC' ],
            \ [ 'check-heal&th', 'checkhealth', ''],
            \ [ "--", '' ],
            \ [ "gre&p\tAlt-s", 'call SearchInside()'],
            \ [ "search-&replace\tAlt-r", 'call SearchReplace()'],
            \ [ "&files\tCtrl-f", 'call Files()' ],
            \ [ "j&umps\tAlt-j", 'call Jumps()' ],
            \ [ "&commands", 'call Commands()' ],
            \ [ "re&gisters\tAlt-e", 'call Registers()' ],
            \ [ "&open-buffers", 'call OpenBuffers()' ],
            \ [ "search_hi&story\tCtrl-h", 'call SearchHistory()' ],
            \ [ "--", '' ],
            \ [ 'paste-mo&de %{&paste? "OFF":"ON"}', 'set paste!'],
            \ [ 'cursor-line %{&cursorline? "OFF":"ON"}', 'set cursorline!'],
            \ [ 'cursor-colu&mn %{&cursorcolumn? "OFF":"ON"}', 'set cursorcolumn!'],
            \ [ "spell-checker %{&spell? 'OFF':'ON'}", 'set spell!'],
            \ [ "relati&ve number %{&relativenumber? 'OFF':'ON'}", ':set relativenumber!' ],
            \ [ "search-highlighting\tF(12)", 'set hlsearch!' ],
            \ [ "--", '' ],
            \ [ "arabic-keymap", 'set rightleft' ],
            \ [ "english-keymap", 'set norightleft' ],
            \ [ "--", '' ],
            \ [ "scr&ipts", 'call Scripts()' ],
            \ [ "all-op&tions", 'call ExecCommands("All options", "set all")' ],
            \ [ "ch&anges-list", 'call Changes()' ],
            \ [ "vim-varia&bles", 'call ExecCommands("Vim variables", "let v:")' ],
            \ [ "differ-options", 'call ExecCommands("differ-options", "set")' ],
            \ [ "global-variables", 'call ExecCommands("Global variables", "let g:")' ],
            \ ], 9000)

" register HELP menu with weight 10000
" ics--mtq
call quickui#menu#install('&Help', [
            \ ['t&ips', "H tips", ''],
            \ ["&cheatsheet", "H index", ''],
            \ ["&search-help\tF(1)", "Clap help", ''],
            \ ['--',''],
            \ ['su&mmary', "H summary", ''],
            \ ["&tutorial", "H tutor", ''],
            \ ['&quick Reference', "H quickref", ''],
            \ ], 10000)

" list all buffers
noremap <space><space> :call quickui#tools#list_buffer('e')<cr>

" hit <leader> to open menu
noremap <silent> <leader> :call quickui#menu#open()<cr>
