" uncap_ex.vim: Tolerate typos like :Wq, :Q, or :Qa and do what I mean,
" including any arguments or modifiers; I fat-finger these commands a lot
" because I type them so rapidly, and they don't correspond to any other
" commands I use
"
" Author: Tom Ryder <tom@sanctum.geek.nz>
" License: Same as Vim itself
"
if exists('g:loaded_uncap_ex') || &compatible
    finish
endif
if !has('user_commands') || v:version < 600
    finish
endif
let g:loaded_uncap_ex = 1

" Define commands
command -bang -bar -complete=file -nargs=?
            \ E
            \ edit<bang> <args>
command -bang -bar -complete=file -nargs=?
            \ W
            \ write<bang> <args>
command -bang -bar -complete=file -nargs=?
            \ WQ
            \ wq<bang> <args>
command -bang -bar -complete=file -nargs=?
            \ Wq
            \ wq<bang> <args>
command -bang -bar
            \ Q
            \ quit<bang>
command -bang -bar
            \ Qa
            \ qall<bang>
command -bang -bar
            \ QA
            \ qall<bang>
command -bang -bar
            \ Wa
            \ wall<bang>
command -bang -bar
            \ WA
            \ wa<bang>

" Delete Trailing White Spaces(after save the file)
function! DeleteTrailingWS()
    execute "normal! mz"
    %s/\s\+$//ge
    exe "normal! 'z"
endfunction
autocmd BufWrite * :call DeleteTrailingWS()

function TrimEndLines()
    let save_cursor = getpos(".")
    silent! %s#\($\n\s*\)\+\%$##
    call setpos('.', save_cursor)
endfunction
autocmd BufWritePre * call TrimEndLines()

" Switch to English - function
function! EnglishType()
    " To switch back from Arabic
    set keymap= " Restore default (US) keyboard layout
    set norightleft
endfunction

" Switch to Arabic - function
function! ArabicType()
    set keymap=arabic-pc "Modified keymap. File in ~/.vim/keymap/
    set rightleft
endfunction

function! ShowTextBox(...)
    let content = a:2
    let opts = {"close":"button", "title":a:1}
    call quickui#textbox#open(content, opts)
endfunction

function! ExecCommands(...)
    set colorcolumn=0
    let x = ''
    redir => x
    "exe 'silent! '. a:1
    :sil! exe a:2
    redir END
    let x = substitute(x, '[\n\r]\+\%$', '', 'g')
    let content = filter(split(x, "\n"), 'v:key != ""')
    let opts = {"close":"button", "title":a:1}
    call quickui#textbox#open(content, opts)
endfunction

function! MakeSession(overwrite)
    let lists_of_dirs = split(getcwd(), '/')
    let lenght_of_dirs = len(lists_of_dirs)
    let parent_directory = get(lists_of_dirs, lenght_of_dirs - 2)
    let directory = get(lists_of_dirs, lenght_of_dirs - 1)
    let final = parent_directory . "_" . directory

    let b:sessiondir = $HOME . "/.config/nvim/sessions/"
    if (filewritable(b:sessiondir) != 2)
        exe 'silent !mkdir -p ' b:sessiondir
        redraw!
    endif
    let b:filename = b:sessiondir . final . '.vim'
    if a:overwrite == 0 && !empty(glob(b:filename))
        return
    endif
    exe "mksession! " . b:filename
endfunction

function! LoadSession()
    let lists_of_dirs = split(getcwd(), '/')
    let lenght_of_dirs = len(lists_of_dirs)
    let parent_directory = get(lists_of_dirs, lenght_of_dirs - 2)
    let directory = get(lists_of_dirs, lenght_of_dirs - 1)
    let final = parent_directory . "_" . directory

    let b:sessiondir = $HOME . "/.config/nvim/sessions/"
    let b:sessionfile = b:sessiondir . final . ".vim"
    if (filereadable(b:sessionfile))
        exe 'source ' b:sessionfile
        if filereadable(".nvimrc")
            exe 'source .nvimrc'
        endif
    else
        echo "No session loaded."
    endif
endfunction

function! ShowTree()
    exec("terminal")
    let l:tid = b:terminal_job_id
    call jobsend(l:tid, "find | sed 's|[^/]*/|- |g' | less && exit \n")
endfunction

function! OpenHelp(...)
    let l:page = a:1
    exec("terminal")
    let l:tid = b:terminal_job_id
    call jobsend(l:tid, "nvim -c 'h " . l:page . "' && exit \n")
endfunction

function! SwapLines(n1, n2)
    let line1 = getline(a:n1)
    let line2 = getline(a:n2)
    call setline(a:n1, line2)
    call setline(a:n2, line1)
endfunction

function! SwapUp()
    let n = line('.')
    if n == 1
        return
    endif

    call SwapLines(n, n - 1)
    exec n - 1
endfunction

function! SwapDown()
    let n = line('.')
    if n == line('$')
        return
    endif

    call SwapLines(n, n + 1)
    exec n + 1
endfunction

function! FTerminal(...)
    exec("terminal")
    if exists("a:1")
        let l:tid = b:terminal_job_id
        call jobsend(l:tid, a:1)
    endif
endfunction

function! HTerminal(...)
    new term://bash
    wincmd J | resize 1
    call mpa#animate(a:1, a:2)
    if exists("a:3")
        let l:tid = b:terminal_job_id
        call jobsend(l:tid, a:3)
    endif
endfunction

function! VTerminal(...)
    vnew term://bash
    vertical resize 10
    call mpa#animate(a:1, a:2)
    if exists("a:3")
        let l:tid = b:terminal_job_id
        call jobsend(l:tid, a:3)
    endif
endfunction

function! HBTerminal(...)
    new term://bash
    wincmd J | resize 1
    call mpa#animate(a:1, a:2)
    if exists("a:3")
        let l:tid = b:terminal_job_id
        call jobsend(l:tid, a:3)
    endif
endfunction

function! VBTerminal(...)
    vnew term://bash
    vertical resize 10
    call mpa#animate(a:1, a:2)
    if exists("a:3")
        let l:tid = b:terminal_job_id
        call jobsend(l:tid, a:3)
    endif
endfunction

"if exists("a:1")
"    if a:1==1
"        new term://bash
"        wincmd J | resize 1
"        if exists("a:2")
"            call mpa#animate(a:2, a:3)
"        endif
"    elseif a:1==2
"        vnew term://bash
"        vertical resize 10
"        if exists("a:2")
"            call mpa#animate(a:2, a:3)
"        endif
"    elseif a:1==3
"    else
"        echom "wrong mode!"
"    endif
"endif
