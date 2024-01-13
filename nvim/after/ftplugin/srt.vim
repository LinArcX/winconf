set formatoptions-=cro

let sub_name = expand("%")[:-5]
let base = 40
let lower = "X1:10 X2:10 Y1:". base ." Y2:". base
let middle = "X1:10 X2:10 Y1:". base*2 ." Y2:". base*2
let large = "X1:10 X2:10 Y1:". base*4 ." Y2:". base*4

function! SearchLine()
    let line_number = input('enter line number: ')
    execute ":silent /^". line_number ."$/"
endfunction

function! YankPiece(mode)
    execute "normal! ^vj$hy"
    execute ":wincmd w"
    execute "normal! Go \<Esc>"
    execute "normal! Go \<Esc>\"_x"

    if a:mode==0
        execute "normal! pjA". lower ."\<Esc>o"
    elseif a:mode==1
        execute "normal! pjA". middle ."\<Esc>o"
    elseif a:mode==2
        execute "normal! pjA". large ."\<Esc>o"
    else
        echom "wrong mode!"
    endif

    call feedkeys('i')
endfunction

"call quickui#menu#clear('&Srt')
"" tsyan
"call quickui#menu#install('&Srt', [
"            \ [ '&tips', "vsplit ". sub_name ."_en.srt" ],
"            \ [ '&search', "call SearchLine()" ],
"            \ [ '&yank', "call YankPiece(0)" ],
"            \ [ 'y&ank2x', "call YankPiece(1)" ],
"            \ [ 'ya&nk3x', "call YankPiece(2)" ],
"            \ ], '<auto>', 'srt')
