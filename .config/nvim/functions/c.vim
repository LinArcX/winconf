function! ExtractVariable()
    let var = input('variable name: ')
    execute "normal! \<S-^>iauto ".var." = "
endfunction

function! ExtractMethod() range
    let name  = inputdialog("Name of new method:")
    let rType = inputdialog("Enter Return Type:")
    let line  = inputdialog("Line to put function:")
    "     exe "normal! :".line."\<CR>"
    execute "normal! ma"
    '<
    exe "normal! O\<BS>".rType." ".name."()\<CR>{\<Esc>"
    '>
    exe "normal! oreturn ;\<CR>}\<Esc>k"
    s/return/\/\/ return/ge
    normal! j%
    normal! kf(
    "     exe "normal! yyPi// = \<Esc>wdwA;\<Esc>"
    normal! ==
    normal! j0w
    exe "normal! 'a3k0v9j\<S-$>d :".line."\<CR>p"
endfunction
