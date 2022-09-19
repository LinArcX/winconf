call quickui#menu#clear('&C')
call quickui#menu#install('&C', [
            \ [ '&extract-variable', ":call ExtractVariable()" ],
            \ [ 'e&xtract-method', ":call ExtractMethod()" ],
            \ ], '<auto>', 'c')
