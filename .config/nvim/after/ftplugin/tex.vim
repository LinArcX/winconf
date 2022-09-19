" Extract Variable
function! BuildTexFile()
    let var = expand('%:t')
    execute ":!xelatex ".var."\<CR>"
endfunction

call quickui#menu#clear('&Tex')
call quickui#menu#install('&Tex', [
            \ [ '&preview', ":LLPStartPreview" ],
            \ [ '&build', "call BuildTexFile()" ],
            \ ], '<auto>', 'tex')

"
