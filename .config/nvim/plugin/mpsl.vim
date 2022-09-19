" List of colors: https://jonasjacek.github.io/colors/
" List of unicode emojies: https://en.wikipedia.org/wiki/Template:Emoji_(Unicode_block)
scriptencoding utf-32
au InsertEnter * hi statusline guibg=#8fbfdc guifg=016 ctermbg=206 ctermfg=016
au CmdwinEnter * hi statusline guibg=#8fbfdc guifg=016 ctermbg=074 ctermfg=016
au CmdwinLeave * hi statusline guibg=#8fbfdc guifg=016 ctermbg=065 ctermfg=007
au InsertLeave * hi statusline guibg=#8fbfdc guifg=016 ctermbg=065 ctermfg=007
au BufWrite * hi statusline guibg=#8fbfdc guifg=016 ctermbg=065 ctermfg=007
hi statusline guibg=#4e4e4e guifg=#adadad ctermbg=065 ctermfg=007
let g:currentmode={
            \ 'n'  : 'Normal',
            \ 'no' : 'Normal·Operator Pending',
            \ 'v'  : 'Visual',
            \ 'V'  : 'V·Line',
            \ '^V' : 'V·Block',
            \ 's'  : 'Select',
            \ 'S'  : 'S·Line',
            \ '^S' : 'S·Block',
            \ 'i'  : 'Insert',
            \ 'R'  : 'Replace',
            \ 'Rv' : 'V·Replace',
            \ 'c'  : 'Command',
            \ 'cv' : 'Vim Ex',
            \ 'ce' : 'Ex',
            \ 'r'  : 'Prompt',
            \ 'rm' : 'More',
            \ 'r?' : 'Confirm',
            \ '!'  : 'Shell',
            \ 't'  : 'Terminal'
            \}

function! GitBranch()
    let l:branchname = system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
    return strlen(l:branchname) > 0?'  '.l:branchname.' ':' '
endfunction

function! ModeCurrent() abort
    let l:modecurrent = mode()
    " use get() -> fails safely, since ^V doesn't seem to register
    " 3rd arg is used when return of mode() == 0, which is case with ^V
    " thus, ^V fails -> returns 0 -> replaced with 'V Block'
    let l:modelist = toupper(get(g:currentmode, l:modecurrent, 'V·Block '))
    if (match(l:modelist,"NORMAL") == 0)
        exe 'hi! statusline ctermbg=065 ctermfg=007'
    elseif (match(l:modelist,"VISUAL") == 0)
        exe 'hi! statusline ctermbg=137 ctermfg=016'
    elseif (match(l:modelist,"V.BLOCK") == 0)
        exe 'hi! statusline ctermbg=137 ctermfg=016'
    elseif (match(l:modelist,"INSERT") == 0)
        exe 'hi! statusline ctermbg=206 ctermfg=016'
    elseif (match(l:modelist,"COMMAND") == 0)
        exe 'hi! statusline ctermbg=074 ctermfg=016'
    else
        exe 'hi! statusline ctermbg=065 ctermfg=007'
    endif

    let l:current_status_mode = l:modelist
    return l:current_status_mode
endfunction

" Find out current buffer's size and output it.
function! FileSize()
    let bytes = getfsize(expand('%:p'))
    if (bytes >= 1024)
        let kbytes = bytes / 1024
    endif
    if (exists('kbytes') && kbytes >= 1000)
        let mbytes = kbytes / 1000
    endif
    if bytes <= 0
        return '0'
    endif
    if (exists('mbytes'))
        return mbytes . 'MB '
    elseif (exists('kbytes'))
        return kbytes . 'KB '
    else
        return bytes . 'B '
    endif
endfunction

function! ReadOnly()
    if &readonly || !&modifiable
        return ''
    else
        return ''
endfunction

function! FilePermission()
    return getfperm(expand('%:p'))
endfunction

set laststatus=2
set statusline+=%0*\ %{ModeCurrent()}\ %1*\%{GitBranch()}\%#warningmsg#
set statusline+=
set statusline+=%*\%2*\ %=\%7*\%3*\ %{ReadOnly()}\ %4*\ %{nr2char(0x1f4dd)}\%1*\ %{FilePermission()}\ %5*\ %{nr2char(0x1f47d)}
set statusline+=%6*\ %{(&fenc!=''?&fenc:&enc)}\[%{&ff}]\ |
set statusline+=%1*\ %-3(%{FileSize()}%)\%1*\ %3p%%\ \ %l:\%3c

hi User1 ctermbg=236 ctermfg=007 " Grey/Silver
hi User2 ctermbg=239 ctermfg=007 " Grey/Silver
hi User3 ctermbg=239 ctermfg=184 " Grey/Yello
hi User4 ctermbg=236 ctermfg=41  " Black/Spring-Green
hi User5 ctermbg=233 ctermfg=39  " Black/Sky-Blue
hi User6 ctermbg=233 ctermfg=007 " Black/Sky-Blue
hi User7 ctermbg=233 ctermfg=39  " Silver/Sky-Blue
hi User8 ctermbg=233 ctermfg=39  " Silver/RED
