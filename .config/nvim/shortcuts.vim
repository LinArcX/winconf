"--------------------------------=[ <F> keys ]=-------------------------------------------"
" Notice that you can only bind: t, y, f, m, n characters!
" <F1> For help, <F2> For switch between .hpp/.cpp files.
nnoremap <silent> <F1> :Clap help<CR>
nnoremap <silent> <F12> :set hlsearch!<CR>

" Debugging shortkeys
nmap <F5> <Plug>VimspectorContinue
nmap <F6> <Plug>VimspectorStepOver
nmap <F7> <Plug>VimspectorStepInto
nmap <F8> <Plug>VimspectorStepOut
nmap <F9> <Plug>VimspectorStop
nmap <F10> <Plug>VimspectorToggleBreakpoint
nmap <S-p> <Plug>VimspectorPause
nmap <S-r> <Plug>VimspectorRestart
nnoremap <S-s> :call vimspector#Reset()<cr>
noremap <S-b> ":VimspectorWatch ".expand("<cword>")
"nmap <C-F10> <Plug>VimspectorAddFunctionBreakpoint('<cexpr>')

"----------------------=[ Move Block of items visually ]=-----------------------"
" Remove any introduced trailing whitespace after moving
let g:DVB_TrimWS = 1
noremap <silent> <C-A-up>   :call SwapUp()<CR>
noremap <silent> <C-A-down> :call SwapDown()<CR>
vmap  <expr> <C-A-right>    DVB_Drag('right')
vmap  <expr> <C-A-left>     DVB_Drag('left')
vmap  <expr>  D             DVB_Duplicate()

"--------------------------=[ General Actions ]=-----------------------------------------"
" Save File (normal-mode)
nnoremap <silent> <C-s> :w <Enter>
nnoremap <silent> <C-A-s> :wa <Enter>

" Save File (insert-mode)
inoremap <silent> <C-s> <C-O>:w <CR>
inoremap <silent> <C-A-s> <C-O>:wa <CR>

" Select All
nnoremap <silent> <C-a> GVgg
nnoremap <silent> <C-f> :call Files()<CR>
nnoremap <silent> <C-h> :call SearchHistory()<CR>
nnoremap <silent> <C-t> :call HTerminal(0.4, 300.0)<CR>
nnoremap <silent> <A-t> :call VTerminal(0.5, 300.0)<CR>
nnoremap <silent> <C-A-t> :call FTerminal()<CR>
"nnoremap <silent> <A-t> :call <SID>open_scc()<CR>

nnoremap <A-l> @:

" Quit from vim
nnoremap <silent> <C-q> :qa<CR>
" Cut
nnoremap <silent> <c-x> d
"Duplicate Line
" Paste in insert-mode
inoremap <silent> <C-v> <C-O>p

"nnoremap <silent> <C-m> :call TerminalAction(2, "ranger && exit \n")<CR>

nnoremap <silent> <A-d> Yp
nnoremap <silent> <A-f> :call GitFiles()<CR>
" Open File (Opens current folder to browse)
nnoremap <silent> <A-o> :e . <Enter>
" Quit from current buffer and switch to Previous one
nnoremap <silent> <A-q> :bw<CR>
" Close All unlisted Buffers
nnoremap <silent> <S-q> :BOnly<CR>

"--------------------------=[ Find and Replace ]=----------------------------------------"
" Replace All
nnoremap <A-h> :%s/
" Search
nnoremap <A-g> :call SearchInside()<CR>
" Search and Replace
nnoremap <expr><A-w> ":%s/".expand("<cword>")."//gc<left><left><left>"
nnoremap <silent> <A-r> :call SearchReplace()<CR>

"Search current word in all files
"nnoremap <A-w> :vimgrep <cword> **/*.*<CR>
nnoremap <A-s> :vimgrep <cword> %<CR>
" List jumps for selection.
nnoremap <A-j> :call Jumps()<CR>
nnoremap <A-e> :call Registers()<CR>
" Find with regex
"nnoremap ? /\c

