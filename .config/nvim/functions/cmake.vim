function! CmakeSH()
    let l:category = input('Enter category: ')
    call FTerminal("cmake --help ". l:category ." | less && exit \n")
endfunction

function! LibcSH()
    let l:category = input('Enter category: ')
    call FTerminal("man ". l:category ." | less && exit \n")
endfunction

function! LibcSHUC()
    call FTerminal("man ". expand("<cword>") ." | less && exit \n")
endfunction