"-----------------------=[ Switch between buffers ]=--------------------------------------"
nnoremap <silent> <C-Left>  :bprevious<cr>
nnoremap <silent> <C-Right> :bnext<cr>

"--------------------------=[ Switch between windows ]=-----------------------------------"
nnoremap <silent> <A-Up>    :wincmd k<CR>
nnoremap <silent> <A-Down>  :wincmd j<CR>
nnoremap <silent> <A-Left>  :wincmd h<CR>
nnoremap <silent> <A-Right> :wincmd l<CR>

"--------------------------------=[ Comments ]=-------------------------------------------"
autocmd FileType el let b:comment_leader = ';; '
autocmd FileType vim let b:comment_leader = '" '
autocmd FileType haskell let b:comment_leader = '-- '
autocmd FileType shell,sh,ruby,python   let b:comment_leader = '# '
autocmd FileType c,cpp,java,go,rust,dart let b:comment_leader = '// '

"-----------------------------=[ Selection ]=---------------------------------------------"
" Select (HTML, XML etc.) tag (inclusive)
map <S-t> vat
" Select (HTML, XML etc.) tag (exclusive)
map <S-T> vit
" Select text between {}
map <S-{> vi{
" Select text between ()
map <S-(> vi(
" Select text between []
map <S-[> vi[
" Select text between <>
map <S-<> vi<

"-----------------------------=[ Quick Fix actions ]=--------------------------------------"
"Display the Next/Previous error in the list that includes a file name.
nnoremap <C-n> :cnext<CR>
nnoremap <C-p> :cprevious<CR>

"-------------------------------=[ Other ]=-----------------------------------------------"
set pastetoggle=<A-p>   " PasteMode disable auto-indent and bracket auto-compelation and it helps you to paste code from elsewhere.

"------------------------------=[ Remap section ]=----------------------------------------"
nnoremap ; :
vnoremap ; :
vnoremap : ;

ca help H
ca h H

""""""""""""
fun! FilterClose(bufnr)
    wincmd p
    execute "bwipe" a:bufnr
    redraw
    echo "\r"
    return []
endf

fun! Finder(input, prompt) abort
    let l:prompt = a:prompt . '>'
    let l:filter = ""
    let l:undoseq = []
    botright 10new +setlocal\ buftype=nofile\ bufhidden=wipe\
        \ nobuflisted\ nonumber\ norelativenumber\ noswapfile\ nowrap\
        \ foldmethod=manual\ nofoldenable\ modifiable\ noreadonly
    let l:cur_buf = bufnr('%')
    if type(a:input) ==# v:t_string
        let l:input = systemlist(a:input)
        call setline(1, l:input)
    else " Assume List
        call setline(1, a:input)
    endif
    setlocal cursorline
    redraw
    echo l:prompt . " "
    while 1
        let l:error = 0 " Set to 1 when pattern is invalid
        try
            let ch = getchar()
        catch /^Vim:Interrupt$/  " CTRL-C
            return FilterClose(l:cur_buf)
        endtry
        if ch ==# "\<bs>" " Backspace
            let l:filter = l:filter[:-2]
            let l:undo = empty(l:undoseq) ? 0 : remove(l:undoseq, -1)
            if l:undo
                silent norm u
            endif
        elseif ch >=# 0x20 " Printable character
            let l:filter .= nr2char(ch)
            let l:seq_old = get(undotree(), 'seq_cur', 0)
            try " Ignore invalid regexps
                execute 'silent keepp g!:\m' . escape(l:filter, '~\[:') . ':norm "_dd'
            catch /^Vim\%((\a\+)\)\=:E/
                let l:error = 1
            endtry
            let l:seq_new = get(undotree(), 'seq_cur', 0)
            " seq_new != seq_old iff the buffer has changed
            call add(l:undoseq, l:seq_new != l:seq_old)
        elseif ch ==# 0x1B " Escape
            return FilterClose(l:cur_buf)
        elseif ch ==# 0x0D " Enter
            let l:result = empty(getline('.')) ? [] : [getline('.')]
            call FilterClose(l:cur_buf)
            return l:result
        elseif ch ==# 0x0C " CTRL-L (clear)
            call setline(1, type(a:input) ==# v:t_string ? l:input : a:input)
            let l:undoseq = []
            let l:filter = ""
            redraw
        elseif ch ==# 0x0B " CTRL-K
            norm k
        elseif ch ==# 0x0A " CTRL-J
            norm j
        endif
        redraw
        echo (l:error ? "[Invalid pattern] " : "").l:prompt l:filter
    endwhile
endf

fun! OpenBuffers()
    let buffers = split(execute('ls'), "\n")
    let choice = Finder(buffers, 'Switch to buffer')
    if !empty(choice)
        execute "buffer" split(choice[0], '\s\+')[0]
    endif
endf

fun! Registers()
    let choice = Finder(split(execute('registers'), "\n"), 'Choose: ')
    if !empty(choice)
        execute "buffer" split(choice[0], '\s\+')[0]
    endif
endf

fun! Commands()
    let choice = Finder(split(execute('command'), "\n"), 'Choose: ')
    if !empty(choice)
        execute "buffer" split(choice[0], '\s\+')[0]
    endif
endf

fun! SearchHistory()
    let choice = Finder(split(execute('history'), "\n"), 'Choose: ')
    if !empty(choice)
        execute "buffer" split(choice[0], '\s\+')[0]
    endif
endf

fun! Jumps()
    let choice = Finder(split(execute('jumps'), "\n"), 'Choose: ')
    if !empty(choice)
        execute "buffer" split(choice[0], '\s\+')[0]
    endif
endf

fun! Scripts()
    let choice = Finder(split(execute('scriptnames'), "\n"), 'Choose: ')
    if !empty(choice)
        execute "buffer" split(choice[0], '\s\+')[0]
    endif
endf

fun! Changes()
    let choice = Finder(split(execute('changes'), "\n"), 'Choose: ')
    if !empty(choice)
        execute "buffer" split(choice[0], '\s\+')[0]
    endif
endf


fun! GitHistory()
    let choice = Finder('git log', "Choose: ")
    if !empty(choice)
        execute "buffer" split(choice[0], '\s\+')[0]
    endif
endf

fun! Files()
    let choice = Finder('find . -type f', "All files")
    if !empty(choice)
        execute "edit" choice[0]
    endif
endf

fun! GitFiles()
    let choice = Finder('git ls-files', "Git files")
    if !empty(choice)
        execute "edit" choice[0]
    endif
endf

fun! SearchInside()
    let keyword  = inputdialog("KeyWord: ")
    if !empty(keyword)
        let choice = Finder('rg -i --column "'. keyword .'"', "Choose file")
        if !empty(choice)
            let l:file = split(choice[0], ':')[0]
            let row = split(choice[0], ':')[1]
            let column = split(choice[0], ':')[2]
            execute "edit" split(choice[0], ':')[0]
            cal cursor(row, column)
        endif
    endif
endf

fun! SearchReplace() abort
    let l:sword  = inputdialog("Source Word: ")
    if !empty(l:sword)
        let l:dword  = inputdialog("Destination Word: ")
        if !empty(l:dword)
            exec ":vimgrep /".l:sword."/gj **/*"
            copen
            exec "cfdo %s/".l:sword."/".l:dword."/gc"
            cclose
            "cfdo update
        endif
    endif
endf

fun! FindQuickFix()
    let qfentry = Finder(split(execute('clist'), "\n"), 'Choose qf entry')
    if !empty(qfentry)
        execute "crewind" matchstr(qfentry[0], '^\s*\d\+', )
    endif
endf
